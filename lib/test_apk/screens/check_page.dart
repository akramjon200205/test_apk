import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/check_page_provider.dart';
import 'package:test_app/utills/contants.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Colors.white70;
    }

    return Consumer<CheckPageProvider>(builder: (
      context,
      provider,
      child,
    ) {
      if (provider.state == ComState.isInit) {
        Future.delayed(Duration.zero, () {
          provider.loadCheck();
          provider.updatePage();
        });
      }
      return provider.state == ComState.isSuccess
          ? ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Checkbox(
                      checkColor: Colors.black,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: provider.isChecked,
                      onChanged: (bool? value) {
                        provider.isChecked = value!;
                        provider.updatePage();
                      }),
                  title: Text(
                    "${provider.listCheck[index].title}",
                    style: kTextStyle(
                      size: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              })
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
    });
  }
}
