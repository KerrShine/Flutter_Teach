import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      //mainAxisAlignment : 用於控制子部件在主軸（垂直軸）上的對齊方式
      mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: 用於控制子部件在交叉軸（水平軸）上的對齊方式。
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisSize 用於控制 Column 在主軸上的大小。可以是 MainAxisSize.max（擴展到最大）或 MainAxisSize.min（只包含子部件的大小）。
      mainAxisSize: MainAxisSize.min,
      //verticalDirection 用於控制子部件在主軸上的排列方向，可以是 VerticalDirection.down（從上到下）或 VerticalDirection.up（從下到上）。
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        Text(
          '這是 Row 1  ',
          style: TextStyle(
            fontSize: 22,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          '這是 Row 2  ',
          style: TextStyle(
            fontSize: 22,
          ),
          textAlign: TextAlign.left,
        ),
        // Expanded(
        //   child: Text(
        //     '這是 Row 1  ',
        //     style: TextStyle(
        //       fontSize: 22,
        //     ),
        //     textAlign: TextAlign.left,
        //   ),
        // ),
        // Expanded(
        //   child: Text(
        //     '這是 Row 2  ',
        //     style: TextStyle(
        //       fontSize: 22,
        //     ),
        //     textAlign: TextAlign.left,
        //   ),
        // ),
      ],
    );
  }
}
