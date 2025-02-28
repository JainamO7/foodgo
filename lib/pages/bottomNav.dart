import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodgo/pages/home.dart';
import 'package:foodgo/pages/order.dart';
import 'package:foodgo/pages/profile.dart';
import 'package:foodgo/pages/wallet.dart';
import '';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  late List<Widget> pages;
  late Home HomePage;
  late Order order;
  late Wallet wallet;
  late Profile profilePage;
  int currentTableIndex = 0;
  @override
  void initState() {
    HomePage = Home();
    order = Order();
    wallet = Wallet();
    profilePage = Profile();
    pages = [HomePage, order, wallet, profilePage];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [Icon(Icons.home,color: Colors.white,size: 30,),Icon(Icons.shopping_bag,color: Colors.white,size: 30,),Icon(Icons.wallet,color: Colors.white,size: 30,),Icon(Icons.person,color: Colors.white,size: 30,),],
        height: 70,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTableIndex = index;
          });
        },
      ),
    );
  }
}
