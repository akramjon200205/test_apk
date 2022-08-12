import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:test_app/test_apk/models/contacts_model.dart';
import 'package:test_app/utills/contants.dart';

class ContactsProvider extends ChangeNotifier {
  ContactsModel contactsModel = ContactsModel();
  ComState state = ComState.isInit;
  List<ContactsModel> listContacts = [];

  Future loadContacts() async {
    try {
      state = ComState.isBusy;
      notifyListeners();
      var response = await get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/users',
        ),
      );
      if (response.statusCode == 200) {
        for (var element in jsonDecode(response.body)) {
          contactsModel = ContactsModel.fromJson(element);
          listContacts.add(contactsModel);
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
