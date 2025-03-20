import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_app/models/categories-model.dart';
import 'package:e_app/models/product-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../screens/User-App/product-Detail-Screen.dart';
import '../utils/app-colors.dart';

class allProductWidget extends StatelessWidget {
  const allProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('products').where('isSale',isEqualTo: false).get(),
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
            return GridView.builder(
                itemCount: Snapshot.data!.docs.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.80),
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
                              heightImage: Get.height / 6,
                              borderRadius: 20,
                              color: AppColors.primary,
                              imageProvider: CachedNetworkImageProvider(
                                  productModel.productImages[0]),
                              title: Center(
                                child: Text(
                                  productModel.productName,
                                maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              footer: Center(child: Text("PKR:"+ productModel.fullPrice)),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                });
          }
          return Container();
        });
  }
}
