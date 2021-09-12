import 'package:bloc/bloc.dart';
import 'package:lumberdash/lumberdash.dart';

class AppBlocObserver extends BlocObserver {
  // @override
  // void onChange(final BlocBase bloc, final Change change) {
  //   logMessage('onChange(${bloc.runtimeType}, $change)');

  //   super.onChange(bloc, change);
  // }

  @override
  void onClose(final BlocBase bloc) {
    logWarning('onClose(${bloc.runtimeType})');

    super.onClose(bloc);
  }

  @override
  void onCreate(final BlocBase bloc) {
    logWarning('onCreate(${bloc.runtimeType})');

    super.onCreate(bloc);
  }

  @override
  void onError(
    final BlocBase bloc,
    final Object error,
    final StackTrace stackTrace,
  ) {
    logError('onError(${bloc.runtimeType}, $error, $stackTrace)');

    super.onError(bloc, error, stackTrace);
  }

  // @override
  // void onTransition(final Bloc bloc, final Transition transition) {
  //   logger.v('onTransition:${bloc.runtimeType} $transition');

  //   super.onTransition(bloc, transition);
  // }

  @override
  void onEvent(final Bloc bloc, final Object? event) {
    logMessage('onEvent:${bloc.runtimeType} ${event.runtimeType} ');

    super.onEvent(bloc, event);
  }
}
