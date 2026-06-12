import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:i_bank/constants/color_constants.dart';
import 'package:i_bank/nav_bar/nav_bar.dart';
import 'package:i_bank/screens/authentication/forgot_password.dart';
import 'package:i_bank/screens/authentication/sign_up.dart';
import 'package:i_bank/screens/home_screen/home_screen_page.dart';
import 'package:i_bank/services/firebase_auth_service.dart';
import 'package:i_bank/widgets/custom_app_bar.dart';
import 'package:i_bank/widgets/customButton.dart';
import 'package:i_bank/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/firebase_auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
   final FirebaseAuthService authService = FirebaseAuthService();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.primary1,
        appBar: CustomAppBar(
          appBarText: 'Sign in',
          backgroundColor: ColorConstants.primary1,
          iconColor: Colors.white,
          textColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: ColorConstants.primary1),),
                Text('Hello there, sign in to continue', style: TextStyle(fontSize: 17,),),
                SizedBox(height: 30,),

                CustomTextField(hintText: 'Email', controller: emailController,),
                SizedBox(height: 20,),
                CustomTextField(hintText: 'Password', suffixIcon: Icons.remove_red_eye,controller: passwordController,),
                SizedBox(height: 20,),
                Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                      },
                        child: Text('Forgot your password?', style: TextStyle(color: ColorConstants.grey),))),
                Spacer(),

                CustomButton(text: 'Sign in',
                  onTap: () async {
                    print(emailController.text);
                    print(passwordController.text);
                    await authService.signIn(
                      emailController.text,
                      passwordController.text,
                    );
                    String? token = await FirebaseAuth.instance.currentUser!.getIdToken();

                    await authService.sendTokenToBackend(token!);
                    print('firebase token: $token');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar(initialIndex: 0,)));
                  },
                ),
                SizedBox(height: 10,),
                Center(
                  child: IconButton(
                    onPressed: (){},

                    icon: Image.asset('assets/Fingerprint.png'),
                  ),
                ),
                SizedBox(height: 10,),
               Center(
                 child: RichText(
                     text: TextSpan(
                       text: "Don't have an account?", style: TextStyle(color: Colors.black),
                       children: [
                         TextSpan(
                           text: "  Sign up", style: TextStyle(color: ColorConstants.primary1, fontWeight: FontWeight.bold),
                           recognizer: TapGestureRecognizer()
                             ..onTap = () async{

                             Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                         }
                         ),
                       ]
                     ),
                 ),
               ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
