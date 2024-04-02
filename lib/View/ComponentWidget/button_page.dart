import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    void ClickEvent() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Click Event'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('按鈕示範'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.0),
              ),
              side: BorderSide(color: Colors.transparent),
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              ClickEvent();
            },
            child: Text('ElevatedButton'),
          ),
          TextButton(
            onPressed: () {
              ClickEvent();
            },
            child: Text('TextButton'),
          ),
          OutlinedButton(
            child: Text('OutlinedButton'),
            onPressed: () {
              ClickEvent();
            },
          ),
          IconButton(
            onPressed: () {
              ClickEvent();
            },
            icon: Icon(Icons.holiday_village),
          ),
          FloatingActionButton(
            onPressed: () {
              ClickEvent();
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
