import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:monopoly_bank/model/history.dart';
import 'package:monopoly_bank/model/transactions.dart';

import 'accounts.dart';

class Omni extends ChangeNotifier{
  bool existence=true;
  Account player1 = Account(name: "player1", status: 0, balance: 15);
  Account player2 = Account(name: "player2", status: 0, balance: 15);
  Account player3 = Account(name: "player3", status: 0, balance: 15);
  Account player4 = Account(name: "player4", status: 0, balance: 15);
  History history = History();
  ScrollController? scrollController;
  String selectedPlayer = "";
  String previousSelectedPlayer = "";
  String currencyPower = "";
  String payer = "", collector = "";
  double? fundsPayed, fundsCollected;
  String input = "";
  List<Map> player1Data=[];
  List<Map> player2Data=[];
  List<Map> player3Data=[];
  List<Map> player4Data=[];
  Map? currentTransaction;
  var currentGameID;



  bool pointStatus = false;

 updatePlayer1Passbook(Transactions transaction)
  { currentTransaction={'payer':transaction.payer,'collector':transaction.collector,'amount':transaction.amount,'currencyPower':currencyPower};
    player1Data.add(currentTransaction!);
    FirebaseFirestore.instance.collection("games").doc(currentGameID).update({'player1':player1Data});
    player1.passBook.add(transaction);
    notifyListeners();
  }

   updatePlayer2Passbook(Transactions transaction)
  {
    currentTransaction={'payer':transaction.payer,'collector':transaction.collector,'amount':transaction.amount,'currencyPower':currencyPower};
    player2Data.add(currentTransaction!);
    FirebaseFirestore.instance.collection("games").doc(currentGameID).update({'player2':player2Data});
    player2.passBook.add(transaction);

    notifyListeners();
  }

   updatePlayer3Passbook(Transactions transaction)
  {
    currentTransaction={'payer':transaction.payer,'collector':transaction.collector,'amount':transaction.amount,'currencyPower':currencyPower};
    player3Data.add(currentTransaction!);
    FirebaseFirestore.instance.collection("games").doc(currentGameID).update({'player3':player3Data});
    player3.passBook.add(transaction);
    notifyListeners();
  }

   updatePlayer4Passbook(Transactions transaction)
  {currentTransaction={'payer':transaction.payer,'collector':transaction.collector,'amount':transaction.amount,'currencyPower':currencyPower};
  player4Data.add(currentTransaction!);
  FirebaseFirestore.instance.collection("games").doc(currentGameID).update({'player4':player4Data});
    player4.passBook.add(transaction);
    notifyListeners();
  }

   updateHistory(Transactions transaction)
  {
    history.history.add(transaction);
    notifyListeners();
  }

  finishTransaction({bool gameEnded:false})
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
    if(gameEnded)
      {player1 = Account(name: "player1", status: 0, balance: 15);
        player2=Account(name: "player2", status: 0, balance: 15);
        player3=Account(name: "player3", status: 0, balance: 15);
        player4=Account(name: "player4", status: 0, balance: 15);
        history=History();
      }
    notifyListeners();
  }
  deleteGame()
  {
    existence=false;
    notifyListeners();
  }

}