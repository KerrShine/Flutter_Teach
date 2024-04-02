import 'package:flutter/material.dart';
import 'package:mvvm_pro/View/APIExampleWidget/api_menu.dart';
import 'package:mvvm_pro/View/APIExampleWidget/get_it_page.dart';
import 'package:mvvm_pro/View/APIExampleWidget/http_widget_page.dart';
import 'package:mvvm_pro/View/APIExampleWidget/provider_compared_page.dart';
import 'package:mvvm_pro/View/APIExampleWidget/provider_widget_page.dart';
import 'package:mvvm_pro/View/ListWidget/grid_menu.dart';
import 'package:mvvm_pro/View/ListWidget/gridview_page_2.dart';
import 'package:mvvm_pro/View/NoRouterPage.dart';
import 'package:mvvm_pro/View/RouterPathWidget/router_next_page.dart';
import 'package:mvvm_pro/View/BaseWidget/stateful_widget_page.dart';
import 'package:mvvm_pro/View/BaseWidget/stateless_widget_page.dart';
import 'package:mvvm_pro/View/BaseWidget/widget_menu.dart';
import 'package:mvvm_pro/View/ComponentWidget/bottom_sheet_page.dart';
import 'package:mvvm_pro/View/ComponentWidget/button_page.dart';
import 'package:mvvm_pro/View/ComponentWidget/checkbox_page.dart';
import 'package:mvvm_pro/View/ComponentWidget/component_menu.dart';
import 'package:mvvm_pro/View/ComponentWidget/date_time_page.dart';
import 'package:mvvm_pro/View/ComponentWidget/image_page.dart';
import 'package:mvvm_pro/View/ComponentWidget/radio_button.dart';
import 'package:mvvm_pro/View/ComponentWidget/slider_page.dart';
import 'package:mvvm_pro/View/ComponentWidget/switch_page.dart';
import 'package:mvvm_pro/View/ComponentWidget/text_page.dart';
import 'package:mvvm_pro/View/ComponentWidget/textfield_page.dart';
import 'package:mvvm_pro/View/DialogWidget/DialogPage.dart';
import 'package:mvvm_pro/View/ListWidget/expansionpanel_list_page.dart';
import 'package:mvvm_pro/View/ListWidget/gridview_page.dart';
import 'package:mvvm_pro/View/ListWidget/list_menu.dart';
import 'package:mvvm_pro/View/ListWidget/list_item_page.dart';
import 'package:mvvm_pro/View/ListWidget/listview_page.dart';
import 'package:mvvm_pro/View/APIExampleWidget/api_page.dart';
import 'package:mvvm_pro/View/BaseWidget/scaffold_widget_page.dart';
import 'package:mvvm_pro/View/RouterPathWidget/router_menu.dart';
import 'package:mvvm_pro/View/RouterPathWidget/router_pass_param.dart';
import 'package:mvvm_pro/View/StorageWidget/share_preference_page.dart';
import 'package:mvvm_pro/View/StorageWidget/sqlite_page.dart';
import 'package:mvvm_pro/View/StorageWidget/storage_menu.dart';
import 'package:mvvm_pro/View/i10nWidget/i10nPage.dart';
import 'package:mvvm_pro/View/menu_page.dart';

class RouterName {
  static const String menuPage = '回到首頁';
  static const String apiPage = 'API範例';
  static const String baseWidgetPage = '基礎佈局';
  static const String componentPage = '元件介紹';
  static const String listPage = '列表介紹';
  static const String dialogPage = 'Dialog 介紹';
  static const String routerPage = 'Router介紹';
  static const String i10nPage = '多國語介紹';
  static const String storagePage = '本地儲存介紹';

  static var data = [
    baseWidgetPage,
    componentPage,
    listPage,
    dialogPage,
    routerPage,
    i10nPage,
    apiPage,
    storagePage
  ];
}

class WidgetRouterName {
  static const String statefulwidgetPage = 'Stateful Widget 頁面';
  static const String statefullessPage = 'Statefulless Widget 頁面';
  static const String scaffoldPage = 'Scaffold Widget 頁面';

  static var data = [statefulwidgetPage, statefullessPage, scaffoldPage];
}

class ComponentRouterName {
  static const String textWidgetPage = 'Text 頁面';
  static const String textFieldPage = 'TextField 頁面';
  static const String buttonPage = 'Buttom 頁面';
  static const String radioPage = 'Radio 頁面';
  static const String checkBoxPage = 'CheckBox 頁面';
  static const String switchPage = 'Switch 頁面';
  static const String sliderPage = 'Slider 頁面';
  static const String imageVewPage = 'ImageView 頁面';
  static const String bottomSheetPage = 'Bottom Sheet 頁面';
  static const String dateTimePickPage = 'DateTimePick 頁面';

  static var data = [
    textWidgetPage,
    textFieldPage,
    buttonPage,
    radioPage,
    checkBoxPage,
    switchPage,
    sliderPage,
    imageVewPage,
    bottomSheetPage,
    dateTimePickPage,
  ];
}

class ListRouterName {
  static const String ListTitleView = 'ListItem 頁面';
  static const String NormalListView = '一般列表 頁面';
  static const String GridListView = 'GridView 頁面';
  static const String ExpansionList = 'ExpansionList 頁面';

  static var data = [
    ListTitleView,
    NormalListView,
    GridListView,
    ExpansionList
  ];
}

