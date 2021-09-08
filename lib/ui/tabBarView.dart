
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_bank/ui/views/calculator.dart';
import 'package:monopoly_bank/ui/views/player1_balance.dart';
import 'package:monopoly_bank/ui/views/player2_balance.dart';
import 'package:monopoly_bank/ui/views/player3_balance.dart';
import 'package:monopoly_bank/ui/views/player4_balance.dart';
import 'package:monopoly_bank/ui/views/transactionHistory.dart';

class TabBarList extends StatefulWidget {
  const TabBarList({Key key}) : super(key: key);

  @override
  _TabBarListState createState() => _TabBarListState();
}
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
class _TabBarListState extends State<TabBarList> with AutomaticKeepAliveClientMixin<TabBarList>{


  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
        initialIndex: 0,
        length: 6,
        child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.black45,elevation: 0,

            flexibleSpace: ClipRect(
              child: Container(color: Colors.black87,),
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
          body: ExtendedTabBarView(cacheExtent: 8,
            children: [
              Calculator(draggableWidget:1
              ),
              FirstPlayerBalance(

              ),
              SecondPlayerBalance(

              ),
              ThirdPlayerBalance(

              ),
              FourthPlayerBalance(

              ),
              TransactionHistory(
               draggableWidget:0
              )
            ],
          ),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
