import 'package:hive/hive.dart';

part 'finance_model.g.dart';

@HiveType(typeId: 1)
class FinanceModel extends HiveObject { //extend HiveObject so we can edit and delete
   @HiveField(0)
  String details;
   @HiveField(1)
  double financeValue;
   @HiveField(2)
  DateTime date;
  FinanceModel({
    required this.details,
    required this.financeValue,
    required this.date,
  });
}


 //type this command in terminal after finish this file
 // flutter packages pub run build_runner build 
 // press enter