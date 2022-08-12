import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:test_app/test_apk/models/check_model.dart';
import 'package:test_app/utills/contants.dart';

class CheckPageProvider extends ChangeNotifier {
  bool isChecked = false;
  ComState state = ComState.isInit;
  List<CheckModel> listCheck = [];
  CheckModel checkModel = CheckModel();

  Future loadCheck() async {
    try {
      state = ComState.isBusy;
      notifyListeners();
      var response = await get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/todos',
        ),
      );
      if (response.statusCode == 200) {
        for (var element in jsonDecode(response.body)) {
          checkModel = CheckModel.fromJson(element);
          listCheck.add(checkModel);
          state = ComState.isSuccess;
          notifyListeners();
        }        
      } else {
        state = ComState.isError;
        notifyListeners();
      }
    } on SocketException {
      state = ComState.isError;
      notifyListeners();
    } catch (e) {
      state = ComState.isError;
      notifyListeners();
    }
  }


  void updatePage() {
    notifyListeners();
  }
}
