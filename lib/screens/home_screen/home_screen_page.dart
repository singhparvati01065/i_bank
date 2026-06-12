import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../widgets/custom_app_bar.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final List<Map<String, dynamic>> cards = [
    {'text': 'Account and Card' },
    {'text': 'Transfer' },
    {'text': 'Withdraw' },
    {'text': 'Mobile' },
    {'text': 'Pay the bill'},
    {'text': 'Save online'},
    {'text': 'Credit card'},
    {'text': 'Transaction report'},
    {'text': 'Beneficiary'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primary1,
      appBar: CustomAppBar(
        appBarText: 'Name',
        backgroundColor: ColorConstants.primary1,
        iconColor: Colors.white,
        textColor: Colors.white,
        customLeading: CircleAvatar(
          radius: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          padding: EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              getCard(),
            ],
          )
        ),
      ),
    );
  }

  getCard(){
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index){
        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child: Text(cards[index] ['text'], textAlign: TextAlign.center,style: TextStyle(color: Colors.grey, fontSize: 17),)),
        );
      },

    );
  }
}
