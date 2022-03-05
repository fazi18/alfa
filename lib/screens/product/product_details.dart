import 'package:alpha/const/colors.dart';
import 'package:alpha/model/static_homescreen.dart';
import 'package:alpha/screens/product/product_details_body.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                height: 30.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Icon(Icons.chevron_left_outlined,
                                    size: 35, color: Colors.white)),
                          ),
                          const Text(
                            'Product Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                                size: 25,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 265.h,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 7,
                                      spreadRadius: 2)
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Hero(
                                tag: featuredProducts[index],
                                child: Image.asset(
                                  featuredProducts[index],
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: featuredProducts.length,
                        viewportFraction: 0.7,
                        scale: 0.8,
                      ),
                    ),
                  ],
                )),
            Expanded(flex: 4, child: Product_card_body())
          ],
        ),
      ),
    );
  }
}
