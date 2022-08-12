import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/on_tap_provider.dart';
import 'package:test_app/test_apk/on_tap_news_page.dart/show_result_page.dart';
import 'package:test_app/utills/contants.dart';

class OnTapNewsPageContainer extends StatefulWidget {
  OnTapNewsPageContainer(this.string, this.bodys, this.id, {Key? key})
      : super(key: key);

  String string;
  String bodys;
  int id;
  @override
  State<OnTapNewsPageContainer> createState() => _OnTapNewsPageContainerState();
}

class _OnTapNewsPageContainerState extends State<OnTapNewsPageContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<OnTapContainerProvider>(
      builder: (context, provider, child) {
        if (provider.state == ComState.isInit) {
          Future.delayed(Duration.zero, () {
            provider.loadOnTapContainer();
            provider.updatePage();
          });
        }
        return provider.state == ComState.isSuccess
            ? Scaffold(
                backgroundColor: backgroundColor,
                appBar: AppBar(
                  backgroundColor: Colors.indigo[900],
                  centerTitle: true,
                  title: Text(
                    widget.string,
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
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.string,
                        style: kTextStyle(
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.bodys,
                        style: kTextStyle(
                          size: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            _itemConainer(size, 0),
                            const SizedBox(
                              height: 20,
                            ),
                            _itemConainer(size, 1),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ShowResultPage(widget.string, widget.id),
                              ),
                            );
                          },
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: size.height * 0.08,
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 25,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Show me 5 resulst',
                                    style: kTextStyle(
                                      size: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.remove_red_eye,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Text(
                "scsacs",
                style: kTextStyle(
                  size: 20,
                  color: Colors.white,
                ),
              );
      },
    );
  }

  Widget _itemConainer(Size size, int number) {
    List numbers = [];
    for (int i = widget.id * 5; i <= widget.id * 5 + 1; i++) {
      numbers.add(i);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
              "${context.read<OnTapContainerProvider>().listOnTapContainerModel[numbers[number]].name}",
              style: kTextStyle(
                size: 20,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Text(
            "${context.read<OnTapContainerProvider>().listOnTapContainerModel[numbers[number]].body}",
            style: kTextStyle(
              size: 14,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
