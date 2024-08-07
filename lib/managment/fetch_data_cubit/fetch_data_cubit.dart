import 'package:bloc/bloc.dart';
import 'package:finance_app/models/finance_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit() : super(FetchDataInitial());
  List<FinanceModel> finanacList = [];
  List<FinanceModel> todayFinanacList = [];
  List<FinanceModel> dateFinanceList = [];
  double sum = 0.0;
  double todaySum = 0.0;
  DateTime selectedTime = DateTime.now();

  fetchData() {
    emit(FetchDataLoading());

    try {
      //hive return box but we need list , to convert box to list we put .value.tolist
      finanacList = Hive.box<FinanceModel>('financeBox').values.toList();
      todayFinanacList = finanacList
        .where(
          (element) =>
              DateFormat.yMMMEd().format(element.date) ==
              DateFormat.yMMMEd().format(DateTime.now()),
        )
        .toList();
      //this method will get all values of the day
      fetchDateDate(dateTime: selectedTime);

      //this method to sum all values to get my balance
      sum = 0;
      todaySum = 0; // make the sum = 0 after fetch the value then do the method
      for (var element in finanacList) {
        sum += element.financeValue;
      }
      for (var element in todayFinanacList) {
        todaySum += element.financeValue;
      }
      emit(FetchDataSuccess(sum, todaySum));
    } on Exception catch (e) {
      emit(
        FetchDataFailure(
          e.toString(),
        ),
      );
    }

    return finanacList;
  }

  fetchDateDate({DateTime? dateTime}) {
    dateFinanceList = finanacList
        .where(
          (element) =>
              DateFormat.yMMMEd().format(element.date) ==
              DateFormat.yMMMEd().format(dateTime ?? DateTime.now()),
        )
        .toList();
  }
}
