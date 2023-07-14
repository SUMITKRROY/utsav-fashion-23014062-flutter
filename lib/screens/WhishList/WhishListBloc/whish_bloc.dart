import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'whish_event.dart';
part 'whish_state.dart';

class WhishBloc extends Bloc<WhishEvent, WhishState> {
  WhishBloc() : super(WhishInitial()) {
    on<WhishEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
