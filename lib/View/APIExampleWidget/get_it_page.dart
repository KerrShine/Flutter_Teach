import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_pro/View/APIExampleWidget/get_it_model.dart';

class GetItPage extends StatefulWidget {
  const GetItPage({super.key});

  @override
  State<GetItPage> createState() => _GetItPageState();
}

class _GetItPageState extends State<GetItPage> {
  String showData = 'Get Data Here';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('get_it 示範'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: ElevatedButton(
                  onPressed: GetItEvent,
                  child: Text('Fetch User'),
                ),
              ),
            ),
            Text('${showData}'),
          ],
        ));
  }

  void GetItEvent() async {
    UserService userService = GetIt.I.get<UserService>();
    // 調用 UserService 的方法，獲取用戶數據
    User user = await userService.getUser();
    // call setState  改變狀況通知widget refreash
    setState(() {
      showData = 'User: ${user.name}, Age: ${user.age}';
    });
  }
}
