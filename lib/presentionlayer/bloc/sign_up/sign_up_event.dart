part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpButtonPressedEvent extends SignUpEvent {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String role;

  SignUpButtonPressedEvent({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.role,
  });

  @override
  List<Object> get props => [firstName, lastName, phoneNumber, role];
}
