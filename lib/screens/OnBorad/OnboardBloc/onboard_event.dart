part of 'onboard_bloc.dart';

@immutable
abstract class OnboardEvent {}
///   Onboard state Event
class OnboardEventHandler extends OnboardEvent {

  String token;
  OnboardEventHandler(this.token);
}
class AutheHendler extends OnboardEvent {

  String username;
  String password;
  AutheHendler( this.username,this.password);
}