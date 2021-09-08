import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_bank/model/Omnipotent%20data.dart';
import 'package:monopoly_bank/model/accounts.dart';
import 'package:provider/provider.dart';

class ThirdPlayerBalance extends StatefulWidget {
  const ThirdPlayerBalance({Key key}) : super(key: key);


  @override
  _ThirdPlayerBalanceState createState() => _ThirdPlayerBalanceState();
}

class _ThirdPlayerBalanceState extends State<ThirdPlayerBalance> {
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
                  omni.player3.passBook.length,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 5),
                    child: Table(
                      children: [
                        TableRow(children: [
                          Text(
                            "${omni.player3.passBook[index].payer}",
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
                            "${omni.player3.passBook[index].collector}",
                            style: TextStyle(
                                fontFamily: "Kalam",

                                color: Color(0xFF16264C),
                                fontSize: 16),
                          ),
                          Text(
                            "${omni.player3.passBook[index].amount + omni.player3.passBook[index].currencyType}",
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
