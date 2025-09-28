import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthUserExists extends AuthState {
  final String phone;
  AuthUserExists(this.phone);
}

class AuthUserNotExists extends AuthState {
  final String phone;
  AuthUserNotExists(this.phone);
}

class AuthOtpVerified extends AuthState {
  final String token;
  AuthOtpVerified(this.token);
}

class AuthNeedsName extends AuthState {
  final String phone;
  AuthNeedsName(this.phone);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}


class Authenticated extends AuthState {
  final String token;
  Authenticated(this.token);
}

class Unauthenticated extends AuthState {}
