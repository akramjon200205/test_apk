import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/news_provider.dart';
import 'package:test_app/providers/on_tap_provider.dart';
import 'package:test_app/utills/contants.dart';

class ShowResultPage extends StatefulWidget {
  ShowResultPage(this.text, this.id, {Key? key}) : super(key: key);
  String text;
  int id;
  @override
  State<ShowResultPage> createState() => _ShowResultPageState();
}

class _ShowResultPageState extends State<ShowResultPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<OnTapContainerProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: appBarColor,
            centerTitle: true,
            title: Text(
              widget.text,
              style: kTextStyle(
                size: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                _itemContainer(size, 0),
                const SizedBox(
                  height: 20,
                ),
                _itemContainer(size, 1),
                const SizedBox(
                  height: 20,
                ),
                _itemContainer(size, 2),
                const SizedBox(
                  height: 20,
                ),
                _itemContainer(size, 3),
                const SizedBox(
                  height: 20,
                ),
                _itemContainer(size, 4),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _itemContainer(Size size, int index) {
    List numbers = [];
    for (int i = widget.id * 5; i <= widget.id * 5 + 5; i++) {
      numbers.add(i);
    }
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.95,
      decoration: BoxDecoration(
        color: Colors.indigo[800],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 20,
              child: Icon(
                Icons.person,
                size: 20,
              ),
            ),
            title: Text(
              "${context.watch<OnTapContainerProvider>().listOnTapContainerModel[numbers[index]].name}",
              style: kTextStyle(
                size: 18,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Text(
            "${context.watch<OnTapContainerProvider>().listOnTapContainerModel[numbers[index]].body}",
            style: kTextStyle(
              size: 12,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
