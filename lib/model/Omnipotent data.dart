import 'package:flutter/cupertino.dart';
import 'package:monopoly_bank/model/history.dart';
import 'package:monopoly_bank/model/transactions.dart';

import 'accounts.dart';

class Omni extends ChangeNotifier{
  Account player1 = Account(name: "player1", status: 0, balance: 15);
  Account player2 = Account(name: "player2", status: 0, balance: 15);
  Account player3 = Account(name: "player3", status: 0, balance: 15);
  Account player4 = Account(name: "player4", status: 0, balance: 15);
  History history = History();
  ScrollController scrollController;
  String selectedPlayer = "";
  String previousSelectedPlayer = "";
  String currencyPower = "";
  String payer = "", collector = "";
  double fundsPayed, fundsCollected;
  String input = "";


  bool pointStatus = false;

 updatePlayer1Passbook(Transactions transaction)
  {
    player1.passBook.add(transaction);
    notifyListeners();
  }

   updatePlayer2Passbook(Transactions transaction)
  {
    player2.passBook.add(transaction);
    notifyListeners();
  }

   updatePlayer3Passbook(Transactions transaction)
  {
    player3.passBook.add(transaction);
    notifyListeners();
  }

   updatePlayer4Passbook(Transactions transaction)
  {
    player4.passBook.add(transaction);
    notifyListeners();
  }

   updateHistory(Transactions transaction)
  {
    history.history.add(transaction);
    notifyListeners();
  }

  finishTransaction()
  {
    player1.status = 0;
    player2.status = 0;
    player3.status = 0;
    player4.status = 0;
    selectedPlayer = "";
    currencyPower = "";
    fundsCollected = 0;
    fundsPayed = 0;
    collector = "";
    payer = "";
    input = "";
    previousSelectedPlayer = "";
    pointStatus = false;
    notifyListeners();
  }

}