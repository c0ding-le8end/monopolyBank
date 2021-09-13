import 'package:flutter/material.dart';

import 'homePage.dart';

void endDialog(BuildContext context) {
  showDialog(context: context, builder: (context)
  {
    return SimpleDialog(
      children: [
        Center(
          child: Text("Itseems the game has ended",style: TextStyle(
              fontFamily: "OpenSans",
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              letterSpacing: 1),),
        ),SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:95.0),
          child: TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFBFDBAE)),),
              onPressed: () =>  Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => HomePage()),
                ModalRoute.withName('HomePage'),
              ), child: Text("Ok",style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black87))),
        )
      ],
    );
  });
}