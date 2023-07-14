import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  SignBloc() : super(SignInitial()) {
    on<SignEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignEventHendler>((event, emit) {

    });
  }
}
