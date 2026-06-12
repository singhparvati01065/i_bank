import 'package:flutter/material.dart';
import 'package:i_bank/widgets/custom_app_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarText: 'Search',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            getCards('Branch', 'Search for branch'),
            getCards('Interest rate', 'Search for interest rate'),
            getCards('Exchange rate', 'Search for exchange rate'),
            getCards('Exchange', 'Exchange amount of money')
          ],
        ),
      ),
    );
  }

  getCards(String title, String description){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 140,
        width: 380,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text(description,  style: TextStyle(fontSize: 18, color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}
