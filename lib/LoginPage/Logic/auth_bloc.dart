import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/LoginPage/Data/login_api.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {

    on<VerifyUserEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final token = await repository.login(event.phone);
        if (token != null) {
          emit(Authenticated(token));
        } else {
          emit(AuthUserNotExists(event.phone));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });


    on<SubmitOtpEvent>((event, emit) async {
      emit(AuthLoading());
      // For now assume OTP is always "4749"
      if (event.otp == "4749") {
        if (event.exists) {
          final token = await repository.login(event.phone);
          emit(AuthOtpVerified(token!));
        } else {
          emit(AuthNeedsName(event.phone));
        }
      } else {
        emit(AuthFailure("Invalid OTP"));
      }
    });

    on<RegisterUserEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final token = await repository.register(event.phone, event.name);
        emit(Authenticated(token!));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<CheckAuthStatusEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final token = await repository.getToken();
        if (token != null) {
          emit(Authenticated(token));
        } else {
          emit(Unauthenticated());
        }
      } catch (_) {
        emit(Unauthenticated());
      }
    });

    on<SubmitPhoneEvent>((event, emit) async {
      emit(AuthLoading());
      final authRepo = AuthRepository();

      final token = await authRepo.login(event.phone);

      if (token != null) {
        emit(AuthOtpVerified(token));
      } else {
        emit(AuthNeedsName(event.phone));
      }
    });

    on<SubmitNameEvent>((event, emit) async {
      emit(AuthLoading());
      final authRepo = AuthRepository();

      final token = await authRepo.register(event.phone, event.name);

      if (token != null) {
        // Registration successful → show OTP screen
        emit(AuthOtpVerified(token));
      } else {
        emit(AuthFailure("Registration failed."));
      }
    });

    on<LogoutEvent>((event, emit) async {
      await repository.clearToken();
      emit(Unauthenticated());
    });

  }
}
