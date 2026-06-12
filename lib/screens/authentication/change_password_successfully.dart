import 'package:flutter/material.dart';
import 'package:i_bank/constants/color_constants.dart';
import 'package:i_bank/screens/home_screen/home_screen_page.dart';
import 'package:i_bank/widgets/customButton.dart';
import 'package:i_bank/widgets/custom_app_bar.dart';

class ChangePasswordSuccessfully extends StatefulWidget {
  const ChangePasswordSuccessfully({super.key});

  @override
  State<ChangePasswordSuccessfully> createState() => _ChangePasswordSuccessfullyState();
}

class _ChangePasswordSuccessfullyState extends State<ChangePasswordSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Change password successfully!', style: TextStyle(color: ColorConstants.primary1, fontSize: 22),),
              SizedBox(height: 25,),
              Text('You have successfully change password. Please use the new password when Sign in.', textAlign: TextAlign.center,style: TextStyle( fontSize: 19),),
              SizedBox(height: 30,),
              CustomButton(
                  text: 'Ok',
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreenPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
