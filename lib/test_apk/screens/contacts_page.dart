import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/contacts_provider.dart';

import 'package:test_app/utills/contants.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsProvider>(
      builder: (context, provider, child) {
        if (provider.state == ComState.isInit) {
          Future.delayed(Duration.zero, () {
            provider.loadContacts();
            provider.updatePage();
          });
        }
        return ListView.builder(
            itemCount: provider.listContacts.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.white70,
                      size: 20,
                    ),
                    title: Text(
                      "${provider.listContacts[index].name}",
                      style: kTextStyle(
                        size: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
