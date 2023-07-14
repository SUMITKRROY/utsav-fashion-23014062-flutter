import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recover_event.dart';
part 'recover_state.dart';

class RecoverBloc extends Bloc<RecoverEvent, RecoverState> {
  RecoverBloc() : super(RecoverInitial()) {
    on<RecoverEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
