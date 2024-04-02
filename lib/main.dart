import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_pro/Repository/IAPIRepository.dart';
import 'package:mvvm_pro/Repository/APIRepo.dart';
import 'package:mvvm_pro/Router/router_page.dart';
import 'package:mvvm_pro/ViewModel/api_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'View/APIExampleWidget/get_it_model.dart';

GetIt locator = GetIt.instance;
void main() {
  setupLocator();
  runApp(
    const MyApp(),
  );
}

// get_it 註冊 viewModel,repository
void setupLocator() {
  //mvvm example
  GetIt.I.registerFactory<APIViewModel>(() => APIViewModel(
        GetIt.I<IAPIRepository>(),
      ));
  GetIt.I.registerSingleton<IAPIRepository>(APIRepo());

  //get it example
  GetIt.I.registerLazySingleton<UserRepository>(() => UserRepository());
  GetIt.I.registerLazySingleton<UserService>(
      () => UserService(GetIt.I<UserRepository>()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetIt.I.get<APIViewModel>())
      ],
      child: MaterialApp(
        title: 'Flutter教學示範',
        onGenerateRoute: MyRouter.generateRoute,
        initialRoute: RouterName.menuPage,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: const Locale('ja'), // 改變語系,
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50), // NEW
              backgroundColor: Color.fromRGBO(210, 210, 210, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.0),
              ),
              side: BorderSide(color: Colors.black),
              foregroundColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
