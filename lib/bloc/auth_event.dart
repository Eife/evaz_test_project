// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';


sealed class AuthEvent {}

class AnonymInitialEvent extends AuthEvent {

}

class AnonymRegisterEvent extends AuthEvent {
  String firstName;
  String surname;
  String parentName;
  AnonymRegisterEvent({
    required this.firstName,
    required this.surname,
    required this.parentName,
  });
  
}
class CheckRegisterEvent extends AuthEvent {}
