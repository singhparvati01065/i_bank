import 'package:flutter/material.dart';
import 'package:i_bank/screens/authentication/verify_phone_number.dart';
import 'package:i_bank/widgets/customButton.dart';
import 'package:i_bank/widgets/custom_app_bar.dart';
import 'package:i_bank/widgets/custom_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                    Text('Type your phone number', style: TextStyle(fontSize: 16),),
                    SizedBox(height: 20,),
                    CustomTextField(hintText: '(+84)', textInputType: TextInputType.number,),
                    SizedBox(height: 20,),
                    Text('We texted you a code to verify your phone number', style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                    CustomButton(
                        text: 'Send',
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyPhoneNumber()));
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
