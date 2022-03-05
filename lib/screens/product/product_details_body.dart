// ignore_for_file: camel_case_types

import 'package:alpha/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Product_card_body extends StatefulWidget {
  Product_card_body({
    Key? key,
  }) : super(key: key);

  @override
  State<Product_card_body> createState() => _Product_card_bodyState();
}

class _Product_card_bodyState extends State<Product_card_body> {
  List<Tab> myTabs = const [
    Tab(
      text: 'Shop',
    ),
    Tab(text: 'Details'),
    Tab(text: 'Features'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 1)
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Galaxy Note 20 Ultra',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                Container(
                    height: 25.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 20,
                    )),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: const [
                Icon(
                  Icons.star,
                  color: Color(0xFFFEB700),
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFFEB700),
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFFEB700),
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFFEB700),
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFFEB700),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            TabBar(
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              unselectedLabelColor: iconColors,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: myTabs,
            ),
            SizedBox(
              height: 10.h,
            ),
            Flexible(
              child: TabBarView(
                children: [
                  _buildShop(),
                  const Icon(Icons.directions_transit),
                  const Icon(Icons.directions_bike),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildShop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            build_Icon_title(Icons.memory_outlined, 'Exynos 990'),
            build_Icon_title(Icons.local_see_outlined, '108 + 12 mp'),
            build_Icon_title(Icons.crop_5_4_outlined, '8 GB'),
            build_Icon_title(Icons.sd_storage_outlined, '256 GB'),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        const Text(
          'Select color and capacity',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.blueGrey),
              child: const Icon(
                Icons.done_outlined,
                color: Colors.white,
              ),
            ),
            Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.red[800]),
            ),
            Container(
              height: 25.h,
              width: 45.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.black),
              alignment: Alignment.center,
              child: Text(
                '128 GB',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            Text(
              '256 GB',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            primary: Colors.black,
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  "Add to Card",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "350 OMR",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget build_Icon_title(IconData icon, String title) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: iconColors,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          title,
          style: const TextStyle(color: iconColors, fontSize: 10),
        )
      ],
    );
  }
}
