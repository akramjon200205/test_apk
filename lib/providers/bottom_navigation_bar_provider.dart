import 'package:flutter/cupertino.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int? currentIndex;

  String appBarText() {
    String text = currentIndex == 0
        ? 'News'
        : currentIndex == 1
            ? 'Gallery'
            : currentIndex == 2
                ? 'Check'
                : 'Contacts';
    notifyListeners();
    return text;
  }

  void updatePage() {
    notifyListeners();
  }
}
