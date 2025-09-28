

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyUserEvent extends AuthEvent {
  final String phone;
  VerifyUserEvent(this.phone);
}

class SubmitOtpEvent extends AuthEvent {
  final String phone;
  final String otp;
  final bool exists;
  SubmitOtpEvent({required this.phone, required this.otp, required this.exists});
}

class RegisterUserEvent extends AuthEvent {
  final String phone;
  final String name;
  RegisterUserEvent({required this.phone, required this.name});
}

class SubmitPhoneEvent extends AuthEvent {
  final String phone;
  SubmitPhoneEvent(this.phone);
}

class SubmitNameEvent extends AuthEvent {
  final String phone;
  final String name;
  SubmitNameEvent(this.phone, this.name);
}


class CheckAuthStatusEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

