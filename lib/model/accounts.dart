import 'package:monopoly_bank/model/transactions.dart';

class Account
{
  String name;

  Account({this.name, this.status, this.balance});

  int status;
  double balance;
   List<Transactions> passBook=[];

}