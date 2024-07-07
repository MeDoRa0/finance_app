import 'package:bloc/bloc.dart';
import 'package:finance_app/models/finance_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'add_data_state.dart';

class AddDataCubit extends Cubit<AddDataState> {
  AddDataCubit() : super(AddDataInitial());

  addData(FinanceModel financeModel) async {
    emit(AddDataLoading());
    try {
      //this method to add data into box
      await Hive.box<FinanceModel>('financeBox').add(financeModel);
      emit(
        AddDataSuccess(),
      );
    } on Exception catch (e) {
      emit(
        AddDataFailure(
          e.toString(),
        ),
      );
    }
  }
}
