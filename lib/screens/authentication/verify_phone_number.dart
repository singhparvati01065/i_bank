import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:i_bank/screens/authentication/change_password.dart';
import 'package:i_bank/widgets/customButton.dart';
import 'package:i_bank/widgets/custom_app_bar.dart';
import 'package:i_bank/widgets/custom_text_field.dart';

import '../../constants/color_constants.dart';

class VerifyPhoneNumber extends StatefulWidget {
  const VerifyPhoneNumber({super.key});

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarText: 'Forgot password'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type a code', style: TextStyle(fontSize: 16),),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        CustomTextField(hintText: 'Code', textInputType: TextInputType.number, width: 210,),
                        SizedBox(width: 10,),
                        CustomButton(text: 'Resend', width: 130,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    RichText(
                      text: TextSpan(
                          text: "We texyed you a code to verify your phone number", style: TextStyle(color: Colors.black, fontSize: 19),
                          children: [
                            TextSpan(
                                text: " (+84) 0123456788", style: TextStyle(color: ColorConstants.primary1, fontWeight: FontWeight.bold, fontSize: 19),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (){
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                                  }
                            ),
                          ]
                      ),
                    ),
                    SizedBox(height: 20,),

                    Text("This code will expired 10 minutes after this message. If you don't get a message.", style: TextStyle(fontSize: 18),),

                    SizedBox(height: 20,),
                    CustomButton(text: 'Change password',
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()));
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
