import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monopoly_bank/ui/tabBarView.dart';
import 'package:monopoly_bank/util/global%20variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color backgroundColor1 = const Color(0xFF444152);

  final Color backgroundColor2 = const Color(0xFF6f6c7d);

  final Color foregroundColor = Colors.white;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String gameId;
  var gameDocument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/monopoly.jpg"), fit: BoxFit.fill)),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(padding:EdgeInsets.all(30),decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Color(0xFFBFDBAE),
                      maxLength: 6,
                      validator: (value) {
                        if (value.isEmpty || value.length < 6) {
                          return 'Enter a valid Game ID';
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(counterText: "",
                          labelStyle: TextStyle(
                              color: customGreen,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: customGreen,

                              ),
                              borderRadius: BorderRadius.all(Radius.circular(30))),
                          labelText: 'Game ID',
                          prefixIcon: Icon(FontAwesomeIcons.dice, color: customGreen)),
                      onChanged: (value) {
                        setState(() {
                          gameId = value;
                        });
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin:
                          const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              color: customGreen,
                              onPressed: () async {
                                if (formKey.currentState.validate()) {
                                  gameDocument = await FirebaseFirestore.instance
                                      .collection("games")
                                      .doc(gameId)
                                      .get();
                                  if (gameDocument.exists) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return TabBarList(creator: false,gameId: gameId,);
                                    }));
                                  } else
                                    showMessage();
                                }
                              },
                              child: Text(
                                "Join",
                                style: TextStyle(color: this.foregroundColor,fontFamily: "OpenSans",letterSpacing: 3,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),SizedBox(height:30),
          Container(
            width: MediaQuery.of(context).size.width,
            margin:
            const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    color: customGreen,
                    onPressed: ()  {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return TabBarList(creator: true);
                          }));
                    },
                    child: Text(
                      "create",
                      style: TextStyle(color: this.foregroundColor,fontSize: 20,fontFamily: "OpenSans",letterSpacing: 2),
                    ),
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    ));
  }

  showMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Center(
                child: Text("Game Id does not exist",style: TextStyle(
                    fontFamily: "OpenSans",
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 1),),
              ),SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:95.0),
                child: TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFBFDBAE)),),
                    onPressed: () => Navigator.pop(context), child: Text("Ok",style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black87))),
              )
            ],
          );
        });
  }
}
