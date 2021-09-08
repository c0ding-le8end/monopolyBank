import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_bank/model/Omnipotent%20data.dart';
import 'package:provider/provider.dart';

class FourthPlayerBalance extends StatefulWidget {
 const FourthPlayerBalance({Key key}) : super(key: key);


  @override
  _FourthPlayerBalanceState createState() => _FourthPlayerBalanceState();
}

class _FourthPlayerBalanceState extends State<FourthPlayerBalance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage("images/passbook.jpg"),colorFilter: ColorFilter.linearToSrgbGamma(),
              fit: BoxFit.fill)),
      child: Consumer<Omni>(builder: (context,omni,child)
        {
          return ListView(

              children: List.generate(
                  omni.player4.passBook.length,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 5),
                    child: Table(
                      children: [
                        TableRow(children: [
                          Text(
                            "${omni.player4.passBook[index].payer}",
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
                            "${omni.player4.passBook[index].collector}",
                            style: TextStyle(
                                fontFamily: "Kalam",

                                color: Color(0xFF16264C),
                                fontSize: 16),
                          ),
                          Text(
                            "${omni.player4.passBook[index].amount + omni.player4.passBook[index].currencyType}",
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
}
