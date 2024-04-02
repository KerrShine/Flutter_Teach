import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class RadioButtonPage extends StatefulWidget {
  const RadioButtonPage({super.key});

  @override
  State<RadioButtonPage> createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button 頁面'),
      ),
      body: Column(
        children: <Widget>[
          ListTileTheme(
              // contentPadding: EdgeInsets.all(10),
              dense: true,
              child: Column(
                children: [
                  Text('方法1:ListTile'),
                  ListTile(
                    title: const Text('Lafayette'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Thomas Jefferson'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text('方法2 RadioListTile:'),
          ),
          RadioListTile(
            title: Text('Male'),
            value: 'Male',
            groupValue: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
          ),
          RadioListTile(
            title: Text('Female'),
            value: 'Female',
            groupValue: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
          ),
          Text('方法3 Row + Radio and Text'),
          Row(
            children: [
              Radio(
                value: 'Male',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              // SizedBox(width: 8.0), // 調整 Radio 和 Text 之間的間距
              Text('Male'),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 'Female',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              // SizedBox(width: 8.0), // 調整 Radio 和 Text 之間的間距
              Text('Female'),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('$selectedGender'),
                ));
              },
              child: Text('取得radio資料'))
        ],
      ),
    );
  }
}
