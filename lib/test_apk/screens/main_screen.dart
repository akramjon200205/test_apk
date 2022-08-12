import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/bottom_navigation_bar_provider.dart';
import 'package:test_app/test_apk/screens/check_page.dart';
import 'package:test_app/test_apk/screens/contacts_page.dart';
import 'package:test_app/test_apk/screens/gallery_page.dart';
import 'package:test_app/test_apk/screens/news_screens.dart';
import 'package:test_app/utills/contants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    context.read<BottomNavigationBarProvider>().currentIndex = 0;
    // loadJson();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: appBarColor,
            centerTitle: true,
            title: Text(
              provider.appBarText(),
              style: kTextStyle(
                size: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: provider.currentIndex == 0
              ? const NewsPage()
              : provider.currentIndex == 1
                  ? const GalleryPage()
                  : provider.currentIndex == 2
                      ? const CheckPage()
                      : const ContactsPage(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.currentIndex!,
            onTap: (index) {
              provider.currentIndex = index;
              provider.updatePage();
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'News',
                backgroundColor: bottomNavigationBarColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.photo_sharp),
                label: 'Gallery',
                backgroundColor: bottomNavigationBarColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: 'Check',
                backgroundColor: bottomNavigationBarColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.contact_page),
                label: 'Contacts',
                backgroundColor: bottomNavigationBarColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
