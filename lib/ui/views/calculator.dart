import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_bank/model/Omnipotent%20data.dart';
import 'package:monopoly_bank/model/transactions.dart';
import 'package:monopoly_bank/ui/views/transactionHistory.dart';
import 'package:monopoly_bank/util/global%20variables.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import '../giftCard.dart';

class Calculator extends StatefulWidget {
  const Calculator({
    Key key, this.draggableWidget,
  }) : super(key: key);
final draggableWidget;
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator>
    with AutomaticKeepAliveClientMixin<Calculator> {

  List<RaisedButton> row1;
  List<RaisedButton> row2;
  List<RaisedButton> row3;
  List<RaisedButton> row4;
  List<RaisedButton> row5;
  List row6;
  List playerRow1;
  List playerRow2;
  List<RaisedButton> giftCardRow1;
  List<RaisedButton> giftCardRow2;
  List<RaisedButton> giftCardRow3;
  String decimalPLaces = "";
  Transactions current;
  Key key;



  
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(setTheState) {
    super.setState(setTheState);
  }

  @override
  Widget build(BuildContext context) {
    var omni = context.watch<Omni>();
    createRow(omni);
    return Stack(
      children: [
        Consumer<Omni>(builder: (context,omni,child)
          {
            return Container(
              decoration: BoxDecoration(image: buildDecorationImage()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${omni.input != "" ? (omni.input.contains(".") ? double.parse(omni.input).toStringAsFixed(3) : omni.input) : ""}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  //   fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: "Federant"),
                            ),
                            Text(
                              "${omni.currencyPower}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  //   fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: "Federant"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 3 / 5 - 80,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Column(
                        children: [
                          Row(
                              children: List.generate(
                                  3,
                                      (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: row1[index],
                                  ))),
                          Row(
                            children: List.generate(
                                3,
                                    (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: row2[index],
                                )),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                    (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: row3[index],
                                )),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                    (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: row4[index],
                                )),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                    (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: row5[index],
                                )),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: (List.generate(
                                3,
                                    (index) => Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: row6[index]))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: List.generate(2, (index) => playerRow1[index]),
                        ),
                        Row(
                          children: List.generate(2, (index) => playerRow2[index]),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
        DraggableScrollableSheet(
            minChildSize: 0.08,
            initialChildSize: 0.08,
            builder: (context,scrollController) {
              omni.scrollController=scrollController;
              return TransactionHistory(

                  draggableWidget: widget.draggableWidget);
            }),
      ],
    );
  }

  void createRow(Omni  omni) {
    row1 = [
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: ((omni.player1.status +
                    omni.player2.status +
                    omni.player3.status +
                    omni.player4.status ==
                0)
            ? () => showSimpleNotification(
                  Center(
                    child: Text("Choose atleast one player first!",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 3)),
                  ),
                  background: Color(0xFFBFDBAE),
                )
            : (omni.input == ''
                ? () => showSimpleNotification(
                      Center(
                        child: Text("Choose an amount first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    )
                : () {
                    setState(() {
                      omni.currencyPower = 'M';
                    });
                  })),
        child: Text(
          "M",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Colors.redAccent,
        onPressed: (omni.player1.status +
                    omni.player2.status +
                    omni.player3.status +
                    omni.player4.status ==
                0)
            ? () => showSimpleNotification(
                  Center(
                    child: Text("Choose atleast one player first!",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 3)),
                  ),
                  background: Color(0xFFBFDBAE),
                )
            : () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return GiftCard(
                        // setTheState: setTheState,
                      );
                    });
              },
        child: Icon(
          Icons.card_giftcard,
          color: Colors.yellowAccent,
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0 ||
                omni.input.contains(".") ||
                omni.input.length > 3)
            ? (omni.input.contains(".") || omni.input.length > 3
                ? () => null
                : () => showSimpleNotification(
                      Center(
                        child: (Text("Choose atleast one player first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3))),
                      ),
                      background: Color(0xFFBFDBAE),
                    ))
            : (omni.input == ''
                ? () => showSimpleNotification(
                      Center(
                        child: Text("Choose an amount first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    )
                : () {
                    setState(() {
                      omni.currencyPower = 'K';
                    });
                  }),
        child: Text(
          "K",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      )
    ];

    row2 = [
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0 ||
                (omni.input.length == 3 && !omni.input.contains(".")) ||
                (omni.input.length == 7))
            ? (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0
                ? () => showSimpleNotification(
                      Center(
                        child: Text("Choose atleast one player first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    )
                : () => null)
            : (() {
                setState(() {
                  omni.input += "7";
                });
              }),
        child: Text(
          "7",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0 ||
                (omni.input.length == 3 && !omni.input.contains(".")) ||
                (omni.input.length == 7))
            ? (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0
                ? () => showSimpleNotification(
                      Center(
                        child: Text("Choose atleast one player first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    )
                : () => null)
            : (() {
                setState(() {
                  omni.input += "8";
                });
              }),
        child: Text(
          "8",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0 ||
                (omni.input.length == 3 && !omni.input.contains(".")) ||
                (omni.input.length == 7))
            ? (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0
                ? () => showSimpleNotification(
                      Center(
                        child: Text("Choose atleast one player first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    )
                : () => null)
            : (() {
                setState(() {
                  omni.input += "9";
                });
              }),
        child: Text(
          "9",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      )
    ];

    row3 = [
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0 ||
                (omni.input.length == 3 && !omni.input.contains(".")) ||
                (omni.input.length == 7))
            ? (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0
                ? () => showSimpleNotification(
                      Center(
                        child: Text("Choose atleast one player first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    )
                : () => null)
            : (() {
                setState(() {
                  omni.input += "4";
                });
              }),
        child: Text(
          "4",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0 ||
                (omni.input.length == 3 && !omni.input.contains(".")) ||
                (omni.input.length == 7))
            ? (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0
                ? () => showSimpleNotification(
                      Center(
                        child: Text("Choose atleast one player first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    )
                : () => null)
            : (() {
                setState(() {
                  omni.input += "5";
                });
              }),
        child: Text(
          "5",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0 ||
                (omni.input.length == 3 && !omni.input.contains(".")) ||
                (omni.input.length == 7))
            ? (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0
                ? () => showSimpleNotification(
                      Center(
                        child: Text("Choose atleast one player first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    )
                : () => null)
            : (() {
                setState(() {
                  omni.input += "6";
                });
              }),
        child: Text(
          "6",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      )
    ];

    row4 = [
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0 ||
                (omni.input.length == 3 && !omni.input.contains(".")) ||
                (omni.input.length == 7))
            ? (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0
                ? () => showSimpleNotification(
                      Center(
                        child: Text("Choose atleast one player first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    )
                : () => null)
            : (() {
                setState(() {
                  omni.input += "1";
                });
              }),
        child: Text(
          "1",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0 ||
                (omni.input.length == 3 && !omni.input.contains(".")) ||
                (omni.input.length == 7))
            ? (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0
                ? () => showSimpleNotification(
                      Center(
                        child: Text("Choose atleast one player first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    )
                : () => null)
            : (() {
                setState(() {
                  omni.input += "2";
                });
              }),
        child: Text(
          "2",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0 ||
                (omni.input.length == 3 && !omni.input.contains(".")) ||
                (omni.input.length == 7))
            ? (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0
                ? () => showSimpleNotification(
                      Center(
                        child: Text("Choose atleast one player first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    )
                : () => null)
            : (() {
                setState(() {
                  omni.input += "3";
                });
              }),
        child: Text(
          "3",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      )
    ];
    row5 = [
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                    omni.player2.status +
                    omni.player3.status +
                    omni.player4.status ==
                0)
            ? () => showSimpleNotification(
                  Center(
                    child: Text("Choose atleast one player first!",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 3)),
                  ),
                  background: Color(0xFFBFDBAE),
                )
            : (() {
                setState(() {
                  omni.currencyPower = "";
                  omni.input = "";
                  omni.pointStatus = false;
                });
              }),
        child: Text(
          "C",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0 ||
                (omni.input.length == 3 && !omni.input.contains(".")) ||
                (omni.input.length == 7))
            ? (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0
                ? () => showSimpleNotification(
                      Center(
                        child: Text("Choose atleast one player first!",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    )
                : () => null)
            : (omni.input == ''
                ? () {
                    omni.input = "";
                  }
                : (() {
                    setState(() {
                      omni.input += "0";
                    });
                  })),
        child: Text(
          "0",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      RaisedButton(
        color: Color(0xFFBFDBAE),
        onPressed: (omni.player1.status +
                        omni.player2.status +
                        omni.player3.status +
                        omni.player4.status ==
                    0 ||
                omni.currencyPower == "K" ||
                omni.pointStatus ||
                omni.input.length == 0)
            ? () => showSimpleNotification(
                  Center(
                      child: (omni.player1.status +
                                  omni.player2.status +
                                  omni.player3.status +
                                  omni.player4.status ==
                              0)
                          ? Text("Choose atleast one player first!",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  letterSpacing: 3))
                          : (omni.input == "" || omni.currencyPower == "K"
                              ? (omni.currencyPower == "K"
                                  ? Text("Action works only for Millions",
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          letterSpacing: 3))
                                  : Text("Enter a valid amount first!",
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          letterSpacing: 3)))
                              : Text("Invalid action!",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      letterSpacing: 3)))),
                  background: Color(0xFFBFDBAE),
                )
            : (() {
                setState(() {
                  omni.pointStatus = true;
                  omni.input += ".";
                });
              }),
        child: Text(
          ".",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      )
    ];
    row6 = [
      Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: (omni.player1.status +
                    omni.player2.status +
                    omni.player3.status +
                    omni.player4.status !=
                1)
            ? false
            : true,
        child: RaisedButton(
            color: Color(0xFFBFDBAE),
            onPressed: (omni.input == "" || omni.currencyPower == "")
                ? () {
                    showSimpleNotification(
                      Center(
                        child: omni.input != "" && omni.currencyPower == ""
                            ? Text("${omni.input}M OR ${omni.input}k ??",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 3))
                            : Text("Choose an amount first!",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    );
                  }
                : (() {
                    if (omni.currencyPower == "K") {
                      switch (omni.input.length) {
                        case 1:
                          decimalPLaces = "00";
                          break;
                        case 2:
                          decimalPLaces = "0";
                          break;
                        default:
                          decimalPLaces = "";
                      }
                    }

                    switch (omni.selectedPlayer) {
                      case "1":
                        current = Transactions(
                            payer: "Bank",
                            collector: "Player 1",
                            amount: omni.input,
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);

                          omni.player1.balance = omni.currencyPower == 'M'
                              ? omni.player1.balance + double.parse(omni.input)
                              : omni.player1.balance +
                                  double.parse(('.' + decimalPLaces + omni.input));
                          debugPrint("${omni.player1.balance}");
                          omni.updatePlayer1Passbook(current);
                          omni.input = "";

                          omni.currencyPower = '';
                          omni.player1.status = 0;
                          omni.previousSelectedPlayer = "";
                          omni.pointStatus = false;
                          omni.collector = "";
                          omni.selectedPlayer = "";
                        });
                        break;
                      case "2":
                        current = Transactions(
                            payer: "Bank",
                            collector: "Player 2",
                            amount: omni.input,
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.history.history.add(current);
                          omni.player2.balance = omni.currencyPower == 'M'
                              ? omni.player2.balance + double.parse(omni.input)
                              : omni.player2.balance +
                                  double.parse(('.' + decimalPLaces + omni.input));

                          debugPrint("${omni.player2.balance}");
                          omni.updatePlayer2Passbook(current);
                          omni.input = "";
                          omni.currencyPower = '';
                          omni.updateHistory(current);
                          omni.previousSelectedPlayer = "";
                          omni.pointStatus = false;
                          omni.collector = "";
                          omni.selectedPlayer = "";
                        });

                        break;
                      case "3":
                        current = Transactions(
                            payer: "Bank",
                            collector: "Player 3",
                            amount: omni.input,
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player3.balance = omni.currencyPower == 'M'
                              ? omni.player3.balance + double.parse(omni.input)
                              : omni.player3.balance +
                                  double.parse(('.' + decimalPLaces + omni.input));
                          debugPrint("${omni.player3.balance}");
                          omni.updatePlayer3Passbook(current);
                          omni.input = "";
                          omni.currencyPower = '';
                          omni.player3.status = 0;
                          omni.previousSelectedPlayer = "";
                          omni.pointStatus = false;
                          omni.collector = "";
                          omni.selectedPlayer = "";
                        });

                        break;
                      case "4":
                        current = Transactions(
                            payer: "Bank",
                            collector: "Player 4",
                            amount: omni.input,
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player4.balance = omni.currencyPower == 'M'
                              ? omni.player4.balance + double.parse(omni.input)
                              : omni.player4.balance +
                                  double.parse(('.' + decimalPLaces + omni.input));
                          debugPrint("${omni.player4.balance}");
                          omni.updatePlayer4Passbook(current);
                          omni.input = "";
                          omni.currencyPower = '';
                          omni.player4.status = 0;
                          omni.previousSelectedPlayer = "";
                          omni.pointStatus = false;
                          omni.collector = "";
                          omni.selectedPlayer = "";
                        });

                        break;
                      default:
                        debugPrint("Probably this won't happen..Right?!");
                    }
                  }),
            child: Text(
              "+",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            )),
      ),
      Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: (omni.player1.status +
                    omni.player2.status +
                    omni.player3.status +
                    omni.player4.status !=
                2)
            ? false
            : true,
        child: RaisedButton(
            color: Color(0xFFBFDBAE),
            onPressed: (omni.input == "" || omni.currencyPower == "")
                ? () {
                    showSimpleNotification(
                      Center(
                        child: omni.input != "" && omni.currencyPower == ""
                            ? Text("$omni.input M OR $omni.input k ??",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 3))
                            : Text("Choose an amount first!",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    );
                  }
                : (() {
                    current = Transactions(
                        amount: omni.input, currencyType: omni.currencyPower);
                    if (omni.currencyPower == "K") {
                      switch (omni.input.length) {
                        case 1:
                          decimalPLaces = "00";
                          break;
                        case 2:
                          decimalPLaces = "0";
                          break;
                        default:
                          decimalPLaces = "";
                      }
                    }
                    switch (omni.payer) {
                      case "1":
                        current.payer = "Player 1";
                        setState(() {
                          omni.fundsPayed = omni.currencyPower == 'M'
                              ? omni.fundsPayed - double.parse(omni.input)
                              : omni.fundsPayed -
                                  double.parse(('.' + decimalPLaces + omni.input));
                          omni.player1.balance = omni.fundsPayed;
                        });
                        break;
                      case "2":
                        current.payer = "Player 2";
                        setState(() {
                          omni.fundsPayed = omni.currencyPower == 'M'
                              ? omni.fundsPayed - double.parse(omni.input)
                              : omni.fundsPayed -
                                  double.parse(('.' + decimalPLaces + omni.input));
                          omni.player2.balance = omni.fundsPayed;
                        });

                        break;
                      case "3":
                        current.payer = "Player 3";
                        setState(() {
                          omni.fundsPayed = omni.currencyPower == 'M'
                              ? omni.fundsPayed - double.parse(omni.input)
                              : omni.fundsPayed -
                                  double.parse(('.' + decimalPLaces + omni.input));
                          omni.player3.balance = omni.fundsPayed;
                        });

                        break;
                      case "4":
                        current.payer = "Player 4";
                        setState(() {
                          omni.fundsPayed = omni.currencyPower == 'M'
                              ? omni.fundsPayed - double.parse(omni.input)
                              : omni.fundsPayed -
                                  double.parse(('.' + decimalPLaces + omni.input));
                          omni.player4.balance = omni.fundsPayed;
                        });

                        break;
                      default:
                        debugPrint("Problem in payer....payer=$omni.payer");
                    }
                    switch (omni.collector) {
                      case "1":
                        current.collector = "Player 1";
                        setState(() {
                          omni.fundsCollected = omni.currencyPower == 'M'
                              ? omni.fundsCollected + double.parse(omni.input)
                              : omni.fundsCollected +
                                  double.parse(('.' + decimalPLaces + omni.input));
                          omni.player1.balance = omni.fundsCollected;
                        });
                        break;
                      case "2":
                        current.collector = "Player 2";
                        setState(() {
                          omni.fundsCollected = omni.currencyPower == 'M'
                              ? omni.fundsCollected + double.parse(omni.input)
                              : omni.fundsCollected +
                                  double.parse(('.' + decimalPLaces + omni.input));
                          omni.player2.balance = omni.fundsCollected;
                        });

                        break;
                      case "3":
                        current.collector = "Player 3";
                        setState(() {
                          omni.fundsCollected = omni.currencyPower == 'M'
                              ? omni.fundsCollected + double.parse(omni.input)
                              : omni.fundsCollected +
                                  double.parse(('.' + decimalPLaces + omni.input));
                          omni.player3.balance = omni.fundsCollected;
                        });

                        break;
                      case "4":
                        current.collector = "Player 4";
                        setState(() {
                          omni.fundsCollected = omni.currencyPower == 'M'
                              ? omni.fundsCollected + double.parse(omni.input)
                              : omni.fundsCollected +
                                  double.parse(('.' + decimalPLaces + omni.input));
                          omni.player4.balance = omni.fundsCollected;
                        });

                        break;
                      default:
                        debugPrint("Problem in collector");
                    }
                    switch (omni.previousSelectedPlayer) {
                      case "1":
                        omni.updatePlayer1Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: omni.input,
                            currencyType: omni.currencyPower));
                        break;
                      case "2":
                        omni.updatePlayer2Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: omni.input,
                            currencyType: omni.currencyPower));
                        break;
                      case "3":
                        omni.updatePlayer3Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: omni.input,
                            currencyType: omni.currencyPower));
                        break;
                      case "4":
                        omni.updatePlayer4Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: omni.input,
                            currencyType: omni.currencyPower));
                        break;
                      default:
                        print("Error in switch(previousSelectedPlayer)");
                    }
                    switch (omni.selectedPlayer) {
                      case "1":
                        omni.updatePlayer1Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: omni.input,
                            currencyType: omni.currencyPower));
                        break;
                      case "2":
                        omni.updatePlayer2Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: omni.input,
                            currencyType: omni.currencyPower));
                        break;
                      case "3":
                        omni.updatePlayer3Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: omni.input,
                            currencyType: omni.currencyPower));
                        break;
                      case "4":
                        omni.updatePlayer4Passbook(Transactions(
                            payer: current.payer,
                            collector: current.collector,
                            amount: omni.input,
                            currencyType: omni.currencyPower));
                        break;
                      default:
                        print("Error in switch(selectedPlayer)");
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
                      omni.input = "";
                      omni.previousSelectedPlayer = "";
                      omni.pointStatus = false;
                    });
                  }),
            child: Text(
              "Transfer",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            )),
      ),
      Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: (omni.player1.status +
                    omni.player2.status +
                    omni.player3.status +
                    omni.player4.status !=
                1)
            ? false
            : true,
        child: RaisedButton(
            color: Color(0xFFBFDBAE),
            onPressed: (omni.input == "" || omni.currencyPower == '')
                ? () {
                    showSimpleNotification(
                      Center(
                        child: omni.input != "" && omni.currencyPower == ""
                            ? Text("$omni.input M OR $omni.input k ??",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 3))
                            : Text("Choose an amount first!",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 3)),
                      ),
                      background: Color(0xFFBFDBAE),
                    );
                  }
                : (() {
                    if (omni.currencyPower == "K") {
                      switch (omni.input.length) {
                        case 1:
                          decimalPLaces = "00";
                          break;
                        case 2:
                          decimalPLaces = "0";
                          break;
                        default:
                          decimalPLaces = "";
                      }
                    }

                    switch (omni.selectedPlayer) {
                      case "1":
                        current = Transactions(
                            payer: "Player 1",
                            collector: "Bank",
                            amount: omni.input,
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player1.balance = omni.currencyPower == 'M'
                              ? omni.player1.balance - double.parse(omni.input)
                              : omni.player1.balance -
                                  double.parse(('.' + decimalPLaces + omni.input));
                          debugPrint("${omni.player1.balance}");
                          omni.updatePlayer1Passbook(current);
                          omni.input = "";
                          omni.currencyPower = '';
                          omni.player1.status = 0;
                          omni.previousSelectedPlayer = "";
                          omni.pointStatus = false;
                          omni.payer = "";
                          omni.selectedPlayer = "";
                        });
                        break;
                      case "2":
                        current = Transactions(
                            payer: "Player 2",
                            collector: "Bank",
                            amount: omni.input,
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player2.balance = omni.currencyPower == 'M'
                              ? omni.player2.balance - double.parse(omni.input)
                              : omni.player2.balance -
                                  double.parse(('.' + decimalPLaces + omni.input));
                          debugPrint("${omni.player2.balance}");
                          omni.updatePlayer2Passbook(current);
                          omni.input = "";
                          omni.currencyPower = '';
                          omni.player2.status = 0;
                          omni.previousSelectedPlayer = "";
                          omni.pointStatus = false;
                          omni.payer = "";
                          omni.selectedPlayer = "";
                        });

                        break;
                      case "3":
                        current = Transactions(
                            payer: "Player 3",
                            collector: "Bank",
                            amount: omni.input,
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player3.balance = omni.currencyPower == 'M'
                              ? omni.player3.balance - double.parse(omni.input)
                              : omni.player3.balance -
                                  double.parse(('.' + decimalPLaces + omni.input));
                          debugPrint("${omni.player3.balance}");
                          omni.updatePlayer3Passbook(current);
                          omni.input = "";
                          omni.currencyPower = '';
                          omni.player3.status = 0;
                          omni.previousSelectedPlayer = "";
                          omni.pointStatus = false;
                          omni.payer = "";
                          omni.selectedPlayer = "";
                        });

                        break;
                      case "4":
                        current = Transactions(
                            payer: "Player 4",
                            collector: "Bank",
                            amount: omni.input,
                            currencyType: omni.currencyPower);
                        setState(() {
                          omni.updateHistory(current);
                          omni.player4.balance = omni.currencyPower == 'M'
                              ? omni.player4.balance - double.parse(omni.input)
                              : omni.player4.balance -
                                  double.parse(('.' + decimalPLaces + omni.input));
                          debugPrint("${omni.player4.balance}");
                          omni.updatePlayer4Passbook(current);
                          omni.input = "";
                          omni.currencyPower = '';
                          omni.player4.status = 0;
                          omni.previousSelectedPlayer = "";
                          omni.pointStatus = false;
                          omni.payer = "";
                          omni.selectedPlayer = "";
                        });

                        break;
                      default:
                        debugPrint("Probably this won't happen..Right?!");
                    }
                  }),
            child: Text(
              "-",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            )),
      ),
    ];
    playerRow1 = [
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: omni.player1.status == 1
                ? Border.all(color: Colors.black87, style: BorderStyle.solid)
                : null),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 8,
          onPressed: (omni.player2.status + omni.player3.status + omni.player4.status == 2)
              ? null
              : (omni.player1.status == 0
                  ? () {
                      setState(() {
                        omni.player1.status = 1;
                        if (omni.selectedPlayer == "") {
                          omni.previousSelectedPlayer = "1";
                          omni.payer = "1";
                          omni.fundsPayed = omni.player1.balance;
                        } else {
                          omni.fundsCollected = omni.player1.balance;
                         omni. collector = "1";
                        }

                        omni.selectedPlayer = "1";
                        debugPrint("selected Player: ${omni.selectedPlayer}");
                      });
                    }
                  : () {
                      setState(() {
                        omni.player1.status = 0;
                        if (omni.previousSelectedPlayer == "") {
                          omni.selectedPlayer = "";
                        } else {
                          omni.selectedPlayer = omni.selectedPlayer=="1"?omni.previousSelectedPlayer:omni.selectedPlayer;
                          omni.previousSelectedPlayer = "";
                        }
                      });
                    }),
          child: Container(
            width: 100,
            child: Column(
              children: [
                Text(
                  "player1",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 3),
                ),
                Text(
                  "${omni.player1.balance.toStringAsFixed(3)} M",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 3),
                )
              ],
            ),
          ),
          color: omni.player1.status == 1 ? customYellow : Colors.amber.shade500,
        ),
      ),
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: omni.player2.status == 1
                ? Border.all(color: Colors.black87, style: BorderStyle.solid)
                : null),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: (omni.player1.status + omni.player3.status + omni.player4.status == 2)
              ? null
              : (omni.player2.status == 0
                  ? () {
                      setState(() {
                        omni.player2.status = 1;
                        if (omni.selectedPlayer == "") {
                          omni.previousSelectedPlayer = "2";
                          omni.fundsPayed = omni.player2.balance;
                          omni.payer = "2";
                        } else {
                          omni.fundsCollected = omni.player2.balance;
                         omni. collector = "2";
                        }

                        omni.selectedPlayer = "2";
                      });
                    }
                  : () {
                      setState(() {
                        omni.player2.status = 0;
                        if (omni.previousSelectedPlayer == "") {
                          omni.selectedPlayer = "";
                        } else {
                          omni.selectedPlayer = omni.selectedPlayer=="2"?omni.previousSelectedPlayer:omni.selectedPlayer;
                          omni.previousSelectedPlayer = "";
                        }
                      });
                    }),
          child: Container(
            width: 100,
            child: Column(
              children: [
                Text(
                  "player2",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 3),
                ),
                Text(
                  "${omni.player2.balance.toStringAsFixed(3)} M",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 3),
                )
              ],
            ),
          ),
          color: omni.player2.status == 1 ? customRed : Colors.redAccent,
        ),
      )
    ];
    playerRow2 = [
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: omni.player3.status == 1
                ? Border.all(color: Colors.black87, style: BorderStyle.solid)
                : null),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: (omni.player1.status + omni.player2.status + omni.player4.status == 2)
              ? null
              : (omni.player3.status == 0
                  ? () {
                      setState(() {
                        omni.player3.status = 1;
                        if (omni.selectedPlayer == "") {
                          omni.previousSelectedPlayer = "3";
                          omni.fundsPayed = omni.player3.balance;
                          omni.payer = "3";
                        } else {
                          omni.fundsCollected = omni.player3.balance;
                         omni. collector = "3";
                        }

                        omni.selectedPlayer = "3";
                      });
                    }
                  : () {
                      setState(() {
                        omni.player3.status = 0;
                        if (omni.previousSelectedPlayer == "") {
                          omni.selectedPlayer = "";
                        } else {
                          omni.selectedPlayer = omni.selectedPlayer=="3"?omni.previousSelectedPlayer:omni.selectedPlayer;
                          omni.previousSelectedPlayer = "";
                        }
                      });
                    }),
          child: Container(
            width: 100,
            child: Column(
              children: [
                Text(
                  "player3",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 3),
                ),
                Text(
                  "${omni.player3.balance.toStringAsFixed(3)} M",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 3),
                )
              ],
            ),
          ),
          color:
              omni.player3.status == 1 ? customGreen : Colors.greenAccent.shade400,
        ),
      ),
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: omni.player4.status == 1
                ? Border.all(color: Colors.black87, style: BorderStyle.solid)
                : null),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: (omni.player1.status + omni.player2.status + omni.player3.status == 2)
              ? null
              : (omni.player4.status == 0
                  ? () {
                      setState(() {
                        omni.player4.status = 1;
                        if (omni.selectedPlayer == "") {
                          omni.previousSelectedPlayer = "4";
                          omni.fundsPayed = omni.player4.balance;
                          omni.payer = "4";
                        } else {
                          omni.fundsCollected = omni.player4.balance;
                         omni. collector = "4";
                        }

                        omni.selectedPlayer = "4";
                      });
                    }
                  : () {
                      setState(() {
                        omni.player4.status = 0;
                        if (omni.previousSelectedPlayer == "") {
                          omni.selectedPlayer = "";
                        } else {
                          omni.selectedPlayer = omni.selectedPlayer=="4"?omni.previousSelectedPlayer:omni.selectedPlayer;
                          omni.previousSelectedPlayer = "";
                        }
                      });
                    }),
          child: Container(
            width: 100,
            child: Column(
              children: [
                Text(
                  "player4",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 3),
                ),
                Text(
                  "${omni.player4.balance.toStringAsFixed(3)} M",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 3),
                )
              ],
            ),
          ),
          color: omni.player4.status == 1 ? customBlue : Colors.blue,
        ),
      )
    ];
  }

  DecorationImage buildDecorationImage() {
    return DecorationImage(
        image: AssetImage("images/monopoly.jpg"), fit: BoxFit.fill);
  }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}



//500k,250k,100k,200k,1M,2M,150k,1.5M,
//1M,2M,1.5M,
//100k,150K,200K,
//250K,300k,500K,
