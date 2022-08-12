import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/gallery_provider.dart';
import 'package:test_app/utills/contants.dart';

class OnTapGalleryPage extends StatefulWidget {
  OnTapGalleryPage(this.index, {Key? key}) : super(key: key);
  int index;
  @override
  State<OnTapGalleryPage> createState() => _OnTapGalleryPageState();
}

class _OnTapGalleryPageState extends State<OnTapGalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: appBarColor,
            centerTitle: true,
            title: Text(
              provider.listGallery[widget.index].title!,
              style: kTextStyle(
                size: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: 50,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                height: 120,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
