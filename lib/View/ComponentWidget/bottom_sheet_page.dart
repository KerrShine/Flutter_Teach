import 'package:flutter/material.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  double _sheetHeight = 0.2; // 初始高度占螢幕高度的百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomSheet 頁面'),
      ),
      body: Stack(
        children: [
          Expanded(
            child: Center(
              child: Text('Main Content'),
            ),
          ),
          DraggableScrollableSheet(
            // initialChildSize: _sheetHeight,
            initialChildSize: 0.1, // 初始高度占螢幕高度的百分比
            maxChildSize: 0.8, // 最大高度占螢幕高度的百分比
            minChildSize: 0.1, // 最小高度占螢幕高度的百分比

            builder: (BuildContext context, ScrollController scrollController) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0)),
                child: Container(
                  color: Colors.blue[100],
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('Item $index'));
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPersistentBottomSheet(context),
        child: Icon(Icons.add),
      ),
    );
  }

  //內建bottomsheet用
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Music'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Photos'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.videocam),
                title: Text('Videos'),
                onTap: () {
                  // Handle videos item
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPersistentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          child: Center(
            child: Text('This is a Persistent Bottom Sheet'),
          ),
        );
      },
    );
  }
}
