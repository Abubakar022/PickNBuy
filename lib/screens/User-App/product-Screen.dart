import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_app/screens/User-App/product-Detail-Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';

import '../../models/categories-model.dart';
import '../../models/product-model.dart';
import '../../utils/app-colors.dart';

class ProductScreen extends StatefulWidget {
  String CategoryId;
 ProductScreen({super.key, required this.CategoryId});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Products",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('products').where
            ('categoryId' , isEqualTo: widget.CategoryId ).get(),
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
                child: Text("No Products Found!"),
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
                    final flashSale = Snapshot.data!.docs[index];
                    ProductModel productModel = ProductModel(
                        productId: flashSale['productId'],
                        categoryId: flashSale['categoryId'],
                        productName: flashSale['productName'],
                        categoryName: flashSale['categoryName'],
                        salePrice: flashSale['salePrice'],
                        fullPrice: flashSale['fullPrice'],
                        productImages: flashSale['productImages'],
                        deliveryTime: flashSale['deliveryTime'],
                        isSale: flashSale['isSale'],
                        productDescription: flashSale['productDescription'],
                        createdAt: flashSale['createdAt'],
                        updatedAt: flashSale['updatedAt']);

                    return Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(()=>ProductDescription(productModel:productModel));
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
                                    productModel.productImages[0]),
                                title: Text(
                                  productModel.productName,
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
