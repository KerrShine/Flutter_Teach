import 'package:flutter/material.dart';

class GridListView_2_Page extends StatefulWidget {
  const GridListView_2_Page({super.key});

  @override
  State<GridListView_2_Page> createState() => _GridListView_2_PageState();
}

class _GridListView_2_PageState extends State<GridListView_2_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaxCrossAxisExtent 示範'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 100.0,
          maxCrossAxisExtent: 100.0, // 每行（列）顯示的項目的最大寬度或最大高度
          crossAxisSpacing: 8.0, // 水平方向的間距
          mainAxisSpacing: 8.0, // 垂直方向的間距
          // childAspectRatio: 1.0, // 子元素的寬高比
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return GridItem(index: index);
        },
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final int index;

  GridItem({required this.index});

  @override
  Widget build(BuildContext context) {
    // double itemSize = 1.0 + (index % 3) * 20.0;

    return Container(
      color: Colors.blue,
      // height: itemSize,
      // width: itemSize,
      alignment: Alignment.center,
      child: Text(
        'Item $index',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
