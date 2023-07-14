import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'term_event.dart';
part 'term_state.dart';

class TermBloc extends Bloc<TermEvent, TermState> {
  TermBloc() : super(TermInitial()) {
    on<TermEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
