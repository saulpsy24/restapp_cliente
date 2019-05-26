import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp_cliente/homepage.dart';
import 'package:restaurapp_cliente/provider/provider.dart';
import 'package:restaurapp_cliente/screens/loginpage.dart';

class InitialPage extends StatelessWidget {
  Future _scanQr(context) async {
    var myprovider = Provider.of<MyProvider>(context);

    try {
      String qrResult = await BarcodeScanner.scan();
      myprovider.mesanum = qrResult;
    } on PlatformException catch (ex) {
      myprovider.mesanum = ex.message;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    var myprovider = Provider.of<MyProvider>(context);
    print(myprovider.currentUser);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .85,
              height: MediaQuery.of(context).size.width * .85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Center(
                  child: Column(
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/restaurapp.png"))),
                  ),
                  FloatingActionButton.extended(
                    icon: Icon(Icons.camera_alt),
                    label: Text("Scanear mesa"),
                    onPressed: () {
                      if (myprovider.currentUser != "") {
                        _scanQr(context).then((_) {
                          final page = HomePage();

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => page));
                        }).catchError((e) {
                          print(e.message);
                        });
                      } else {
                        final page = LoginPage();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => page));
                      }
                    },
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
