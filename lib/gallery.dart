import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_gallery/commons/shadows.dart';
import 'package:image_gallery/models/gallery_model.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery/utils/constants/sizes.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  Future<GalleryModel> getImage() async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=46318985-0696f8485dfc226a1757048c4&q=yellow+flowers&image_type=photo&pretty=true'));
    var data = jsonDecode(response.body.toString());
    return GalleryModel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double itemWidth = 150;
    int crossAxisCount = (screenWidth / itemWidth).floor();
    return Scaffold(
      backgroundColor: Colors.white,

      /// App Bar
      appBar: AppBar(
        title: const Text("Gallery", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(ASizes.md),
              child: FutureBuilder(
                future: getImage(),

                builder: (BuildContext context, AsyncSnapshot<GalleryModel> snapshot) {
                  if(!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10
                        ),
                        itemCount: snapshot.data!.hits!.length,
                        itemBuilder: (_, index) {
                          return Container(
                            width: 180,
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                boxShadow: [AShadowStyle.verticalProductShadow],
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(ASizes.productImageRadius),
                              ),
                              child: Column(
                                children: [
                                  Flexible(

                                    /// Image from api
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(ASizes.md)
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(ASizes.md),
                                          child: Image(image: NetworkImage(snapshot.data!.hits![index].userImageURL.toString()),fit: BoxFit.contain)
                                      ),
                                    ),
                                  ),

                                  /// Likes and Views
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: ASizes.md),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.favorite_border),
                                            Text(snapshot.data!.hits![index].likes.toString())
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: ASizes.md),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.remove_red_eye),
                                            Text(snapshot.data!.hits![index].views.toString(),overflow: TextOverflow.ellipsis,)
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                          );
                        }
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
