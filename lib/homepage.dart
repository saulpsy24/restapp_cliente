import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp_cliente/provider/provider.dart';
import 'package:restaurapp_cliente/screens/initial.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:restaurapp_cliente/screens/tabs/tab1.dart';
import 'package:restaurapp_cliente/screens/tabs/tab2.dart';
import 'package:restaurapp_cliente/screens/tabs/tab3.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final provider = Provider.of<MyProvider>(context);

    Widget _bodyController (){
      switch (provider.bottombarindex){
        case 0 :
        return Tab1();
        case 1:
        return Tab2();
        case 2:
        return Tab3();
      
        default:
        return Container(child: Text("Not Found"),);
      }

    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
       
        body: _bodyController(),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.grey[300],
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
