import 'package:cupertino_store/model/app_state_model.dart';
import 'package:cupertino_store/product_list_tab.dart';
import 'package:cupertino_store/search_tab.dart';
import 'package:cupertino_store/shopping_cart_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cupertino_store/model/app_state_model.dart';


void main() {
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
        create: (_) => AppStateModel()..loadProducts(),
      child: CupertinoStoreApp(),
    )

  );
}


class CupertinoStoreApp extends StatelessWidget {
  const CupertinoStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoStoreHomeApp(),
    );
  }
}

class CupertinoStoreHomeApp extends StatelessWidget {
  const CupertinoStoreHomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              label: 'Cart',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          late final CupertinoTabView returnValue;

          switch (index) {
            case 0:
              returnValue = CupertinoTabView(
                builder: (context){
                  return const CupertinoPageScaffold(
                      child: ProductListTab()
                  );
                },
              );
              break;

            case 1:
              returnValue = CupertinoTabView(
                builder: (context){
                  return CupertinoPageScaffold(
                      child: ProductSearchTab()
                  );
                },
              );
              break;

            case 2:
              returnValue = CupertinoTabView(
                builder: (context){
                  return const CupertinoPageScaffold(
                      child: ShoppingCartTab(),
                  );
                },
              );
              break;
          }
          return returnValue;
        },
    );
  }
}


