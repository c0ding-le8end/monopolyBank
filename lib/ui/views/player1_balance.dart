import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_bank/model/Omnipotent%20data.dart';
import 'package:provider/provider.dart';

class FirstPlayerBalance extends StatefulWidget {
  const FirstPlayerBalance({Key key}) : super(key: key);


  @override
  _FirstPlayerBalanceState createState() => _FirstPlayerBalanceState();
}

class _FirstPlayerBalanceState extends State<FirstPlayerBalance> {

  @override
  Widget build(BuildContext context) {
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
}
