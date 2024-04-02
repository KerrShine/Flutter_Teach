import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({super.key});

  @override
  State<CheckBoxPage> createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool isChecked = false;
  bool isChecked2 = false;
  String strIntent = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Box 頁面'),
      ),
      body: Column(
        children: <Widget>[
          Text('CheckBox'),
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                    if (value)
                      strIntent = 'Check Content 1';
                    else
                      strIntent = '';
                  });
                },
                checkColor: Colors.blue,
              ),
              Text('Check Content 1')
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: isChecked2,
                onChanged: (value) {
                  setState(() {
                    isChecked2 = value!;
                    if (value)
                      strIntent = 'Check Content 2';
                    else
                      strIntent = '';
                  });
                },
                activeColor: Colors.red,
              ),
              Text('Check Content 2')
            ],
          ),
          Text(
            '使用CheckboxListTitle',
          ),
          CheckboxListTile(
            title: Text('Checkbox 1'),
            subtitle: Text('Subtitle 1'),
            secondary: Icon(Icons.hourglass_empty),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Checkbox 2'),
            subtitle: Text('Subtitle 2'),
            secondary: Icon(Icons.check),
            value: isChecked2,
            onChanged: (value) {
              setState(() {
                isChecked2 = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
