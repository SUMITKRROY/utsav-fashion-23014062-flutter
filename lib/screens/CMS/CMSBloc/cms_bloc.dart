import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cms_event.dart';
part 'cms_state.dart';

class CmsBloc extends Bloc<CmsEvent, CmsState> {
  CmsBloc() : super(CmsInitial()) {
    on<CmsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
