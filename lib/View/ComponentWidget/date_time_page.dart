import 'package:flutter/material.dart';

class DateTimePickPage extends StatefulWidget {
  const DateTimePickPage({super.key});

  @override
  State<DateTimePickPage> createState() => _DateTimePickPageState();
}

class _DateTimePickPageState extends State<DateTimePickPage> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  //Future 非同步
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      // helpText: '日期',
      // cancelText: '取消',
      // confirmText: '確定',
      initialDatePickerMode: DatePickerMode.day,
      builder: (context, Widget? childs) {
        return Theme(
          data: ThemeData.dark(),
          child: childs!,
        );
      },
    );
    if (picked != null && picked != _selectedDate)
      setState(
        () {
          _selectedDate = picked;
        },
      );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      // helpText: '日期',
      // cancelText: '取消',
      // confirmText: '確定',
      builder: (context, Widget? childs) {
        return Theme(
          data: ThemeData.dark(),
          child: childs!,
        );
      },
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimePick 頁面'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Selected Date: ${_selectedDate.toLocal()}',
          ),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Select Date'),
          ),
          SizedBox(height: 20.0),
          Text(
            'Selected Time: ${_selectedTime.format(context)}',
          ),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: Text('Select Time'),
          ),
        ],
      ),
    );
  }
}
