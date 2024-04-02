import 'package:flutter/material.dart';

class GridListViewPage extends StatefulWidget {
  const GridListViewPage({super.key});

  @override
  State<GridListViewPage> createState() => _GridListViewPageState();
}

class _GridListViewPageState extends State<GridListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FixedCrossAxisCount 頁面'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 每行顯示的列數
          crossAxisSpacing: 1.0, // 列之間的間距
          mainAxisSpacing: 1.0, // 行之間的間距
        ),
        itemCount: 10, // 總共的項目數
        itemBuilder: (BuildContext context, int index) {
          return GridItem(index);
        },
        // scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final int index;

  GridItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Center(
        child: Text(
          'Item $index',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
