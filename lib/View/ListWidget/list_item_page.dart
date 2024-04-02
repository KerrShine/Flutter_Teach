import 'package:flutter/material.dart';

class ListItemPage extends StatefulWidget {
  const ListItemPage({super.key});

  @override
  State<ListItemPage> createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Item 頁面')),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Title'),
            subtitle: Text('SubTitle'),
            style: ListTileStyle.list,
            // selected: true,
            // selectedColor: Colors.red,
            trailing: Icon(Icons.zoom_out_rounded),
            // enabled: false,
            onTap: () {
              // Navigator.pop(context);
              debugPrint('on tap');
            },
          ),
          CustomListTile(
              title: 'title',
              subtitle: 'subtitle',
              backgroundColor: Colors.grey,
              borderColor: Colors.black),
          Card(
            margin: EdgeInsets.all(10.0), // 設定卡片的邊距
            child: Container(
              width: double.infinity,
              height: 100,
              child: Center(
                child: Text('CardView'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//客制元件化的的一種方式
class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color borderColor;
  final Function? onTapEvents;

  CustomListTile({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.borderColor,
    Function? this.onTapEvents,
  });

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor), // 設置邊框顏色
        ),
        child: ListTile(
          leading: SizedBox(
            height: 20.0,
            width: 20.0, // fixed width and height
            child: Image.asset(
              'assets/test.png',
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 20),
          ),
          trailing: Icon(Icons.zoom_out_rounded),
          onTap: () {
            debugPrint('Custom on tap');
            //ontap : click event
          },
          selected: isSelected,
          selectedColor: isSelected ? Colors.red : null,
          // selected: true,
          // 其他 ListTitle 的屬性也可以在這裡設定
        ),
      ),
    );
  }
}

//客制元件化的的一種方式
class CustomListTile_2 extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color borderColor;
  final Function? onTapEvents;

  CustomListTile_2({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.borderColor,
    Function? this.onTapEvents,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        height: 100,
        width: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor), // 設置邊框顏色
        ),
        child: ListTile(
          leading: SizedBox(
            height: 20.0,
            width: 20.0, // fixed width and height
            child: Image.asset(
              'assets/test.png',
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 20),
          ),
          trailing: Icon(Icons.zoom_out_rounded),
          onTap: () {
            // debugPrint('Custom on tap');
            onTapEvents!();
            //ontap : click event
          },
          // 其他 ListTitle 的屬性也可以在這裡設定
        ),
      ),
    );
  }
}

class CustomListTitle_3 extends StatefulWidget {
  CustomListTitle_3({
    super.key,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.borderColor,
    Function(String item)? this.onTapEvents,
    bool? isSelected,
  });

  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color borderColor;
  bool? isSelected;
  final Function? onTapEvents;

  @override
  State<CustomListTitle_3> createState() => _CustomListTitle_3State();
}

class _CustomListTitle_3State extends State<CustomListTitle_3> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: Border.all(color: widget.borderColor), // 設置邊框顏色
        ),
        child: ListTile(
          leading: SizedBox(
            height: 20.0,
            width: 20.0, // fixed width and height
            child: Image.asset(
              'assets/test.png',
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            widget.subtitle,
            style: TextStyle(fontSize: 20),
          ),
          trailing: Icon(Icons.zoom_out_rounded),
          onTap: () {
            debugPrint('Custom on tap');
            widget.onTapEvents!('內部按鈕資料回調');
            setState(() {
              isSelected = !isSelected;
            });
            //ontap : click event
          },
          selected: isSelected,
          selectedColor: isSelected ? Colors.red : null,
          // selected: true,
          // 其他 ListTitle 的屬性也可以在這裡設定
        ),
      ),
    );
  }
}
