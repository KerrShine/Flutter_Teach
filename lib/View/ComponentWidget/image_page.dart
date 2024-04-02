import 'package:flutter/material.dart';

class ImageViewPage extends StatefulWidget {
  const ImageViewPage({super.key});

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image 頁面'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '你需要Flutter嗎？',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Image.asset(
                'assets/test.png', //asset 為本地端圖片儲存區 須在pubspec.yaml 中宣告圖片
              ),
              const Text(
                '本地端圖片使用圖片渲染',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Image.asset(
                'assets/test.png', //asset 為本地端圖片儲存區 須在pubspec.yaml 中宣告圖片
                // width: 200.0, // 設置圖片寬度
                // height: 200.0, // 設置圖片高度
                fit: BoxFit.cover, // 設置圖片填充模式
                color: Colors.blue,
                colorBlendMode: BlendMode.darken,
                // BlendMode.clear: 清除顏色。
                // BlendMode.color: 將顏色和圖片進行融合。
                // BlendMode.colorBurn: 褪色模式。
                // BlendMode.colorDodge: 增亮模式。
                // BlendMode.darken: 讓顏色變暗。
                // BlendMode.difference: 產生差異的顏色。
                // BlendMode.exclusion: 生成排外的顏色。
                // BlendMode.hardLight: 硬光模式。
                // BlendMode.lighten: 讓顏色變亮。
                // BlendMode.multiply: 乘法混合模式。
                // BlendMode.overlay: 疊加混合模式。
                // BlendMode.screen: 屏幕混合模式。
                // BlendMode.softLight: 軟光模式。
              ),
              const Text(
                '線上圖片',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Image.network(
                  'https://static.accupass.com/org/2008030400328171309020.jpg'),
              const Text(
                '線上圖片 錯誤處理',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Image.network(
                'https://static.accupass.com/or/2008030400328171309020.jpg',
                errorBuilder: (context, error, stackTrace) {
                  return Text('Fialed');
                },
              ),
              const Text(
                '線上圖片 loading 時處理',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Image.network(
                'https://static.accupass.com/org/2008030400328171309020.jpg',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    );
                  }
                },
              )
            ],
          ),
        ));
  }
}
