import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/contacts_provider.dart';
import 'package:test_app/utills/contants.dart';

class OnTapContactsPage extends StatefulWidget {
  OnTapContactsPage(this.index, {Key? key}) : super(key: key);

  int index;
  @override
  State<OnTapContactsPage> createState() => _OnTapContactsPageState();
}

class _OnTapContactsPageState extends State<OnTapContactsPage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    controller.text = "Contacts";
    super.initState();
  }

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
                _itemTextField("E-mail"),
                const SizedBox(
                  height: 20,
                ),
                _itemTextField('Phone number'),
                const SizedBox(
                  height: 20,
                ),
                _itemTextField("Website"),
                const SizedBox(
                  height: 20,
                ),
                _itemTextField("Company"),
                const SizedBox(
                  height: 20,
                ),
                _itemTextField("Adress"),
              ],
            ),
          ),
        );
      },
    );
  }

  TextField _itemTextField(String text) {
    return TextField(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        // border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: text,
        labelStyle: kTextStyle(
          size: 14,
          color: Colors.white70,
        ),
      ),
    );
  }
}
