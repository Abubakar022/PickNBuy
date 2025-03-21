import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_app/models/product-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app-colors.dart';

class ProductDescription extends StatefulWidget {
  ProductModel productModel;

  ProductDescription({super.key, required this.productModel});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Product Description",
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 50,
            ),
            CarouselSlider(
                items: widget.productModel.productImages
                    .map((imageUrls) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: imageUrls,
                            fit: BoxFit.cover,
                            width: Get.width - 10,
                            placeholder: (context, url) => ColoredBox(
                              color: Colors.white,
                              child: Center(
                                child: CupertinoActivityIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  aspectRatio: 2.5,
                  viewportFraction: 1,
                )),
            Padding(
              padding: EdgeInsets.all(8),
              child: Card(

                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.productModel.productName, style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),),
                            Icon(Icons.favorite_border_outlined)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            widget.productModel.isSale == true && widget
                                .productModel.salePrice != ''?
                            Text("PKR:" + widget.productModel.salePrice, style:
                            GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                            ): Text("PKR:" + widget.productModel.fullPrice, style:
                            GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                            "Category:" + widget.productModel.categoryName, style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(widget.productModel.productDescription, style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary,
                        ),),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: Get.width / 2.5,
                          margin: EdgeInsets.only(right: 2, left: 20),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextButton(
                            child: Text(
                              "Add to Cart",
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: Get.width/30,
                        ),
                        Container(
                          width: Get.width /3,
                          margin: EdgeInsets.only(right: 20, left: 0),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextButton(
                            child: Text(
                              "WhatsApp",
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height/80,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
