part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class WelcomeLoading extends WelcomeState {}

class WelcomeSuccess extends WelcomeState {
  // final CountriesModel getCountriesModel;
  // final SingleCountriesModel getSingleCountriesModel;
  // final CurrencyModel getCurrencyModel;

  final List<dynamic> getCountriesModel;
  final List<dynamic> getSingleCountriesModel;
  final Map<String,dynamic> getCurrencyModel;




  WelcomeSuccess(
      this.getCountriesModel,
      this.getSingleCountriesModel,
      this.getCurrencyModel,
      );
}

class WelcomeFailure extends WelcomeState {
  final List<dynamic> countries;
  final List<dynamic> Singlecountries;
  final Map<String, dynamic> currency;

  WelcomeFailure(
      this.countries,
      this.Singlecountries,
      this.currency,
      );
}
