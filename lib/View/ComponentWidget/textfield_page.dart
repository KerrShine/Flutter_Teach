import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  //類似
  final TextEditingController _textController =
      TextEditingController(text: '綁定textfield 並給予初始文字');

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TextField 示範'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: TextField(),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  obscureText: true,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.key)),
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'hint word show',
                  ),
                  onChanged: (value) {
                    debugPrint('$value');
                  },
                  onSubmitted: (value) {
                    debugPrint('press enter submit $value');
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _textController.clear();
                      },
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
