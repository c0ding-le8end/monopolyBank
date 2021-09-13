import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_bank/model/Omnipotent%20data.dart';
import 'package:monopoly_bank/model/accounts.dart';
import 'package:provider/provider.dart';

import '../endDialog.dart';

class FirstPlayerBalance extends StatefulWidget {
  const FirstPlayerBalance({Key key,this.creator}) : super(key: key);
final creator;

  @override
  _FirstPlayerBalanceState createState() => _FirstPlayerBalanceState();
}

class _FirstPlayerBalanceState extends State<FirstPlayerBalance> {
  var game;

  @override
  void initState() {
    var id=Provider.of<Omni>(context, listen: false).currentGameID;
    game=FirebaseFirestore.instance.collection("games").doc(id).snapshots();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.creator)
      {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage("images/passbook.jpg"),colorFilter: ColorFilter.linearToSrgbGamma(),
                  fit: BoxFit.fill)),
          child: Consumer<Omni>(builder: (context,omni,child) {
            return ListView(

                children: List.generate(
                    omni.player1.passBook.length,
                        (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 5),
                      child: Table(
                        children: [
                          TableRow(children: [
                            Text(
                              "${omni.player1.passBook[index].payer}",
                              style: TextStyle(
                                  fontFamily: "Kalam",

                                  color: Color(0xFF16264C),
                                  fontSize: 16),
                            ),
                            Text(
                              "payed",
                              style: TextStyle(
                                  fontFamily: "Kalam",

                                  color: Color(0xFF16264C),
                                  fontSize: 16),
                            ),
                            Text(
                              "${omni.player1.passBook[index].collector}",
                              style: TextStyle(
                                  fontFamily: "Kalam",

                                  color: Color(0xFF16264C),
                                  fontSize: 16),
                            ),
                            Text(
                              "${omni.player1.passBook[index].amount + omni.player1.passBook[index].currencyType}",
                              style: TextStyle(
                                  fontFamily: "Kalam",

                                  color: Color(0xFF16264C),
                                  fontSize: 16),
                            ),

                          ])
                        ],
                      ),
                    )));
          }
          ),
        );
      }

    else
      {
     return   Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage("images/passbook.jpg"),colorFilter: ColorFilter.linearToSrgbGamma(),
                  fit: BoxFit.fill)),
          child: StreamBuilder<DocumentSnapshot>(
            stream: game,
            // ignore: missing_return
            builder: (context,AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> documentFields=snapshot.data.data();
                if(snapshot.data.exists)
               return ListView(

                   children: List.generate(
                       documentFields['player1'].length,
                           (index) => Padding(
                         padding: const EdgeInsets.symmetric(
                             horizontal: 60, vertical: 5),
                         child: Table(
                           children: [
                             TableRow(children: [
                               Text(
                                 "${documentFields['player1'][index]["payer"]}",
                                 style: TextStyle(
                                     fontFamily: "Kalam",

                                     color: Color(0xFF16264C),
                                     fontSize: 16),
                               ),
                               documentFields['player1'][index]["payer"]!=""?Text(
                                 "payed",
                                 style: TextStyle(
                                     fontFamily: "Kalam",

                                     color: Color(0xFF16264C),
                                     fontSize: 16),
                               ):Text(""),
                               Text(
                                 "${documentFields['player1'][index]["collector"]}",
                                 style: TextStyle(
                                     fontFamily: "Kalam",

                                     color: Color(0xFF16264C),
                                     fontSize: 16),
                               ),
                               Text(
                                 "${documentFields['player1'][index]['amount'] + documentFields['player1'][index]["currencyPower"]}",
                                 style: TextStyle(
                                     fontFamily: "Kalam",

                                     color: Color(0xFF16264C),
                                     fontSize: 16),
                               ),

                             ])
                           ],
                         ),
                       )));
                else
                {
                  return Container();
                }
              }


              else
                return Container();
            })
              );
            }
    // else
    //   {
    //     return Container(decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         image: DecorationImage(
    //             image: AssetImage("images/passbook.jpg"),colorFilter: ColorFilter.linearToSrgbGamma(),
    //             fit: BoxFit.fill)),child: Text(""),);
    //   }


      }


  }

