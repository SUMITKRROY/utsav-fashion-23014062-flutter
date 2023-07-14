part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}
class FilterLoading extends FilterState {}
class FilterSuccess extends FilterState {
  FuilterModel? filterModel;
  FilterSuccess(this.filterModel);
}
class FilterFailure extends FilterState {}
class FilterError extends FilterState {}