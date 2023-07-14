import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bandle_product_event.dart';
part 'bandle_product_state.dart';

class BandleProductBloc extends Bloc<BandleProductEvent, BandleProductState> {
  BandleProductBloc() : super(BandleProductInitial()) {
    on<BandleProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
