import 'dart:math';
import 'package:monopoly_bank/model/Omnipotent%20data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monopoly_bank/ui/endDialog.dart';
import 'package:monopoly_bank/ui/homePage.dart';
import 'package:monopoly_bank/ui/views/calculator.dart';
import 'package:monopoly_bank/ui/views/player1_balance.dart';
import 'package:monopoly_bank/ui/views/player2_balance.dart';
import 'package:monopoly_bank/ui/views/player3_balance.dart';
import 'package:monopoly_bank/ui/views/player4_balance.dart';
import 'package:monopoly_bank/ui/views/transactionHistory.dart';
import 'package:provider/provider.dart';

import 'endgame.dart';

class TabBarList extends StatefulWidget {
  const TabBarList({Key key, this.creator, this.gameId}) : super(key: key);
  final bool creator;
  final gameId;

  @override
  _TabBarListState createState() => _TabBarListState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _TabBarListState extends State<TabBarList>
    with AutomaticKeepAliveClientMixin<TabBarList> {
  var gameId;

  Widget alertDialog;




  @override
  Widget build(BuildContext context) {
    gameId = widget.gameId;
    var omni = Provider.of<Omni>(context,listen: false);
    if (widget.creator) {
      gameId = Random().nextInt(99999) + 100000;
      omni.currentGameID = gameId.toString();
      FirebaseFirestore.instance
          .collection("games")
          .doc(gameId.toString())
          .set({
        "Working": "working",
        "player1": [
          {"collector": "", "payer": "", "currencyPower": "", "amount": ""}
        ],
        "player2": [
          {"collector": "", "payer": "", "currencyPower": "", "amount": ""}
        ],
        "player3": [
          {"collector": "", "payer": "", "currencyPower": "", "amount": ""}
        ],"player4":[{"collector":"","payer":"","currencyPower":"","amount":""}]
      });
      debugPrint("$gameId");
      WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              children: [
                Center(
                  child: Text(
                    "Party Code:",
                    style: TextStyle(
                        color: Colors.black87,
                        //   fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans"),
                  ),
                ),
                Center(
                  child: Text(
                    "$gameId",
                    style: TextStyle(
                        color: Colors.black87,
                        //   fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 95.0),
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFBFDBAE)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87))),
                )
              ],
            );
          }));

      return WillPopScope(onWillPop: ()async{
        await endGameDialog(context, true, gameId);
      },
        child: DefaultTabController(
            initialIndex: 0,
            length: 6,
            child: Scaffold(
              appBar: AppBar(leading:Padding(
                padding: const EdgeInsets.only(left:8.0,top: 10),
                child: Container(child: Text("$gameId"),),
              ),
                actions: [
                  TextButton(
                      onPressed: () {
                        return endGameDialog(context,widget.creator,gameId);
                        FirebaseFirestore.instance
                            .collection("games")
                            .doc(gameId.toString())
                            .delete();
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 3.0, 0, 4.0),
                            child: Icon(
                              FontAwesomeIcons.windowClose,
                              color: Colors.white70,
                              size: 13,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "EndGame",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ))
                ],
                backgroundColor: Colors.black45,
                elevation: 0,
                flexibleSpace: ClipRect(
                  child: Container(
                    color: Colors.black87,
                  ),
                ),
                bottom: ExtendedTabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: "Bank",
                    ),
                    Tab(
                      text: "Player1",
                    ),
                    Tab(text: "Player 2"),
                    Tab(text: "Player 3"),
                    Tab(
                      text: "Player 4",
                    ),
                    Tab(
                      text: "History",
                    )
                  ],
                ),
              ),
              body: ExtendedTabBarView(
                cacheExtent: 8,
                children: [
                  Calculator(draggableWidget: 1,gameId: gameId,),
                  FirstPlayerBalance(
                    creator: widget.creator,
                  ),
                  SecondPlayerBalance(
                    creator: widget.creator,
                  ),
                  ThirdPlayerBalance(
                    creator: widget.creator,
                  ),
                  FourthPlayerBalance(
                    creator: widget.creator,
                  ),
                  TransactionHistory(draggableWidget: 0)
                ],
              ),
            )),
      );
    } else {
      omni.currentGameID = gameId.toString();
      debugPrint(omni.currentGameID);
      FirebaseFirestore.instance.collection("games").doc(gameId.toString()).snapshots()..listen((event) {if(!event.exists)
      {
        endDialog(context);

      }
      });
      return WillPopScope(onWillPop: ()async{
        await endGameDialog(context, false, gameId);
      },
        child: DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Scaffold(
              appBar: AppBar(leading:Padding(
                padding: const EdgeInsets.only(left:8.0,top: 10),
                child: Container(child: Text("$gameId"),),
              ),actions: [
                TextButton(
                    onPressed: () {
                      return endGameDialog(context,widget.creator,gameId);
                      FirebaseFirestore.instance
                          .collection("games")
                          .doc(gameId.toString())
                          .delete();
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 3.0, 0, 4.0),
                          child: Icon(
                            FontAwesomeIcons.windowClose,
                            color: Colors.white70,
                            size: 13,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "EndGame",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ],
                    ))
              ],
                backgroundColor: Colors.black45,
                elevation: 0,
                flexibleSpace: ClipRect(
                  child: Container(
                    color: Colors.black87,
                  ),
                ),
                bottom: ExtendedTabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: "Player1",
                    ),
                    Tab(text: "Player 2"),
                    Tab(text: "Player 3"),
                    Tab(
                      text: "Player 4",
                    ),
                  ],
                ),
              ),
              body: ExtendedTabBarView(
                cacheExtent: 5,
                children: [
                  FirstPlayerBalance(
                    creator: widget.creator,
                  ),
                  SecondPlayerBalance(
                    creator: widget.creator,
                  ),
                  ThirdPlayerBalance(
                    creator: widget.creator,
                  ),
                  FourthPlayerBalance(
                    creator: widget.creator,
                  ),
                ],
              ),
            )),
      );
    }
  }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
