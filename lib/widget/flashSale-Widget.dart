import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_app/models/categories-model.dart';
import 'package:e_app/models/product-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../screens/User-App/product-Detail-Screen.dart';
import '../utils/app-colors.dart';

class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('products').where('isSale',isEqualTo: true).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> Snapshot) {
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
              child: Text("No Product Found!"),
            );
          }
          if (Snapshot.data != null) {
            return Container(
              width: Get.width,
              height: Get.height / 5,
              child: ListView.builder(
                  itemCount: Snapshot.data!.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
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
                                width: Get.width / 4,
                                heightImage: Get.height / 10,
                                borderRadius: 20,
                                color: AppColors.primary,
                                imageProvider: CachedNetworkImageProvider(
                                    productModel.productImages[0]),
                                title: Text(
                                  productModel.productName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15),
                                ),
                                footer: Row(
                                  children: [
                                    Text(
                                      "Rs ${productModel.salePrice}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                         ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "${productModel.fullPrice}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.black,
                                          decoration: TextDecoration.lineThrough),
                                    ),
                                  ],
                                ),
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
