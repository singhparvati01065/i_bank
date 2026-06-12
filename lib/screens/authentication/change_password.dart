import 'package:flutter/material.dart';
import 'package:i_bank/screens/authentication/change_password_successfully.dart';
import 'package:i_bank/widgets/customButton.dart';
import 'package:i_bank/widgets/custom_app_bar.dart';
import 'package:i_bank/widgets/custom_text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarText: 'Change password'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    CustomTextField(
                        hintText: 'New Password',
                      text: 'Type your new password',
                      suffixIcon: Icons.remove_red_eye,
                    ),
                    SizedBox(height: 25,),
                    CustomTextField(
                        hintText: 'Confirm Password',
                        text: 'Confirm password',
                      suffixIcon: Icons.remove_red_eye,
                    ),
                    SizedBox(height: 50,),
                    CustomButton(
                        text: 'Change password',
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordSuccessfully()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
