part of 'navbar_bloc.dart';

@immutable
abstract class NavbarState {}

class NavbarInitial extends NavbarState {}

class NavbarLoading extends NavbarState {}
class NavbarSuccess extends NavbarState {
  final Map<String,dynamic> getData;
  // final ActivityListModel activityListModel;


  NavbarSuccess(this.getData);
}
class NavbarFailure extends NavbarState {

  final Map<String,dynamic> error;
  NavbarFailure(this.error);
}
