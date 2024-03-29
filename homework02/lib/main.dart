/// homework02 is a tutorial that uses SavedPreferences to save and load one value
///
/// Based on this tutorial:
/// http://www.coderzheaven.com/2019/01/29/flutter-tutorial-shared-preferences-android-and-ios/


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

void main() => runApp(SharedPreferencesDemo());

class SharedPreferencesDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences (homework02)',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SharedPreferencesPage(),
    );
  }
}

class SharedPreferencesPage extends StatefulWidget {
  @override
  State createState() => new SharedPreferencesState();
}

class SharedPreferencesState extends State<SharedPreferencesPage> {
  String data = '';
  String nameKey = '_key_name';
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler(
          (MethodCall methodcall) async {
        if (methodcall.method == 'getAll') {
          return {'flutter.' + nameKey: '[ No Name Saved ]'};
        }
        return null;
      },
    );
    setData();
  }

  Future<bool> saveData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return await preferences.setString(nameKey, controller.text);
  }

  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameKey);
  }

  setData() {
    loadData().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Shared Preferences (homework02)')
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration.collapsed(hintText: 'Enter Name'),
            ),
            OutlineButton(
              child: Text('SAVE NAME'),
              onPressed: (){
                saveData();
              },
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
            OutlineButton(
              child: Text('LOAD NAME'),
              onPressed: (){
                setData();
              },
            )
          ],
        ),
      ),
    );
  }
}