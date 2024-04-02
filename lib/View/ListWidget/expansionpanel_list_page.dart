import 'package:flutter/material.dart';

class ExpansionListPage extends StatefulWidget {
  const ExpansionListPage({super.key});

  @override
  State<ExpansionListPage> createState() => _ExpansionListPageState();
}

class _ExpansionListPageState extends State<ExpansionListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ExpansionPanelList 示範')),
        body: MyExpansionPanelList());
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyExpansionPanelList extends StatefulWidget {
  const MyExpansionPanelList({super.key});

  @override
  State<MyExpansionPanelList> createState() => _MyExpansionPanelListState();
}

class _MyExpansionPanelListState extends State<MyExpansionPanelList> {
  final List<Item> _data = generateItems(10);

  @override
  Widget build(BuildContext context) {
    //ScrollView
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = isExpanded;
            });
          },
          animationDuration: Duration(milliseconds: 500),
          elevation: 3.0, // 不要高於4 , 會出事
          dividerColor: Colors.black,
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.headerValue),
                );
              },
              body: ListTile(
                title: Text(item.expandedValue),
              ),
              isExpanded: item.isExpanded,
              canTapOnHeader: true,
              backgroundColor: Colors.blue[100],
            );
          }).toList(),
        ),
      ),
    );
  }
}
