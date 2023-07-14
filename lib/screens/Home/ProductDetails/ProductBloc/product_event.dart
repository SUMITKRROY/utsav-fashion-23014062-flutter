part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}
class ProductEventhandler extends ProductEvent{

  String productId;
  String token;
  ProductEventhandler(this.productId,this.token);
}
class ProductDropDown extends ProductEvent{


  String token;
  ProductDropDown( this.token);
}
class ColorWashEventhandler extends ProductEvent{


  String token;
  String tagName;
  ColorWashEventhandler( this.token,this.tagName);
}
class CustomstockStatus extends ProductEvent{


  String token;
  String tagName;
  CustomstockStatus( this.token,this.tagName);
}
class SizeregularApi extends ProductEvent{


  String token;
  String tagName;
  SizeregularApi( this.token,this.tagName);
}
class TailoringServices extends ProductEvent{


  String token;
  TailoringServices( this.token);
}
class FallandEdging extends ProductEvent{


  String token;
  FallandEdging( this.token);
}


class MeasurementWomen extends ProductEvent{


  String token;
  String tagname;
  MeasurementWomen( this.token,this.tagname);
}
class Measurementmen extends ProductEvent{


  String token;
  Measurementmen( this.token);
}
class SalwarKameezStitching extends ProductEvent{


  String token;
  SalwarKameezStitching( this.token);
}
class LehengaStitching extends ProductEvent{


  String token;
  LehengaStitching( this.token);
}
class PetticoatStitching extends ProductEvent{


  String token;
  PetticoatStitching( this.token);
}
class BlouseStitchingSec extends ProductEvent{


  String token;
  BlouseStitchingSec( this.token);
}
class BlouseStitching extends ProductEvent{


  String token;
  BlouseStitching( this.token);
}
class NostoApiSimilarProduct extends ProductEvent{

  String productId;
  NostoApiSimilarProduct(this.productId);



}
class GetsizeChart extends ProductEvent {
  String itemcode;
  String keyword;
  String appid;
  String mescm;
  String mesinches;
  GetsizeChart(this.itemcode,this.keyword,this.appid,this.mescm,this.mesinches);
}
class UDesignApi extends ProductEvent {
  String itemcode;
  String customerid;
  String customeremail;
  String returnurl;
  String imageurl;
  String keyword;
  String appid;

  UDesignApi(this.itemcode,this.keyword,this.appid,this.customerid,this.customeremail,this.returnurl,this.imageurl);
}
class BandalProductApi extends ProductEvent {
  List<dynamic> productSkuList;
  String token;

  BandalProductApi(this.productSkuList,this.token );
}
