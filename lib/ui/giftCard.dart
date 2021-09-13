import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_bank/model/Omnipotent%20data.dart';
import 'package:monopoly_bank/model/accounts.dart';
import 'package:monopoly_bank/model/history.dart';
import 'package:monopoly_bank/model/transactions.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

class GiftCard extends StatefulWidget {
const  GiftCard(
      {Key key,
      })
      : super(key: key);


  @override
  _GiftCardState createState() => _GiftCardState(
   );
}

class _GiftCardState extends State<GiftCard> {
  double giftCardInput = 0;
  List<RaisedButton> giftCardRow1;
  List<RaisedButton> giftCardRow2;
  List<RaisedButton> giftCardRow3;
  List giftCardRow4;
Transactions current;

  @override
  Widget build(BuildContext context) {
    var omni=context.read<Omni>();
    createRow(context,omni);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Consumer<Omni>(builder:(context,omni,child)
          {
            return SimpleDialog(
              insetPadding: EdgeInsets.all(15),
              elevation: 5,
              backgroundColor: Colors.transparent,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.close),
                      onPressed: () {
                        giftCardInput = 0.0;
                        omni.currencyPower = '';
                        Navigator.pop(context);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(height: 50,
                    child: Card(color: Colors.white,elevation: 8,
                      child: Center(
                        child: Text(
                          "${omni.currencyPower=="K"?(giftCardInput * 1000):giftCardInput}${omni.currencyPower}",
                          style: TextStyle(
                              color: Colors.black87,
                              //   fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              fontFamily: "Federant"),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 10),
                  child: Column(
                    children: [
                      Row(
                        children: List.generate(
                            3,
                                (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: giftCardRow1[index],
                            )),
                      ),
                      Row(
                        children: List.generate(
                            3,
                                (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: giftCardRow2[index],
                            )),
                      ),
                      Row(
                        children: List.generate(
                            3,
                                (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: giftCardRow3[index],
                            )),
                      ),
                      Row(
                        children: List.generate(
                            3,
                                (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: giftCardRow4[index],
                            )),
                      )
                    ],
                  ),
                )
              ],
            );
          },
      ),
    );
  }

  createRow(BuildContext context, Omni omni) {
    giftCardRow1 = [
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (() {
          current = Transactions(payer: "Bank", amount: "1", currencyType: "M");
          omni.currencyPower = "M";
          setState(() {
            giftCardInput = 1;
          });
        }),
        child: Text(
          "1M",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: () {
          current = Transactions(payer: "Bank", amount: "2", currencyType: "M");
          omni.currencyPower = "M";
          setState(() {
            giftCardInput = 2;
          });
        },
        child: Text(
          "2M",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: () {
          current =
              Transactions(payer: "Bank", amount: "1.5", currencyType: "M");
          omni.currencyPower = "M";
          setState(() {
            giftCardInput = 1.5;
          });
        },
        child: Text(
          "1.5M",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
    ];
    giftCardRow2 = [
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: () {
          current =
              Transactions(payer: "Bank", amount: "100", currencyType: "K");
          omni.currencyPower = "K";
          setState(() {
            giftCardInput = 0.1;
          });
        },
        child: Text(
          "100K",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: () {
          current = Transactions(payer: "Bank", amount: "2", currencyType: "K");
          omni.currencyPower = "K";
          setState(() {
            giftCardInput = 0.15;
          });
        },
        child: Text(
          "150K",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: () {
          current = Transactions(payer: "Bank", amount: "2", currencyType: "K");
          omni.currencyPower = "K";
          setState(() {
            giftCardInput = 0.20;
          });
        },
        child: Text(
          "200K",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
    ];
    giftCardRow3 = [
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: () {
          current = Transactions(payer: "Bank", amount: "2", currencyType: "K");
          omni.currencyPower = "K";
          setState(() {
            giftCardInput = 0.25;
          });
        },
        child: Text(
          "250K",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: () {
          current = Transactions(payer: "Bank", amount: "2", currencyType: "K");
          omni.currencyPower = "K";
          setState(() {
            giftCardInput = 0.3;
          });
        },
        child: Text(
          "300K",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: () {
          current = Transactions(payer: "Bank", amount: "2", currencyType: "K");
          omni.currencyPower = "K";
          setState(() {
            giftCardInput = 0.5;
          });
        },
        child: Text(
          "500K",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      )
    ];
    giftCardRow4 = [
      Visibility(maintainSize:true,maintainAnimation:true,maintainState:true,visible: (omni.player1.status +
          omni.player2.status +
          omni.player3.status +
          omni.player4.status !=
          1 )?false:true,
        child: RaisedButton(
            color: Color(0xFFBFDBAE),
            onPressed: (giftCardInput==0)
                ? () {
              showSimpleNotification(Center(
                child: Text("Choose an amount first!",style:TextStyle(
                    fontFamily: "OpenSans",
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 3)),
              ),background: Color(0xFFBFDBAE),);
                  }
                : (() {
                    switch (omni.selectedPlayer) {
                      case "1":
                        current = Transactions(
                            payer: "Bank",
                            collector: "Player 1",
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);

                          omni.player1.balance = omni.player1.balance + giftCardInput;
                          debugPrint("${omni.player1.balance}");
                          omni.updatePlayer1Passbook(current);
                          giftCardInput = 0;

                          omni.currencyPower = '';
                          omni.player1.status = 0;
                          omni.previousSelectedPlayer = "";

                          omni.collector = "";
                          omni.selectedPlayer = "";
                        });
                        break;
                      case "2":
                        current = Transactions(
                            payer: "Bank",
                            collector: "Player 2",
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player2.balance = omni.player2.balance + giftCardInput;
                          debugPrint("${omni.player2.balance}");
                          omni.updatePlayer2Passbook(current);
                          giftCardInput = 0;
                          omni.currencyPower = '';
                          omni.player2.status = 0;
                          omni.previousSelectedPlayer = "";

                          omni.collector = "";
                          omni.selectedPlayer = "";
                        });

                        break;
                      case "3":
                        current = Transactions(
                            payer: "Bank",
                            collector: "Player 3",
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player3.balance = omni.player3.balance + giftCardInput;
                          debugPrint("${omni.player3.balance}");
                          omni.updatePlayer3Passbook(current);
                          giftCardInput = 0;
                          omni.currencyPower = '';
                          omni.player3.status = 0;
                          omni.previousSelectedPlayer = "";

                          omni.collector = "";
                          omni.selectedPlayer = "";
                        });

                        break;
                      case "4":
                        current = Transactions(
                            payer: "Bank",
                           collector: "Player 4",
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player4.balance = omni.player4.balance + giftCardInput;
                          debugPrint("${omni.player4.balance}");
                          omni.updatePlayer4Passbook(current);
                          giftCardInput = 0.0;
                          omni.currencyPower = '';
                          omni.player4.status = 0;
                          omni.previousSelectedPlayer = "";

                          omni.collector = "";
                          omni.selectedPlayer = "";
                        });

                        break;
                      default:
                        debugPrint("Probably this won't happen..Right?!");
                    }
                    Navigator.pop(context);
                    omni.finishTransaction();
                  }),
            child: Text(
              "+",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            )),
      ),
      Visibility(maintainSize:true,maintainAnimation:true,maintainState:true,visible: (omni.player1.status +
          omni.player2.status +
          omni.player3.status +
          omni.player4.status !=
          2 )?false:true,
        child: RaisedButton(
            color: Color(0xFFBFDBAE),

            onPressed: (giftCardInput==0)
                ? () {
              showSimpleNotification(Center(
                child: Text("Choose an amount first!",style:TextStyle(
                    fontFamily: "OpenSans",
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 3)),
              ),background: Color(0xFFBFDBAE),);
                  }
                : (() {
                    current = Transactions(
                        amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                        currencyType: omni.currencyPower);
                    switch (omni.payer) {
                      case "1":
                        current.payer = "Player 1";
                        setState(() {
                          omni.player1.balance = omni.player1.balance - giftCardInput;
                        });
                        break;
                      case "2":
                        current.payer = "Player 2";
                        setState(() {
                          omni.player2.balance = omni.player2.balance - giftCardInput;
                        });

                        break;
                      case "3":
                        current.payer = "Player 3";
                        setState(() {
                          omni.player3.balance = omni.player3.balance - giftCardInput;
                        });

                        break;
                      case "4":
                        current.payer = "Player 4";
                        setState(() {
                          omni.player4.balance = omni.player4.balance - giftCardInput;
                          ;
                        });

                        break;
                      default:
                        debugPrint("Problem in omni.payer....omni.payer=$omni.payer");
                    }
                    switch (omni.collector) {
                      case "1":
                        current.collector = "Player 1";
                        setState(() {
                          omni.player1.balance = omni.player1.balance + giftCardInput;
                        });
                        break;
                      case "2":
                        current.collector = "Player 2";
                        setState(() {
                          omni.player2.balance = omni.player2.balance + giftCardInput;
                        });

                        break;
                      case "3":
                        current.collector = "Player 3";
                        setState(() {
                          omni.player3.balance = omni.player3.balance + giftCardInput;
                        });

                        break;
                      case "4":
                        current.collector = "Player 4";
                        setState(() {
                          omni.player4.balance = omni.player4.balance + giftCardInput;
                        });

                        break;
                      default:
                        debugPrint("Problem in omni.collector");
                    }
                    switch (omni.previousSelectedPlayer) {
                      case "1":
                        omni.updatePlayer1Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower));
                        break;
                      case "2":
                        omni.updatePlayer2Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower));
                        break;
                      case "3":
                        omni.updatePlayer3Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower));
                        break;
                      case "4":
                        omni.updatePlayer4Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower));
                        break;
                      default:
                        print("Error in switch(omni.previousSelectedPlayer)");
                    }
                    switch (omni.selectedPlayer) {
                      case "1":
                        omni.updatePlayer1Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower));
                        break;
                      case "2":
                        omni.updatePlayer2Passbook(Transactions(
                           payer: current.payer,
                           collector: current.collector,
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower));
                        break;
                      case "3":
                        omni.updatePlayer3Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount:(omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower));
                        break;
                      case "4":
                        omni.updatePlayer4Passbook(Transactions(
                           payer: current.payer,
                            collector: current.collector,
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower));
                        break;
                      default:
                        print("Error in switch(omni.selectedPlayer)");
                    }

