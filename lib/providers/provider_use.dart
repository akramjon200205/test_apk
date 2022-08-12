import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_app/test_apk/models/news_model.dart';
import 'package:test_app/utills/contants.dart';

class NewProviders extends ChangeNotifier {
  ComState state = ComState.isInit;
  NewsModel newsModel;
  List<NewsModel> listNewsPage = [];

  NewProviders(
    this.listNewsPage,
    this.newsModel,
  );

  Future loadNews(String text,) async {
    try {
      state = ComState.isBusy;
      notifyListeners();
      var response = await get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/posts',
        ),
      );
      if (response.statusCode == 200) {
        for (var element in jsonDecode(response.body)) {
          newsModel = NewsModel.fromJson(element);
          listNewsPage.add(newsModel);
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
