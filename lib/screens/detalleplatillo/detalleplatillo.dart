import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp_cliente/provider/provider.dart';

class DetallePlatillo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.nombreplato),
      ),
      body: Container(
      color: Colors.white12,
      child: SafeArea(
        child: Center(
          child: Container(
            height: 500,
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('platillos')
                  .where("nombre", isEqualTo: provider.nombreplato)
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
                        return Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(document["imagen"]),
                                        fit: BoxFit.cover)),
                              ),
                              Card(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(15),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .05,
                                      child: Text(
                                        document["nombre"],
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Text(
                                      "Descripcion:",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height * .19,
                                      child: ListView(
                                        children: <Widget>[
                                          Text(
                                            document["descripcion"],
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width*.9,
                                        height:MediaQuery.of(context).size.height*.1,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.monetization_on),
                                          Text(document["precio"]+"MXN",style: TextStyle(color: Colors.black87,fontSize: 19,fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                        ),
                                    MaterialButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      color: Colors.redAccent,
                                      shape: StadiumBorder(),
                                      child: Text("Agregar a mi Orden",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white)),
                                    )
                                  ],
                                ),
                              )
                            ],
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
    ),
    );
  }
}
