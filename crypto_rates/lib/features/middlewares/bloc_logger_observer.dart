import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class BlocLoggerObserver extends BlocObserver {
  const BlocLoggerObserver({required this.logger});

  final Logger logger;

  @override
  @mustCallSuper
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    logger.i('🟪 ${bloc.runtimeType} recive event: ${event.runtimeType}');
  }

  @override
  @mustCallSuper
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    final sb = StringBuffer();
    sb.write('🟪 State of ${bloc.runtimeType} changes: ');
    sb.write(
        '${change.currentState.runtimeType} -> ${change.nextState.runtimeType}');

    logger.i(sb.toString());
  }

  @override
  @mustCallSuper
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);

    final sb = StringBuffer();
    sb.write(
        '🟪 Transition ${bloc.runtimeType} with event ${transition.event.runtimeType}: ');
    sb.write(
        '${transition.currentState.runtimeType} -> ${transition.nextState.runtimeType}');

    logger.i(sb.toString());
  }

  @override
  @mustCallSuper
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    logger.e('🟥 ${bloc.runtimeType} onError',
        error: error, stackTrace: stackTrace);
  }
}
