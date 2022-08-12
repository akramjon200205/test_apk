import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:test_app/test_apk/models/on_tap_container_model.dart';
import 'package:test_app/utills/contants.dart';

class OnTapContainerProvider extends ChangeNotifier {
  OnTapContainerModel onTapContainerModel = OnTapContainerModel();
  ComState state = ComState.isInit;
  List<OnTapContainerModel> listOnTapContainerModel = [];
  List jsonlist = [];

  Future loadOnTapContainer() async {
    try {
      state = ComState.isBusy;
      notifyListeners();
      var response = await get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/comments',
        ),
      );
      if (response.statusCode == 200) {
        for (var element in jsonDecode(response.body)) {
          onTapContainerModel = OnTapContainerModel.fromJson(element);
          listOnTapContainerModel.add(onTapContainerModel);

          state = ComState.isSuccess;
        notifyListeners();

        }
        // jsonlist = jsonDecode(response.body);
        // print(jsonlist);
        
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
