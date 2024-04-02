import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencePage extends StatefulWidget {
  const SharedPreferencePage({super.key});

  @override
  State<SharedPreferencePage> createState() => _SharedPreferencePageState();
}

class _SharedPreferencePageState extends State<SharedPreferencePage> {
  TextEditingController _textController = TextEditingController(text: '');
  String storedValue = '讀取Text';

  @override
  void initState() {
    super.initState();
    // delValue();
  }

  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Center(
  //       child: Text('讀取本地資料'),
  //     ),
  //   ),
  // );

  //儲存資料
  saveValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('myKey', _textController.text);
  }

  //讀取資料
  loadStoredValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      storedValue = prefs.getString('myKey') ?? 'No value';
    });
  }

  //刪除資料
  delValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('mykey');
  }

  //清除掉SharePreferenced
  delAllValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPrefenence 介紹'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  hintText: '本地端要儲存文字'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: saveValue,
              child: Text(
                '儲存',
                style: const TextStyle(
                  //字體屬性
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '${storedValue}',
              style: const TextStyle(
                //字體屬性
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: loadStoredValue,
              child: Text(
                '讀取',
                style: const TextStyle(
                  //字體屬性
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: delAllValue,
              child: Text(
                '刪除',
                style: const TextStyle(
                  //字體屬性
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
