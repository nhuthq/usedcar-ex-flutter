import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:usedcar_ex_flutter/presentation/journey/Home/home_screen.dart';
import 'package:usedcar_ex_flutter/presentation/journey/KodawariSearch/kodawari_search_screen.dart';
import 'package:usedcar_ex_flutter/presentation/journey/RecentSearch/recent_search_screen.dart';
import 'package:usedcar_ex_flutter/presentation/journey/Search/search_screen.dart';
import 'package:usedcar_ex_flutter/presentation/journey/favorite/favorite_screen.dart';
import 'package:usedcar_ex_flutter/presentation/widgets/custom_nav_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late String _title;
  late final List<Widget> _chilScreens;
  late final ValueNotifier<int> _tabNotifier;
  late final WebViewController _webViewController;

  DateTime currentBackPressTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _title = 'Home';
    _tabNotifier = ValueNotifier(0);
    _webViewController = WebViewController();

    _chilScreens = [
      HomeScreen(
        controller: _webViewController,
        topURL: 'https://flutter.dev',
      ),
      SearchScreen(),
      KodawariSearchScreen(),
      RecentSearchScreen(),
      FavoriteScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: AnimatedBuilder(
        animation: _tabNotifier,
        builder: (_, __) {
          return Scaffold(
            appBar: AppBar(
              title: Text(_title),
              actions: [CustomNavigationBar(controller: _webViewController)],
            ),
            endDrawer: _buildDrawer(context),
            body:
                IndexedStack(index: _tabNotifier.value, children: _chilScreens),
            bottomNavigationBar: SafeArea(
              top: false,
              child: SalomonBottomBar(
                margin: const EdgeInsets.all(10),
                itemPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                currentIndex: _tabNotifier.value,
                selectedItemColor: theme.primaryColor,
                onTap: (int index) {
                  _tabNotifier.value = index;
                  switch (index) {
                    case 0:
                      _title = 'Home';
                      break;
                    case 1:
                      _title = 'Search';
                      break;
                    case 2:
                      _title = 'Kodawari';
                      break;
                    case 3:
                      _title = 'Recent';
                      break;
                    case 4:
                      _title = 'Favotite';
                      break;
                  }
                },
                items: [
                  /// Home
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.local_drink_outlined),
                    title: const Text('Home'),
                    selectedColor: theme.primaryColor,
                  ),

                  /// Search
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.category_outlined),
                    title: const Text('Search'),
                    selectedColor: Colors.blue,
                  ),

                  /// Kodawari
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.favorite_border),
                    title: const Text('Kodawari'),
                    selectedColor: Colors.pink,
                  ),

                  /// Recent
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.more_horiz),
                    title: const Text('Recent'),
                    selectedColor: Colors.orange,
                  ),

                  /// Favorite
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.more_horiz),
                    title: const Text('Favorite'),
                    selectedColor: Colors.orange,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool> _onWillPop() {
    final now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      debugPrint("Pressssss!!!!");
      return Future.value(false);
    }
    return Future.value(true);
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              _title = 'Home';
              Navigator.of(context).pop();
              _tabNotifier.value = 0;
            },
          ),
          ListTile(
            title: const Text('Search'),
            onTap: () {
              _title = 'Search';
              Navigator.of(context).pop();
              _tabNotifier.value = 1;
            },
          ),
          ListTile(
            title: const Text('Kodawari'),
            onTap: () {
              _title = 'Kodawari';
              Navigator.of(context).pop();
              _tabNotifier.value = 2;
            },
          ),
          ListTile(
            title: const Text('Recent'),
            onTap: () {
              _title = 'Recent';
              Navigator.of(context).pop();
              _tabNotifier.value = 3;
            },
          ),
          ListTile(
            title: const Text('Favorite'),
            onTap: () {
              _title = 'Favorite';
              Navigator.of(context).pop();
              _tabNotifier.value = 4;
            },
          ),
        ],
      ),
    );
  }
}
