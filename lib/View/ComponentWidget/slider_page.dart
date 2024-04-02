import 'package:flutter/material.dart';

class SlidePage extends StatefulWidget {
  const SlidePage({super.key});

  @override
  State<SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  double _currentSliderValue = 20;
  int mvalue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider 頁面'),
      ),
      //SliderTheme 是 Slider的 主題
      body: SliderTheme(
        data: const SliderThemeData(
          thumbColor: Colors.green,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
          trackHeight: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Slider(
              value: _currentSliderValue,
              max: 200,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  mvalue = _currentSliderValue.toInt();
                });
              },
            ),
            Text(
              '$mvalue',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
