import 'package:alpha/const/colors.dart';
import 'package:alpha/const/navigator.dart';
import 'package:alpha/model/static_homescreen.dart';
import 'package:alpha/screens/product/product_details.dart';
import 'package:alpha/screens/product/widget/product_card_view.dart';
import 'package:alpha/widget/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _selectCty = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            left: 7,
            right: 7,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 12.h),
                _buildCategoriesRow('Select Category', 'view all'),
                SizedBox(height: 12.h),
                SizedBox(height: 100.h, child: _buildCategoryList()),
                SizedBox(height: 5.h),
                _buildSearchField(),
                SizedBox(height: 14.h),
                _buildCategoriesRow('Hot sales', 'see more '),
                SizedBox(height: 12.h),
                _buildBannerContainer(),
                SizedBox(height: 12.h),
                _buildCategoriesRow('Best Seller', 'see more '),
                SizedBox(height: 12.h),
                _buildProductList(true),
                SizedBox(height: 12.h),
                SizedBox(height: 12.h),
                _buildCategoriesRow('Latest Products', 'see more '),
                SizedBox(height: 12.h),
                _buildProductList(false),
                SizedBox(height: 12.h),
                _buildCategoriesRow('New Arival', 'see more '),
                SizedBox(height: 12.h),
                _buildProductList(false),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildCategoriesRow(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  _buildBannerContainer() {
    return Container(
      width: double.infinity,
      height: 135.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/banner.jpeg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _buildProductList(bool isLatest) {
    return SizedBox(
      height: isLatest ? 170.h : 120.h,
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCardView(isLatest: isLatest, index: index);
          }),
    );
  }

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
          setState(() {
            isLiked[index] = !isLiked[index];
          });
        });
  }

  _buildCategoryList() {
    return ListView.builder(
        itemCount: categoryNames.length,
        // shrinkWrap: true,

        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  _selectCty = index;
                });
              },
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: _selectCty == index ? Colors.black : Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 2,
                          //    offset: Offset(0, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      categoryIcons[index],
                      size: 25.r,
                      color: _selectCty == index ? Colors.white : iconColors,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    categoryNames[index],
                    style: TextStyle(
                        fontWeight: _selectCty == index
                            ? FontWeight.bold
                            : FontWeight.w400,
                        fontSize: 12),
                  ),
                ],
              ),
            ));
  }

  _buildSearchField() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 14, color: textColor),
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
}
