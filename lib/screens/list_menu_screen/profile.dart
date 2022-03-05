import 'package:alpha/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 12.h,
              ),
              const Text(
                'My profile',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.h,
              ),
              _card(context),
              SizedBox(
                height: 40.h,
              ),
              _buildRows("Edit Profile"),
              SizedBox(
                height: 20.h,
              ),
              _buildRows("Shopping address"),
              SizedBox(
                height: 20.h,
              ),
              _buildRows("Order history"),
              SizedBox(
                height: 20.h,
              ),
              _buildRows("Cards"),
              SizedBox(
                height: 20.h,
              ),
              _buildRows("Notifications"),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildRows(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: textColor.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1)
          ]),
      child: ListTile(
        leading: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(
          Icons.chevron_right_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }

  Widget _card(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 35),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: textColor.withOpacity(0.1),
                      blurRadius: 7,
                      spreadRadius: 1)
                ]),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dr. Ali',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text('Address: Oman, Muscat,\nSeeb.Al Mabela. St No 312')
              ],
            )),
        const Center(
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
