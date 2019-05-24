import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp_cliente/provider/provider.dart';
import 'package:restaurapp_cliente/screens/initial.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:restaurapp_cliente/screens/tabs/tab1.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final provider = Provider.of<MyProvider>(context);

    Widget _bodyController (){
      switch (provider.bottombarindex){
        case 0 :
        return Tab1();
      
        default:
        return Container(child: Text("Not Found"),);
      }

    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.backspace),
          onPressed: () {
            provider.mesanum = "";
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => InitialPage()));
          },
          label: Text("volver"),
        ),
        body: _bodyController(),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.orange,
          items: <Widget>[
            Icon(Icons.add_alert, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.subject, size: 30),
            Icon(Icons.person_outline)
          ],
          onTap: (index) {
            provider.bottombarindex = index;
            //Handle button tap
          },
        ),
      ),
    );
  }
}
