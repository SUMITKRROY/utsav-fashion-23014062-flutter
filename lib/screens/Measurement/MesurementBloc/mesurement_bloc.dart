import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mesurement_event.dart';
part 'mesurement_state.dart';

class MesurementBloc extends Bloc<MesurementEvent, MesurementState> {
  MesurementBloc() : super(MesurementInitial()) {
    on<MesurementEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
