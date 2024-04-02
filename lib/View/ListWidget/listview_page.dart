import 'package:flutter/material.dart';
import 'package:mvvm_pro/View/ListWidget/list_item_page.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

bool Selected = true;
String item = '123';

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView 範例'),
      ),
      body: Column(
        children: [
          Text('1.垂直Scroll'),
          Container(
            height: 300,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return CustomListTitle_3(
                  title: 'title_$index',
                  subtitle: 'subtitle',
                  backgroundColor: Colors.grey,
                  borderColor: Colors.white,
                  isSelected: Selected,
                  //從外部事件引入
                  onTapEvents: (String item) {
                    debugPrint('Custom detail on tap $item');
                    Selected = !Selected;
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text('2.水平Scroll'),
          Container(
            height: 100,
            width: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                return CustomListTile_2(
                  title: 'title_$index',
                  subtitle: 'subtitle',
                  backgroundColor: Colors.grey,
                  borderColor: Colors.white,
                  //從外部事件引入
                  onTapEvents: () {
                    debugPrint('Custom detail on tap');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void TapEvent() {
    debugPrint('Custom on tap 2');
  }
}
