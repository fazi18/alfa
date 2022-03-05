import 'package:alpha/const/colors.dart';
import 'package:alpha/const/navigator.dart';
import 'package:alpha/model/static_homescreen.dart';
import 'package:alpha/screens/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavScreen extends StatefulWidget {
  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  final int _selectCty = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              crossAxisCount: 2,
              mainAxisExtent: MediaQuery.of(context).size.width / 1.64,
              childAspectRatio: 400.h / 500.w),
          itemCount: featuredProducts.length - 2,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                navigateTO(context, const ProductDetails());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: textColor.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5)
                    ]),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        featuredProducts[index],
                        //  fit: BoxFit.cover,
                        height: 140.h,
                        width: MediaQuery.of(context).size.width / 1.4,
                      ),
                    ),
                    Positioned(
                        top: 10.h,
                        left: 145,
                        child: _buildLikeContainer(index)),
                    Positioned(
                      top: 150.h,
                      left: 10,
                      right: 0,
                      child: Row(
                        children: [
                          _buildNormalText(
                              title: '250 OMR', isBold: true, fontSize: 10),
                          SizedBox(
                            width: 20.w,
                          ),
                          const Text(
                            '345OMR',
                            style: TextStyle(
                              fontSize: 10,
                              decoration: TextDecoration.lineThrough,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 165.h,
                      left: 10,
                      right: 0,
                      child: _buildNormalText(
                          title: 'Sumsung ultra 22', fontSize: 8),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  _buildNormalText(
          {String title = '', int fontSize = 12, bool isBold = false}) =>
      Text(
        title,
        maxLines: 1,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize.sp,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      );

  _buildLikeContainer(int index) {
    return InkWell(
        child: Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: textColor.withOpacity(0.3),
                      blurRadius: 1,
                      spreadRadius: 1)
                ]),
            alignment: Alignment.center,
            child: const Icon(
              Icons.favorite,
              size: 18,
            )),
        onTap: () {
          setState(() {
            isLiked[index] = !isLiked[index];
          });
        });
  }

  _buildSearchField() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: const TextStyle(fontSize: 14, color: textColor),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: textColor,
                size: 25,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.qr_code, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
