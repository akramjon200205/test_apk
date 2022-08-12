import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/gallery_provider.dart';
import 'package:test_app/utills/contants.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Consumer<GalleryProvider>(
      builder: (context, provider, child) {
        if (provider.state == ComState.isInit) {
          Future.delayed(Duration.zero, () {
            provider.loadGallery();
            provider.updatePage();
          });
        }
        return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: provider.listGallery.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                  padding: const EdgeInsets.all(10),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        provider.listGallery[index].title!,
                        style: kTextStyle(
                          size: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ));
            });
      },
    );
  }
}
