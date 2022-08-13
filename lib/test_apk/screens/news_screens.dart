import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/news_provider.dart';
import 'package:test_app/test_apk/on_tap_news_page.dart/on_tap_news_container.dart';
import 'package:test_app/utills/contants.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<NewProviders>(
      builder: (context, provider, child) {
        if (provider.state == ComState.isInit) {
          Future.delayed(Duration.zero, () {
            provider.loadNews();
            provider.updatePage();
          });
        }
        return provider.state == ComState.isSuccess
            ? ListView.builder(
                itemCount: provider.listNewsPage.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnTapNewsPageContainer(
                                    '${provider.listNewsPage[index].title}',
                                    '${provider.listNewsPage[index].body}',
                                    index)),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: size.width * 0.95,
                          decoration: BoxDecoration(
                            color: Colors.indigo[800],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${provider.listNewsPage[index].title}',
                                style: kTextStyle(
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                '${provider.listNewsPage[index].body}',
                                style: kTextStyle(
                                  size: 18,
                                  color: Colors.white70,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
            : const SizedBox.shrink();
      },
    );
  }
}
