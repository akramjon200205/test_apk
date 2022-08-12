import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:test_app/test_apk/models/gallery_model.dart';
import 'package:test_app/utills/contants.dart';

class GalleryProvider extends ChangeNotifier {
  GalleryModel galleryModel = GalleryModel();
  ComState state = ComState.isInit;
  List<GalleryModel> listGallery = [];

  Future loadGallery() async {
    try {
      state = ComState.isBusy;
      notifyListeners();
      var response = await get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/albums',
        ),
      );
      if (response.statusCode == 200) {
        for (var element in jsonDecode(response.body)) {
          galleryModel = GalleryModel.fromJson(element);
          listGallery.add(galleryModel);
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
