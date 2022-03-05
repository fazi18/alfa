import 'package:alpha/const/colors.dart';
import 'package:alpha/const/navigator.dart';
import 'package:alpha/model/static_homescreen.dart';
import 'package:alpha/screens/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCardView extends StatelessWidget {
  final bool isLatest;
  final int index;
  const ProductCardView({
    required this.isLatest,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTO(context, ProductDetails());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: featuredProducts[isLatest ? index : index + 2],
                  child: Image.asset(
                    featuredProducts[index],
                    fit: BoxFit.fill,
                    height: isLatest ? 120.h : 75.h,
                    width: isLatest
                        ? MediaQuery.of(context).size.width / 2.2
                        : MediaQuery.of(context).size.width / 3.5,
                  ),
                ),
              ),
              if (isLatest)
                Positioned(
                    top: 10.h,
                    left: isLatest ? 135 : 100,
                    child: _buildLikeContainer(index)),
              _buildProductPrice(isLatest),
              _buildProductTitle(isLatest),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _buildProductTitle(bool isLatest) {
    return Positioned(
      top: isLatest ? 140.h : 95.h,
      left: 10,
      right: 0,
      child: _buildNormalText(title: 'test', fontSize: 8),
    );
  }

  Positioned _buildProductPrice(bool isLatest) {
    return Positioned(
      top: isLatest ? 125.h : 80.h,
      left: 10,
      right: 0,
      child: Row(
        children: [
          _buildNormalText(title: '50 OMR', isBold: true, fontSize: 10),
          SizedBox(
            width: 20.w,
          ),
          if (isLatest)
            const Text(
              '60 OMR',
              style: TextStyle(
                fontSize: 10,
                decoration: TextDecoration.lineThrough,
                color: textColor,
              ),
            ),
        ],
      ),
    );
  }

  _buildNormalText(
          {String title = '', int fontSize = 12, bool isBold = false}) =>
      Text(
        title,
        maxLines: 2,
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
            child: Icon(
              isLiked[index] ? Icons.favorite : Icons.favorite_outline,
              size: 18,
            )),
        onTap: () {
          // setState(() {
          isLiked[index] = !isLiked[index];
          // });
        });
  }
}
