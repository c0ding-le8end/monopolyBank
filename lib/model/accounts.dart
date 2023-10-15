import 'package:monopoly_bank/model/transactions.dart';

class Account
{
  String name;

  Account({required this.name,required this.status,required this.balance});

  int status;
  double balance;
   List<Transactions> passBook=[];



}