part of 'sign_bloc.dart';

@immutable
abstract class SignState {}

class SignInitial extends SignState {}
class SignSuccess extends SignState {}
class SignFailed extends SignState {}
class SignLoading extends SignState {}
