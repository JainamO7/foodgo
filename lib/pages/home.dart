import 'package:flutter/material.dart';
import 'package:foodgo/model/category_model.dart';
import 'package:foodgo/service/Widget_supoort.dart';
import 'package:foodgo/service/category_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  String track ="0" ;
  @override
  void initState() {
    categories = getCategories();
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
          ],
        ),
      ),
    );
  }
  Widget CategoryTile(String name,String image, String categoryIndex){
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

