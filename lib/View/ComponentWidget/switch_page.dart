import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch 頁面'),
      ),
      body: Column(
        children: [
          Switch(
            value: light,
            activeTrackColor: Colors.green, // 選擇器打開時的軌道顏色
            inactiveTrackColor: Colors.red, // 選擇器關閉時的軌道顏色
            activeColor: Colors.blue, //開啟時 thumb 顏色
            inactiveThumbColor: Colors.black, // 關閉時 thumb
            onChanged: (bool value) {
              setState(() {
                light = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
