import 'package:flutter/material.dart';
import 'package:foodgo/model/burger_model.dart';
import 'package:foodgo/model/category_model.dart';
import 'package:foodgo/model/chineseModel.dart';
import 'package:foodgo/model/pizza_model.dart';
import 'package:foodgo/service/Widget_supoort.dart';
import 'package:foodgo/service/burger_data.dart';
import 'package:foodgo/service/category_data.dart';
import 'package:foodgo/service/chinese_data.dart';
import 'package:foodgo/service/pizza_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<PizzaModel> pizza = [];
  List<BurgerModel> burger = [];
  List<Chinesemodel> chinese = [];
  String track = "0";
  @override
  void initState() {
    chinese = getChinese();
    pizza = getPizza();
    categories = getCategories();
    burger = getBurger();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      height: 100,
                      width: 110,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "Order your favourite food",
                      style: AppWidget.sImpleTetFeildstyle(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/boy.jpg',
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFeceef8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search food item...",
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.search, color: Colors.white, size: 30),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    categories[index].name.toString(),
                    categories[index].image.toString(),
                    index.toString(),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
        track =="0"?    Expanded(
              // height: MediaQuery.of(context).size.height / 2,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: pizza.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.96,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return FoodTile(
                      pizza[index].name!,
                      pizza[index].image!,
                      pizza[index].price!,
                    );
                  },
                ),
              ),
            ): track == "1" ? Expanded(
              // height: MediaQuery.of(context).size.height / 2,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: burger.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.96,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return FoodTile(
                      burger[index].name!,
                      burger[index].image!,
                      burger[index].price!,
                    );
                  },
                ),
              ),
            ) : track == "2" ? Expanded(
              // height: MediaQuery.of(context).size.height / 2,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: chinese.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.96,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return FoodTile(
                      chinese[index].name!,
                      chinese[index].image!,
                      chinese[index].price!,
                    );
                  },
                ),
              ),
            ) : Expanded(
              // height: MediaQuery.of(context).size.height / 2,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: pizza.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.96,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return FoodTile(
                      pizza[index].name!,
                      pizza[index].image!,
                      pizza[index].price!,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget FoodTile(String name, String image, String price) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      padding: EdgeInsets.only(left: 10, top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(name, height: 150, width: 150, fit: BoxFit.contain),
          Text(name, style: AppWidget.boldtextfeildStyle()),
          Text("\n$price", style: AppWidget.priceTextFeildStyle()),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xffef2b39),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget CategoryTile(String name, String image, String categoryIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {});
        track = categoryIndex.toString();
      },
      child:
          track == categoryIndex
              ? Container(
                margin: EdgeInsets.only(right: 20),
                padding: EdgeInsets.only(right: 20, left: 20),
                decoration: BoxDecoration(
                  color: Color(0xffef2b39),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      image,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    Text(name, style: AppWidget.whiteTextFeildstyle()),
                  ],
                ),
              )
              : Container(
                margin: EdgeInsets.only(right: 20),
                padding: EdgeInsets.only(right: 20, left: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFeceef8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      image,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    Text(name, style: AppWidget.sImpleTetFeildstyle()),
                  ],
                ),
              ),
    );
  }
}
