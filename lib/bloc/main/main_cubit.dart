import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState());

  void switchTap(int index) {
    emit(state.copyWith(selectIndex: index));
  }
}
