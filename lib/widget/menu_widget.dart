import 'package:alpha/const/colors.dart';
import 'package:alpha/const/navigator.dart';
import 'package:alpha/screens/list_menu_screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final drowerController;
  MenuWidget({this.drowerController});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: ThemeData.dark(),
        child: Container(
          padding: EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              InkWell(
                  onTap: () => navigateTO(context, ProfileScreen()),
                  child:
                      _buildBodyMenu(Icons.person_outline_outlined, 'Profile')),
              Divider(
                color: textColor,
                indent: 40.w,
                endIndent: MediaQuery.of(context).size.width * 0.54,
              ),
              _buildBodyMenu(Icons.shopping_cart_outlined, 'My orders'),
              Divider(
                color: textColor,
                indent: 40.w,
                endIndent: MediaQuery.of(context).size.width * 0.54,
              ),
              _buildBodyMenu(Icons.favorite_border, 'Favorites'),
              Divider(
                color: textColor,
                indent: 40.w,
                endIndent: MediaQuery.of(context).size.width * 0.54,
              ),
              _buildBodyMenu(Icons.delivery_dining_outlined, 'Delivery'),
              Divider(
                color: textColor,
                indent: 40.w,
                endIndent: MediaQuery.of(context).size.width * 0.54,
              ),
              _buildBodyMenu(Icons.settings_outlined, 'Settings'),
              Spacer(),
              _buildBodyMenu(Icons.logout_outlined, 'Sign out'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBodyMenu(
    IconData icon,
    String title,
  ) {
    return ListTile(
      minLeadingWidth: 20,
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
      ),
    );
  }
}
