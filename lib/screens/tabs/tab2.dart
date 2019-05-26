import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp_cliente/provider/provider.dart';
import 'package:restaurapp_cliente/screens/detalleplatillo/detalleplatillo.dart';

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.red,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * .15,
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('platillos').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return new ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return GestureDetector(
                        onTap: (){
                          provider.nombreplato = document["nombre"];
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetallePlatillo()));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * .17,
                          child: Card(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  height:
                                      MediaQuery.of(context).size.height * .15,
                                  width:
                                      MediaQuery.of(context).size.height * .15,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(document['imagen']),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Center(
                                  child: Column(
                                    children: <Widget>[
                                      Text(document["nombre"]),
                                      Text(document["precio"].toString()),
                                    ],
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  child: Icon(Icons.arrow_right),
                                )
                              ],
                            ),
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
    );
  }
}
