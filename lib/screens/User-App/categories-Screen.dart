import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_app/screens/User-App/product-Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';

import '../../models/categories-model.dart';
import '../../utils/app-colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "All Categories",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('categories').get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> Snapshot) {
            if (Snapshot.hasError) {
              Get.snackbar("Error", "",
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
              return GridView.builder(
                itemCount: Snapshot.data!.docs.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 1.19),
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
                            Get.to(()=>ProductScreen(CategoryId :
                            categoriesModel.categoryId));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: FillImageCard(
                                width: Get.width / 2.3,
                                heightImage: Get.height / 8,
                                borderRadius: 20,
                                color: AppColors.primary,
                                imageProvider: CachedNetworkImageProvider(
                                    categoriesModel.categoryImg),
                                title: Text(
                                  categoriesModel.categoryName,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
