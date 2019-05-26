import 'package:flutter/material.dart';

class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Colors.redAccent, width: 2.0),
                      )),
                  child: Center(
                    child: Text("Orden Actual"),
                  ),
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.height * .1,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Colors.redAccent, width: 2.0),
                      )),
                  child: Center(
                    child: Text("Ordenes Anteriores"),
                  ),
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.height * .1,
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * .732,
              child: ListView(
                itemExtent: MediaQuery.of(context).size.height * .7,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .95,
                        height: MediaQuery.of(context).size.height * .7,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height * .1,
                                width: MediaQuery.of(context).size.width * .95,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "Ordenado Hoy",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .15,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black12, width: 1))),
                                child: Row(
                                  children: <Widget>[
                                    Text("Status:"),
                                    Container(
                                      height: 5,
                                      width: MediaQuery.of(context).size.width *
                                          .18,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.green,
                                      ),
                                    ),
                                    Container(
                                      height: 5,
                                      width: MediaQuery.of(context).size.width *
                                          .18,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.green,
                                      ),
                                    ),
                                    Container(
                                      height: 5,
                                      width: MediaQuery.of(context).size.width *
                                          .18,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.green,
                                      ),
                                    ),
                                    Container(
                                      height: 5,
                                      width: MediaQuery.of(context).size.width *
                                          .18,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .95,
                                height:
                                    MediaQuery.of(context).size.height * .20,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.black12),
                                  ),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text("1"),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black12,
                                                  width: 1)),
                                        ),
                                        
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text("Lasagna"),
                                          decoration: BoxDecoration(
                                              ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .95,
                      height: MediaQuery.of(context).size.height * .7,
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * .1,
                              width: MediaQuery.of(context).size.width * .95,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Ordenado Hoy",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .15,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black12, width: 1))),
                              child: Row(
                                children: <Widget>[
                                  Text("Status:"),
                                  Container(
                                    height: 5,
                                    width:
                                        MediaQuery.of(context).size.width * .18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green,
                                    ),
                                  ),
                                  Container(
                                    height: 5,
                                    width:
                                        MediaQuery.of(context).size.width * .18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green,
                                    ),
                                  ),
                                  Container(
                                    height: 5,
                                    width:
                                        MediaQuery.of(context).size.width * .18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green,
                                    ),
                                  ),
                                  Container(
                                    height: 5,
                                    width:
                                        MediaQuery.of(context).size.width * .18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