                    setState(() {
                      omni.updateHistory(current);
                      omni.player1.status = 0;
                      omni.player2.status = 0;
                      omni.player3.status = 0;
                      omni.player4.status = 0;
                      omni.selectedPlayer = "";
                      omni.currencyPower = "";
                      omni.fundsCollected = 0;
                      omni.fundsPayed = 0;
                      omni.collector = "";
                      omni.payer = "";
                      giftCardInput = 0;
                      omni.previousSelectedPlayer = "";
                    });
                    Navigator.pop(context);
                    omni.finishTransaction();
                  }),
            child: Text(
              "Transfer",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            )),
      ),
      Visibility(maintainSize:true,maintainAnimation:true,maintainState:true,visible: (omni.player1.status +
          omni.player2.status +
          omni.player3.status +
          omni.player4.status !=
          1 )?false:true,
        child: RaisedButton(
            color: Color(0xFFBFDBAE),
            onPressed: (giftCardInput==0)
                ? () {
              showSimpleNotification(Center(
                child: Text("Choose an amount first!",style:TextStyle(
                    fontFamily: "OpenSans",
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 3)),
              ),background: Color(0xFFBFDBAE),);
                  }
                : (() {
                    switch (omni.selectedPlayer) {
                      case "1":
                        current = Transactions(
                            payer: "Player 1",
                            collector: "Bank",
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player1.balance = omni.player1.balance - giftCardInput;
                          omni.updatePlayer1Passbook(current);
                          giftCardInput = 0;
                          omni.currencyPower = '';
                          omni.player1.status = 0;
                          omni.previousSelectedPlayer = "";

                          omni.payer = "";
                          omni.selectedPlayer = "";
                        });
                        break;
                      case "2":
                        current = Transactions(
                            payer: "Player 2",
                            collector: "Bank",
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player2.balance = omni.player2.balance - giftCardInput;
                          debugPrint("${omni.player2.balance}");
                          omni.updatePlayer2Passbook(current);
                          giftCardInput = 0;
                          omni.currencyPower = '';
                          omni.player2.status = 0;
                          omni.previousSelectedPlayer = "";

                          omni.payer = "";
                          omni.selectedPlayer = "";
                        });

                        break;
                      case "3":
                        current = Transactions(
                            payer: "Player 3",
                            collector: "Bank",
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player3.balance = omni.player3.balance - giftCardInput;
                          debugPrint("${omni.player3.balance}");
                          omni.updatePlayer3Passbook(current);
                          giftCardInput = 0;
                          omni.currencyPower = '';
                          omni.player3.status = 0;
                          omni.previousSelectedPlayer = "";

                          omni.payer = "";
                          omni.selectedPlayer = "";
                        });

                        break;
                      case "4":
                        current = Transactions(
                            payer: "Player 4",
                            collector: "Bank",
                            amount: (omni.currencyPower=="K"?giftCardInput * 1000:giftCardInput).toString(),
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player4.balance = omni.player4.balance - giftCardInput;
                          debugPrint("${omni.player4.balance}");
                          omni.updatePlayer4Passbook(current);
                          giftCardInput = 0;
                          omni.currencyPower = '';
                          omni.player4.status = 0;
                          omni.previousSelectedPlayer = "";
                          omni.payer = "";
                          debugPrint(omni.selectedPlayer);
                          omni.selectedPlayer = "";
                        });

                        break;
                      default:
                        debugPrint("Probably this won't happen..Right?!");
                    }
                    Navigator.pop(context);
                    omni.finishTransaction();
                  }),
            child: Text(
              "-",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            )),
      ),
    ];
  }
}
