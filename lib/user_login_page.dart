import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funz_eventz/extras/colors.dart';
import 'package:funz_eventz/login_controller.dart';
import 'package:funz_eventz/main.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(LoginController());
  late double screenWidth;
  late double screenHeight;
  int st = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: SafeArea(
          child: Obx((){
              if ( controller.googleAccount.value!=null ){
                return  const MyHomePage(title: 'Login SSuccessful',);
              }
              else{
                return buildColumn();
              }
      },
          ),
    ),);
  }

  Column buildColumn() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Feventlogo.png',
                width: screenWidth * 0.75, height: screenHeight * 0.2),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: CColors.primary,
            border: Border.all(
              color: CColors.primary,
              width: 2.5,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    st = 0;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.06,
                  child: Text('User',
                      style: TextStyle(
                          fontFamily: 'Jua',
                          fontSize: 16,
                          color: st == 1 ? Colors.white : CColors.userButton)),
                  decoration: BoxDecoration(
                    color: st == 0 ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    st = 1;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.06,
                  child: Text('Vendor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Jua',
                          fontSize: 16,
                          color: st == 1 ? CColors.userButton : Colors.white)),
                  decoration: BoxDecoration(
                    color: st == 1 ? Colors.white : CColors.primary,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: screenHeight * 0.05,
        ),
        Container(
          height: screenHeight * 0.07,
          width: 300,
          padding: EdgeInsets.only(left: 23, bottom: 7),
          decoration: BoxDecoration(
            border: Border.all(
              color: st == 1 ? CColors.userButton : CColors.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,

              hintStyle: TextStyle(
                  fontSize: 12,
                  color: CColors.primary,
                  fontFamily: 'QuickSand_Bold'),
              hintText: 'Email Address',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          height: screenHeight * 0.07,
          width: 300,
          padding: EdgeInsets.only(left: 23, bottom: 7),
          decoration: BoxDecoration(
            border: Border.all(
              color: st == 1 ? CColors.userButton : CColors.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
              hintStyle: TextStyle(
                  fontFamily: 'QuickSand_Bold',
                  fontSize: 12,
                  color: CColors.primary),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: 0.1 * screenWidth, left: 0.12 * screenWidth, top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Remember me',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Quicksand_Bold',
                  color: CColors.loginRN,
                ),
              ),
              Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Quicksand_Bold',
                  color: CColors.loginRN,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
          child: Text(
            'Login',
            style: TextStyle(fontSize: 18, fontFamily: 'Jua'),
          ),
          style: ElevatedButton.styleFrom(
            primary: st == 1 ? CColors.userButton : CColors.primary,
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.25, vertical: 15),
            shape: StadiumBorder(),
          ),
          onPressed: () {},
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Or sign in with',
          style: TextStyle(
            fontFamily: 'Quicksand_Bold',
            fontSize: 14,
            color: CColors.orSignWith,
          ),
        ),
        SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 3),
              width: screenWidth * 0.37,
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: CColors.userButton),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/facebook.png',
                    width: screenWidth * 0.06,
                    height: 20,
                  ),
                  Text(
                    'Facebook',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontFamily: 'Quicksand_Bold'),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 3),
              width: screenWidth * 0.37,
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: CColors.userButton),
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () async {
                await  controller.login();
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: screenWidth * 0.1,
                      height: 20,
                    ),
                    Text(
                      ' Google',
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Quicksand_Bold',
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Don\'t have an account?',
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Quicksand_Bold',
                color: CColors.dHaveAnAccount,
              ),
            ),
            Text(
              'Register Now',
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Quicksand_Bold',
                color: CColors.loginRN,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.2),
          child: Row(
            children: [
              Text(
                'Terms and conditon   ',
                style: TextStyle(
                  fontFamily: 'Quicksand_Bold',
                  fontSize: 12,
                  color: CColors.privacyPolicy,
                ),
              ),
              Image.network(
                "https://cdn-icons-png.flaticon.com/512/319/319873.png",
                width: 4,
                height: 4,
                color: CColors.privacyPolicy,
              ),
              Text(
                '  Privacy Policy',
                style: TextStyle(
                  fontFamily: 'Quicksand_Bold',
                  fontSize: 12,
                  color: CColors.privacyPolicy,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
