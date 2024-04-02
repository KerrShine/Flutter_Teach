import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog 示範'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Dialog show message'),
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          )
                        ],
                      ),
                    ))),
            child: Text('Show Dialog'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => Dialog.fullscreen(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Full Screen Dialog'),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('close'))
                ],
              )),
            ),
            child: Text('Show Full Screen Dialg'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                      title: const Text('SimpleDialog Title'),
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            // 選擇第一個選項的處理邏輯
                            Navigator.pop(context, 'Option 1');
                          },
                          child: Text('Option 1'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            // 選擇第二個選項的處理邏輯
                            Navigator.pop(context, 'Option 2');
                          },
                          child: Text('Option 2'),
                        ),
                      ],
                    )),
            child: Text('Show SimpleDialog'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ])),
            child: Text('Show AlertDialog'),
          ),
        ],
      ),
    );
  }
}
