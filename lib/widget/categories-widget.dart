import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_app/models/categories-model.dart';
import 'package:e_app/screens/User-App/product-Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../utils/app-colors.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('categories').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> Snapshot) {
          if (Snapshot.hasError) {
            Get.snackbar(
                "Error", "",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: AppColors.primary,
                colorText: Color(0xFFf3f6f8));
          }
          if (Snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: Get.height / 5,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          if (Snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No Category Found!"),
            );
          }
          if (Snapshot.data != null) {
            return Container(
              width: Get.width,
              height: Get.height/5,
              child: ListView.builder(
                  itemCount: Snapshot.data!.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    CategoriesModel categoriesModel = CategoriesModel(
                        categoryId: Snapshot.data!.docs[index]['categoriesId'],
                        categoryImg: Snapshot.data!.docs[index]['CategorieImg'],
                        categoryName: Snapshot.data!.docs[index]
                            ['CategorieType'],
                        createdAt: Snapshot.data!.docs[index]['CategorieAt'],
                        updatedAt: Snapshot.data!.docs[index]['UpdatedAt']);
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                              Get.to(()=>ProductScreen(CategoryId:
                              categoriesModel.categoryId));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: FillImageCard(
                                width: Get.width/4,
                                heightImage: Get.height/10,
                                borderRadius: 20,
                                color: AppColors.primary,

                                imageProvider: CachedNetworkImageProvider(
                                    categoriesModel.categoryImg),
                                title: Text(categoriesModel.categoryName,style:
                                TextStyle(fontSize: 15),),

                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            );
          }
          return Container();
        });
  }
}