class GridRouteName {
  static const String GridView_1 = 'FixedCrossAxisCount 頁面';
  static const String GridView_2 = 'MaxCrossAxisExtent  頁面';

  static var data = [GridView_1, GridView_2];
}

class ApiRouterName {
  static const String HttpPage = 'Http 頁面';
  static const String Provider = '使用Provide 頁面';
  static const String Provide_without = '未使用Provide 頁面';
  static const String get_it = 'get_it 頁面';
  static const String MVVM = 'MVVM Design Pattern';
  static var data = [HttpPage, Provide_without, Provider, get_it, MVVM];
}

class StorageRouterName {
  static const String SharedReference = 'Shared Reference 頁面';
  static const String Sqlite = 'SQLite 頁面';

  static var data = [SharedReference, Sqlite];
}

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //主目錄頁面
      case RouterName.menuPage:
        return MaterialPageRoute(builder: (context) => const MenuPage());
      case RouterName.apiPage:
        return MaterialPageRoute(builder: (context) => const APIMenuPage());
      case RouterName.baseWidgetPage:
        return MaterialPageRoute(builder: (context) => const WidgetMenu());
      case RouterName.componentPage:
        return MaterialPageRoute(builder: (context) => const ComponentMenu());
      case RouterName.dialogPage:
        return MaterialPageRoute(builder: (context) => const DialogPage());
      case RouterName.listPage:
        return MaterialPageRoute(builder: (context) => const ListViewMenu());
      case RouterName.routerPage:
        return MaterialPageRoute(builder: (context) => const RouterMenuPage());
      case RouterName.i10nPage:
        return MaterialPageRoute(builder: (context) => const i10nPage());
      case RouterName.storagePage:
        return MaterialPageRoute(builder: (context) => const StorageMenuPage());
      //基礎佈局目錄頁面
      case WidgetRouterName.scaffoldPage:
        return MaterialPageRoute(
            builder: (context) => const ScaffoldWidgetPage());
      case WidgetRouterName.statefulwidgetPage:
        return MaterialPageRoute(
            builder: (context) => const MyStatefulWidget());
      case WidgetRouterName.statefullessPage:
        //元件目錄頁面
        return MaterialPageRoute(builder: (context) => MyStatelessWidget(''));
      case ComponentRouterName.textWidgetPage:
        return MaterialPageRoute(builder: (context) => const TextWidget());
      case ComponentRouterName.textFieldPage:
        return MaterialPageRoute(builder: (context) => const TextFieldPage());
      case ComponentRouterName.buttonPage:
        return MaterialPageRoute(builder: (context) => const ButtonPage());
      case ComponentRouterName.radioPage:
        return MaterialPageRoute(builder: (context) => const RadioButtonPage());
      case ComponentRouterName.checkBoxPage:
        return MaterialPageRoute(builder: (context) => const CheckBoxPage());
      case ComponentRouterName.switchPage:
        return MaterialPageRoute(builder: (context) => const SwitchPage());
      case ComponentRouterName.sliderPage:
        return MaterialPageRoute(builder: (context) => const SlidePage());
      case ComponentRouterName.imageVewPage:
        return MaterialPageRoute(builder: (context) => const ImageViewPage());
      case ComponentRouterName.bottomSheetPage:
        return MaterialPageRoute(builder: (context) => const BottomSheetPage());
      case ComponentRouterName.dateTimePickPage:
        return MaterialPageRoute(
            builder: (context) => const DateTimePickPage());
      //列表目錄
      case ListRouterName.ListTitleView:
        return MaterialPageRoute(builder: (context) => const ListItemPage());
      case ListRouterName.NormalListView:
        return MaterialPageRoute(builder: (context) => const ListViewPage());
      case ListRouterName.GridListView:
        return MaterialPageRoute(builder: (context) => const GridViewMenu());
      case ListRouterName.ExpansionList:
        return MaterialPageRoute(
            builder: (context) => const ExpansionListPage());
      //Grid 表單目錄
      case GridRouteName.GridView_1:
        return MaterialPageRoute(
            builder: (context) => const GridListViewPage());
      case GridRouteName.GridView_2:
        return MaterialPageRoute(
            builder: (context) => const GridListView_2_Page());
      //API 介紹頁面
      case ApiRouterName.HttpPage:
        return MaterialPageRoute(builder: (context) => const httpPage());
      case ApiRouterName.Provide_without:
        return MaterialPageRoute(
            builder: (context) => const WithoutProviderPage());
      case ApiRouterName.Provider:
        return MaterialPageRoute(builder: (context) => const ProviderWidget());
      case ApiRouterName.get_it:
        return MaterialPageRoute(builder: (context) => const GetItPage());
      case ApiRouterName.MVVM:
        return MaterialPageRoute(builder: (context) => const APIPage());
      //路徑 介紹頁面
      case "Router_Name":
        return MaterialPageRoute(builder: (context) => const RouterNextPage());
      case "Router_PassData":
        return MaterialPageRoute(
            builder: (context) =>
                RouterPassDataPage(ParamExample: settings.arguments as String));
      //本地儲存 頁面
      case StorageRouterName.SharedReference:
        return MaterialPageRoute(
            builder: (context) => const SharedPreferencePage());
      case StorageRouterName.Sqlite:
        return MaterialPageRoute(builder: (context) => const SqlitePage());

      //若Router 沒有指向 default和麵
      default:
        {
          return MaterialPageRoute(
              builder: (context) => NoRouterPage(name: settings.name!));
        }
    }
  }
}
