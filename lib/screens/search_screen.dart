import 'package:alpha/const/colors.dart';
import 'package:alpha/model/static_homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  List<Tab> myTabs = const [
    Tab(
      text: 'Wearable',
    ),
    Tab(text: 'Laptops'),
    Tab(text: 'Phones'),
    Tab(text: 'Drones'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: _buildSearchField()),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Order online\ncollect in store',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TabBar(
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 15),
                  unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  unselectedLabelColor: iconColors,
                  indicatorColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: myTabs,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    child: ProdectCard()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'See more',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.east_outlined,
                        size: 18,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  _buildSearchField() {
    return TextFormField(
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
    );
  }
}

class ProdectCard extends StatelessWidget {
  const ProdectCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: searchNames.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            height: 200,
            child: InkWell(
              onTap: () {},
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 230,
                    margin: const EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 2,
                            color: Colors.black38.withOpacity(0.1))
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    child: Container(
                      height: 170,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        serchImages[i],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: SizedBox(
                      height: 130,
                      width: size.width - 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Center(
                              child: Text(
                                searchNames[i],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Center(
                              child: Text(
                                'Series 6 .Red',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: iconColors),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(
                              child: Text(
                                '500 OMR',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
