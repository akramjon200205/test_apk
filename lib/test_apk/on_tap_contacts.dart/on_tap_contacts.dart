import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/contacts_provider.dart';
import 'package:test_app/test_apk/on_tap_contacts.dart/text_field_func.dart';
import 'package:test_app/utills/contants.dart';

class OnTapContactsPage extends StatefulWidget {
  OnTapContactsPage(this.index, {Key? key}) : super(key: key);

  int index;
  @override
  State<OnTapContactsPage> createState() => _OnTapContactsPageState();
}

class _OnTapContactsPageState extends State<OnTapContactsPage> {
  var provider = ContactsProvider();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: appBarColor,
            centerTitle: true,
            title: Text(
              '${provider.listContacts[widget.index].name}',
              style: kTextStyle(
                size: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.black38,
                  radius: 25,
                  child: Icon(
                    Icons.person,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${provider.listContacts[widget.index].name}',
                  style: kTextStyle(
                    size: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${provider.listContacts[widget.index].email}',
                  style: kTextStyle(
                    size: 14,
                    color: Colors.indigo,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldFunc(
                    "E-mail", "${provider.listContacts[widget.index].email}"),
                const SizedBox(
                  height: 20,
                ),
                TextFieldFunc('Phone number',
                    "${provider.listContacts[widget.index].phone}"),
                const SizedBox(
                  height: 20,
                ),
                TextFieldFunc('Website',
                    "${provider.listContacts[widget.index].website}"),
                const SizedBox(
                  height: 20,
                ),
                TextFieldFunc('Company',
                    "${provider.listContacts[widget.index].company!.name}"),
                const SizedBox(
                  height: 20,
                ),
                TextFieldFunc('Adress',
                    "${provider.listContacts[widget.index].address!.street}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
