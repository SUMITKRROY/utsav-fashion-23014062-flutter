import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'policy_event.dart';
part 'policy_state.dart';

class PolicyBloc extends Bloc<PolicyEvent, PolicyState> {
  PolicyBloc() : super(PolicyInitial()) {
    on<PolicyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
