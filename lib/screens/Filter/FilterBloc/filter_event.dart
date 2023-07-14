part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent {}


class FilterHandler extends FilterEvent{
  String token;
  FilterHandler(this.token);
}
