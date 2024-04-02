import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_pro/Repository/IAPIRepository.dart';
import 'package:mvvm_pro/main.dart';
import 'package:mvvm_pro/Model/login_data_model.dart';
import 'package:mvvm_pro/Repository/APIRepo.dart';
import 'package:mvvm_pro/ViewModel/api_view_model.dart';
import 'package:provider/provider.dart';

class APIPage extends StatefulWidget {
  const APIPage({super.key});

  @override
  State<APIPage> createState() => _APIPageState();
}

class _APIPageState extends State<APIPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint('widget refreash!');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Sample'),
      ),
      body: Center(
        child: Column(children: [
          Consumer<APIViewModel>(builder: (context, viewmodel, child) {
            if (viewmodel.data != null) {
              return Column(
                children: [
                  Text(
                    'Username: ${viewmodel.data!.reversed.first.catalog}',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  Text(
                    'Email: ${viewmodel.data!.reversed.first.dataSource}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              );
            } else {
              return const Center(
                  child: Column(
                children: [
                  Text('User data not loaded yet.'),
                ],
              ));
            }
          }),
          ElevatedButton(
            onPressed: () async {
              await Provider.of<APIViewModel>(context, listen: false)
                  .getLoginData();
            },
            child: Text('Get User Data'),
          ),
          Consumer<APIViewModel>(builder: (context, viewmodel, child) {
            if (viewmodel.sheedata != null) {
              return Column(
                children: [
                  Text(
                    'Sheet: ${viewmodel.sheedata!.reversed.first.sheet}',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Text(
                    'kinds: ${viewmodel.sheedata!.reversed.first.kinds}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              );
            } else {
              return const Center(
                  child: Column(
                children: [
                  Text('sheet data not loaded yet.'),
                ],
              ));
            }
          }),
          ElevatedButton(
            onPressed: () async {
              await Provider.of<APIViewModel>(context, listen: false)
                  .getSheetData();

              //不會更新 須在provider中 才是static
              // APIViewModel viewModel = GetIt.I.get<APIViewModel>();
              // await viewModel.getSheetData();
            },
            child: Text('Get Sheet Data'),
          ),
        ]),
      ),
    );
  }
}
