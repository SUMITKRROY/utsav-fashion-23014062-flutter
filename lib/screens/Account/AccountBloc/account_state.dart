part of 'account_bloc.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}
class AccountLoading extends AccountState {}
class AccountSuccess extends AccountState {}
class AccountFaliure extends AccountState {}
class AccountServerError extends AccountState {}
