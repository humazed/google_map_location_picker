import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //        appBar: AppBar(
//          title: const Text('Plugin example app'),
//        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () async {
                    var result = await LocationPicker.pickLocation(context);
                    print("result = ${result}");
                  },
                  child: Text('Pic location'),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
