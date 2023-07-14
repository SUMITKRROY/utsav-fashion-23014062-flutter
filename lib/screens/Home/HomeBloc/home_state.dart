part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeCategoriesLoding extends HomeState {}
class HomeCategoriesSuccess extends HomeState {
  Map<String,dynamic> Home;
  // HomeModel Home;
  HomeCategoriesSuccess(this.Home);
}
class HomeCategoriesFailure extends HomeState {
  Map<String,dynamic>error;
  HomeCategoriesFailure(this.error);

}
class HomeCategoriesServer extends HomeState {
  Map<String,dynamic>error;
  HomeCategoriesServer(this.error);
}


///
class HomeUrlKeyLoding extends HomeState {}
class HomeUrlKeySuccess extends HomeState {
  List<dynamic> urlKeyModel;
  // UrlKeyModel urlKeyModel;
  HomeUrlKeySuccess(this.urlKeyModel);
}
class HomeUrlKeyFailure extends HomeState {
  Map<String,dynamic>error;
  HomeUrlKeyFailure(this.error);

}

///
class homeScreenLoading extends HomeState {}

class SuccessHomeData extends HomeState {
  final Map<String,dynamic> homeScreenDataModel;
  // final HomeScreenDataModel homeScreenDataModel;
  SuccessHomeData(this.homeScreenDataModel);
}

class FailureData extends HomeState {
  String? error;
  FailureData(this.error);

}