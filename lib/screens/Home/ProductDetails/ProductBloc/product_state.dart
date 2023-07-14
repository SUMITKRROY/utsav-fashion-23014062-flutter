part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoding extends ProductState {}
class ProductDropDownLoding extends ProductState {}
class ProductSuccess extends ProductState {
  Map<String,dynamic>product;
  // ProductModel product;
  ProductSuccess(this.product);
}
class ProductFailure extends ProductState {
  Map<String,dynamic>error;
  ProductFailure(this.error);

}
class ProductServer extends ProductState {
  Map<String,dynamic>error;
  ProductServer(this.error);
}




///
class ProductDropDownSuccess extends ProductState {
  Map<String,dynamic>product;
  // ProductModel product;
  ProductDropDownSuccess(this.product);
}
class ProductDropDownFailure extends ProductState {
  Map<String,dynamic>error;
  ProductDropDownFailure(this.error);

}
///


///
class ProductSimilarSuccess extends ProductState {

}
class ProductSimilarFailure extends ProductState {
  var error;
  ProductSimilarFailure(this.error);

}
///
class SizeChartDataSuccess extends ProductState {
  Map<String, dynamic> SizeChartDatajsoncm;
  Map<String, dynamic> SizeChartDatajsoninch;

  // ColorandWashCareDataModel colorWashDataModel;
  SizeChartDataSuccess(this.SizeChartDatajsoncm, this.SizeChartDatajsoninch);
}
class SizeChartDataFailure extends ProductState {
  var error;
  SizeChartDataFailure(this.error);

}
///