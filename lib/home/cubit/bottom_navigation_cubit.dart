import 'package:bloc/bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit({required final int initialIndex}) : super(initialIndex);

  void changePage(final int index) => emit(index);
}
