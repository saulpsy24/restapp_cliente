import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp_cliente/provider/provider.dart';

class Tab1  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<MyProvider>(context);
    return Container(
        color: Colors.orange,
          child: SafeArea(
            child: Center(
              child: Container(
                height: 500,
                child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('restaurants')
                      .where("no_mesa", isEqualTo: provider.numeromesa)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Loading...');
                      default:
                        return new ListView(
                          children: snapshot.data.documents
                              .map((DocumentSnapshot document) {
                            return new Center(
                              child: GestureDetector(
                                onTap: () {
                                  document.data["status"].toString() == "1"
                                      ? document.reference
                                          .updateData({"status": "0"})
                                      : document.reference
                                          .updateData({"status": "1"});
                                },
                                onDoubleTap: () {
                                  document.reference
                                      .updateData({"status": "2"});
                                },
                                child: Container(
                                  padding: EdgeInsets.all(30),
                                  height: 300,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    color: document.data["status"] == "0"
                                        ? Colors.blue
                                        : document.data["status"] == "1"
                                            ? Colors.yellow
                                            : Colors.red,
                                  ),
                                  child: Center(
                                      child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Mesa No.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19),
                                      ),
                                      Text(
                                        provider.numeromesa,
                                        style: TextStyle(fontSize: 100),
                                      ),
                                      Text(
                                        document.data["status"] == "0"
                                            ? "Disfrutando"
                                            : document.data["status"] == "1"
                                                ? "Solicito Atencion"
                                                : "Atencion Urgente",
                                      )
                                    ],
                                  )),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                    }
                  },
                ),
              ),
            ),
          ),
        );
       
  }
}