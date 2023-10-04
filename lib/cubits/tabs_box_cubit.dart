import 'package:flutter_bloc/flutter_bloc.dart';

class TabsBoxCubit extends Cubit<int>{
  TabsBoxCubit():super(0);

  setIndex(int index){
    emit(index);
  }
}