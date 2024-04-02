import 'package:flutter/material.dart';
import 'package:mvvm_pro/View/BaseWidget/column_widget_page.dart';
import 'package:mvvm_pro/View/BaseWidget/contain_widget_page.dart';
import 'package:mvvm_pro/View/BaseWidget/row_widget_page.dart';
import 'package:mvvm_pro/View/BaseWidget/stack_widget_page.dart';

class ScaffoldWidgetPage extends StatefulWidget {
  const ScaffoldWidgetPage({super.key});

  @override
  State<ScaffoldWidgetPage> createState() => _ScaffoldWidgetPageState();
}

class _ScaffoldWidgetPageState extends State<ScaffoldWidgetPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pageItem = [];
  @override
  void initState() {
    // 此處為初始狀態
    super.initState();

    pageItem = [ContainWidget(), ColumnWiget(), RowWidget(), StackPage()];
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('這是Title', style: (TextStyle(color: Colors.white))),
      ),
      body: Center(
        child: pageItem.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //超過3個需要這個設定
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Contain',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Column',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Row',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Stock',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: Container(
          child: Text('這邊是Drawer'),
          padding: EdgeInsets.fromLTRB(100, 100, 0, 0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('浮動按鈕事件'),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
