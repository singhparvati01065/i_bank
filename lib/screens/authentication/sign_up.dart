import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:i_bank/constants/color_constants.dart';
import 'package:i_bank/screens/authentication/sign_in.dart';
import 'package:i_bank/widgets/custom_app_bar.dart';
import 'package:i_bank/widgets/customButton.dart';
import 'package:i_bank/widgets/custom_text_field.dart';

import '../../services/firebase_auth_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  final FirebaseAuthService authService = FirebaseAuthService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarText: 'Sign up',
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
              Text('Welcome to us', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: ColorConstants.primary1),),
              Text('Hello there, create New account', style: TextStyle(fontSize: 17,),),
              SizedBox(height: 30,),

              CustomTextField(hintText: 'Name', controller: nameController,),
              SizedBox(height: 20,),
              CustomTextField(hintText: 'Email',controller: emailController,),
              SizedBox(height: 20,),
              CustomTextField(hintText: 'Password', controller: passwordController,),
              SizedBox(height: 25,),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.6,
                    child: Checkbox(
                      // activeColor: Colors.grey.shade50,
                        value: isChecked,
                        onChanged: (value){
                          setState(() {
                            isChecked = value!;
                          });
                    }),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                          text: "By creating an account your agree to our ", style: TextStyle(color: Colors.black, fontSize: 21),
                          children: [
                            TextSpan(
                                text: " Tern and Condition",style: TextStyle(color: ColorConstants.primary1, fontWeight: FontWeight.bold,),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (){
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                                  }
                            ),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),

              CustomButton(text: 'Sign up',
                onTap: () async{
                await authService.signUp(
                    nameController.text,
                    emailController.text,
                    passwordController.text);
                },
              ),
              SizedBox(height: 10,),

              SizedBox(height: 10,),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: "Have an account?", style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: "  Sign in", style: TextStyle(color: ColorConstants.primary1, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
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
    );
  }
}
