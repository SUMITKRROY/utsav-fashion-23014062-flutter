part of 'onboard_bloc.dart';

@immutable
abstract class OnboardState {}

class OnboardInitial extends OnboardState {}
/// Onboard state
class OnboardSuccess extends OnboardState {
  final Map<String,dynamic> categoriesModel;
  // final CategoriesModel categoriesModel;


  OnboardSuccess( this.categoriesModel);
}

class OnboardLoading extends OnboardState {}

class OnboardFailure extends OnboardState {
  final Map<String,dynamic> error;
  OnboardFailure(this.error);
}

class OnboardServerError extends OnboardState {
  final  dynamic  error;
  OnboardServerError(this.error);
}


/// Onboard state
class AuthSuccess extends OnboardState {
  // final Map<String,dynamic> OnboardModel;
  final String token;


  AuthSuccess( this.token);
}

class AuthLoading extends OnboardState {}

class AuthFailure extends OnboardState {
  final Map<String,dynamic> error;
  AuthFailure(this.error);
}

class AuthServerError extends OnboardState {
  final  dynamic  error;
  AuthServerError(this.error);
}