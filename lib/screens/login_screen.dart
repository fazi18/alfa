import 'package:alpha/const/navigator.dart';
import 'package:alpha/screens/drower.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObsure = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _emailController.text = "a@gmil.com";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(flex: 3, child: Container(child: _buildWelcomText())),
            Expanded(flex: 6, child: _buildLoginView(context)),
          ],
        ),
      ),
    );
  }

  _buildWelcomText() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Center(
          child: Text(
            'Welcome back',
            style: TextStyle(
                color: Colors.white, fontSize: 44.sp, fontFamily: 'Gotham'),
          ),
        ),
      );

  _buildLoginView(BuildContext context) => Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      child: _buildLoginForm(context));

  _buildLoginForm(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              SizedBox(height: 24.h),
              _buildTextFormField(
                  'Email', Icons.email_outlined, false, _emailController),
              SizedBox(height: 24.h),
              _buildTextFormField(
                  'Password', Icons.lock_outline, true, _passwordController),
              SizedBox(height: 12.h),
              _buildText('Forgot Password?'),
              SizedBox(height: 32.h),
              _buildLoginButton(context),
              SizedBox(height: 12.h),
              Center(child: _buildText('Create account')),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      );

  _buildTextFormField(String title, IconData icon, bool isPssword,
      TextEditingController controller) {
    return Column(children: [
      Row(
        children: [
          Icon(icon, color: Colors.black54),
          SizedBox(width: 4.w),
          Text(title, style: const TextStyle(color: Colors.black54)),
        ],
      ),
      TextFormField(
          controller: controller,
          obscureText: isPssword ? _isObsure : false,
          keyboardType: isPssword
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
          decoration: InputDecoration(
            suffix: isPssword
                ? InkWell(
                    child: Text(_isObsure ? 'Show' : 'Hide',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 11.sp)),
                    onTap: () {
                      setState(() {
                        _isObsure = !_isObsure;
                      });
                    })
                : null,
            border: const UnderlineInputBorder(),
          ),
          validator: (value) {
            if (title == 'Email') {
              String pattern =
                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                  r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                  r"{0,253}[a-zA-Z0-9])?)*$";
              RegExp regex = RegExp(pattern);
              if (value == null || !regex.hasMatch(value)) {
                return 'Enter a valid email address';
              } else {
                return null;
              }
            } else {
              return null;
            }
          }),
    ]);
  }

  _buildLoginButton(BuildContext context) {
    return Center(
      child: MaterialButton(
        color: Colors.black,
        minWidth: MediaQuery.of(context).size.width / 1.5,
        height: 35.h,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.r)),
        onPressed: () {
          if (!_formKey.currentState!.validate()) return;
          navigateTO(context, FlutterZoomDrawerDemo());
        },
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  _buildText(String title) => Text(
        title,
        style: TextStyle(fontSize: 12.r, color: Colors.black),
      );
}
