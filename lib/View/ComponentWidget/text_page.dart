import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({super.key});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text 示範'),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '這是基礎的Text',
          ),
          const Text(
            '這是包含Style的Text',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
          const Text('這是有大小加粗的Text',
              style: TextStyle(
                fontWeight: FontWeight.bold, //字體屬性
                fontSize: 24,
                color: Colors.green,
              )),
          const Text(
              '限制長度大小，Each line here is progressively more opaque. The base color is material.Colors.black, and Color.withOpacity is used to create a derivative color with the desired opacity. The root TextSpan for this RichText widget is explicitly given the ambient DefaultTextStyle, since RichText does not do that automatically. The inner TextStyle objects are implicitly mixed with the parent TextSpans TextSpan.style.',
              textAlign: TextAlign.left,
              softWrap: true,
              maxLines: 3, // 3 行
              overflow: TextOverflow.ellipsis, // 限制長度 後方...
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          Text.rich(TextSpan(
            text: 'TextSpan.....',
            style: TextStyle(
              color: Colors.red,
              fontSize: 24.0,
            ),
            children: [
              TextSpan(
                text: 'TextSpan1.....',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              TextSpan(
                text: 'TextSpan2(換行).....\n',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              TextSpan(
                text: 'Tap點擊......',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('TextSpan Tap Span 文字手勢點擊'),
                    ));
                  },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
