import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_bank/model/Omnipotent%20data.dart';
import 'package:provider/provider.dart';

class TransactionHistory extends StatefulWidget {
 const TransactionHistory(
      {Key? key, this.draggableWidget})
      : super(key: key);

  final draggableWidget;




  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Card(elevation: 5, color: Colors.transparent.withOpacity(0.5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Container(
          decoration: BoxDecoration(color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              image: buildDecorationImage()
          ),
          child: Consumer<Omni>(builder: (context,omni,child){
           var history= omni.history.history.reversed.toList();
           return ListView(
                controller: omni.scrollController,
                children: List.generate(
                    history.length,
                        (index) =>
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 5),
                          child: Table(
                            children: [
                              TableRow(children: [
                                Text(
                                  "${history[index].payer}",
                                  style: widget.draggableWidget == 1 ? (TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white70,
                                      fontSize: 16)):(TextStyle(
                                      fontFamily: "Kalam",

                                      color: Color(0xFF16264C),
                                      fontSize: 16)),
                                ),
                                Text(
                                  "payed",
                                  style: widget.draggableWidget == 1 ? (TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white70,
                                      fontSize: 16)):(TextStyle(
                                      fontFamily: "Kalam",


                                      color: Color(0xFF16264C),
                                      fontSize: 16)),
                                ),
                                Text(
                                  "${history[index].collector}",
                                  style: widget.draggableWidget == 1 ? (TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white70,
                                      fontSize: 16)):(TextStyle(
                                      fontFamily: "Kalam",

                                      color: Color(0xFF16264C),
                                      fontSize: 16)),
                                ),
                                Text(
                                  "  ${history[index].amount +
                                      history[index].currencyType}",
                                  style: widget.draggableWidget == 1 ? (TextStyle(
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white70,
                                      fontSize: 16)):(TextStyle(
                                      fontFamily: "Kalam",

                                      color: Color(0xFF16264C),
                                      fontSize: 16)),
                                ),

                              ])
                            ],
                          ),
                        )));
          },

          ),
    ),);
  }

  DecorationImage? buildDecorationImage() {
    if (widget.draggableWidget == 1)
      return null;
    else
      return DecorationImage(
          image: AssetImage("images/passbook.jpg"), fit: BoxFit.fill,colorFilter: ColorFilter.linearToSrgbGamma());
  }
}
