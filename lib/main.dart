import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/bottom_navigation_bar_provider.dart';
import 'package:test_app/providers/check_page_provider.dart';
import 'package:test_app/providers/contacts_provider.dart';
import 'package:test_app/providers/gallery_provider.dart';
import 'package:test_app/providers/news_provider.dart';
import 'package:test_app/providers/on_tap_provider.dart';
import 'package:test_app/test_apk/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CheckPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewProviders(),
        ),
        ChangeNotifierProvider(
          create: (_) => GalleryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContactsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OnTapContainerProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
