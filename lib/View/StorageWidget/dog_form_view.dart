import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class dog_form_page extends StatelessWidget {
  final TextEditingController IdField;
  final TextEditingController NameField;
  final TextEditingController AgeField;
  dog_form_page(
      {super.key,
      required this.IdField,
      required this.NameField,
      required this.AgeField});

  @override
  Widget build(BuildContext context) {
    //類似

    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Row(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              const SizedBox(
                width: 80,
                child: Text(
                  'ID:',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: IdField,
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: Row(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              const SizedBox(
                width: 80,
                child: Text(
                  'Name:',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: NameField,
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: Row(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              const SizedBox(
                width: 80,
                child: Text(
                  'Age:',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: AgeField,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
