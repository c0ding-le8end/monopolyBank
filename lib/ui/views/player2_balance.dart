import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monopoly_bank/model/Omnipotent%20data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_bank/ui/endDialog.dart';
import 'package:provider/provider.dart';

class SecondPlayerBalance extends StatefulWidget {
  const SecondPlayerBalance({Key? key, this.creator}) : super(key: key);
final creator;
  @override
  _SecondPlayerBalanceState createState() => _SecondPlayerBalanceState();
}

class _SecondPlayerBalanceState extends State<SecondPlayerBalance> {
  var game;
var id;
  @override
  void initState() {
    id=Provider.of<Omni>(context, listen: false).currentGameID;
    game=FirebaseFirestore.instance.collection("games").doc(id).snapshots();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool existence=context.watch<Omni>().existence;
    if(widget.creator)
      {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage("images/passbook.jpg"),colorFilter: ColorFilter.linearToSrgbGamma(),
                  fit: BoxFit.fill)),
          child: Consumer<Omni>(builder: (context,omni,child)
          {
            return   ListView(

                children: List.generate(
                    omni.player2.passBook.length,
                        (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 5),
                      child: Table(
                        children: [
                          TableRow(children: [
                            Text(
                              "${omni.player2.passBook[index].payer}",
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
                              "${omni.player2.passBook[index].collector}",
                              style: TextStyle(
                                  fontFamily: "Kalam",

                                  color: Color(0xFF16264C),
                                  fontSize: 16),
                            ),
                            Text(
                              "${omni.player2.passBook[index].amount + omni.player2.passBook[index].currencyType}",
                              style: TextStyle(
                                  fontFamily: "Kalam",

                                  color: Color(0xFF16264C),
                                  fontSize: 16),
                            ),

                          ])
                        ],
                      ),
                    )));
          },

          ),
        );
      }
   else

     {
       return  Container(
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               image: DecorationImage(
                   image: AssetImage("images/passbook.jpg"),colorFilter: ColorFilter.linearToSrgbGamma(),
                   fit: BoxFit.fill)),
           child: StreamBuilder<DocumentSnapshot>(
               stream: game,
               builder: (context,AsyncSnapshot<DocumentSnapshot> snapshot) {
                 if (snapshot.hasData) {
                   Map<String, dynamic>? documentFields=snapshot.data!.data() as Map<String, dynamic>?;
                     if(snapshot.data!.exists)
                     return ListView(

                         children: List.generate(
                             documentFields!['player2'].length,
                                 (index) => Padding(
                               padding: const EdgeInsets.symmetric(
                                   horizontal: 60, vertical: 5),
                               child: Table(
                                 children: [
                                   TableRow(children: [
                                     Text(
                                       "${documentFields['player2'][index]['payer']}",
                                       style: TextStyle(
                                           fontFamily: "Kalam",

                                           color: Color(0xFF16264C),
                                           fontSize: 16),
                                     ),
                                     documentFields['player2'][index]["payer"]!=""?Text(
                                       "payed",
                                       style: TextStyle(
                                           fontFamily: "Kalam",

                                           color: Color(0xFF16264C),
                                           fontSize: 16),
                                     ):Text(""),
                                     Text(
                                       "${documentFields['player2'][index]['collector']}",
                                       style: TextStyle(
                                           fontFamily: "Kalam",

                                           color: Color(0xFF16264C),
                                           fontSize: 16),
                                     ),
                                     Text(
                                       "${documentFields['player2'][index]['amount'] + documentFields['player2'][index]['currencyPower']}",
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
  return Container();
                 }

                 else
                   return Container();
               })
       );
     }



  }
}
