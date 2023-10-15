import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_bank/model/Omnipotent%20data.dart';
import 'package:provider/provider.dart';

import 'homePage.dart';

Future endGameDialog(BuildContext context,bool creator,var gameId) {

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("End game?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                creator==true?FirebaseFirestore.instance
                    .collection("games")
                    .doc(gameId.toString())
                    .delete():null;

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => HomePage()),
                  ModalRoute.withName('HomePage'),
                );
                Provider.of<Omni>(context,listen: false).finishTransaction(gameEnded:true);
              },
              child: Text("Yes"),
            )
          ],
        );
      });
}