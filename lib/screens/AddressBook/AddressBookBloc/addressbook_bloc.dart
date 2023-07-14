import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addressbook_event.dart';
part 'addressbook_state.dart';

class AddressbookBloc extends Bloc<AddressbookEvent, AddressbookState> {
  AddressbookBloc() : super(AddressbookInitial()) {
    on<AddressbookEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
