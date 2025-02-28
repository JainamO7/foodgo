import 'package:flutter/material.dart';
import 'package:foodgo/service/Widget_supoort.dart';

class DetailPage extends StatefulWidget {
  String image, name, price;
  DetailPage({super.key, required this.image, required this.name, required this.price});

  @override
  State<DetailPage> createState() => _DetailPageState();
}



class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 50),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xffef2b39),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Image.asset(
                "${widget.image}",
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Text("${widget.name}", style: AppWidget.HeadlineTetFeildstyle()),
            Text("${widget.price}", style: AppWidget.priceTextFeildStyle()),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "Ullamco amet laborum non laborum qui consectetur et nostrud aute sit consequat consequat.Ullamco amet laborum non laborum qui consectetur et nostrud aute sit consequat consequat.Ullamco amet laborum non laborum qui consectetur et nostrud aute sit consequat consequat.Ullamco amet laborum non laborum qui consectetur et nostrud aute sit consequat consequat.Ullamco amet laborum non laborum qui consectetur et nostrud aute sit consequat consequat.",
                style: AppWidget.sImpleTetFeildstyle(),
              ),
            ),
            SizedBox(height: 30),
            Text("Quantitiy", style: AppWidget.sImpleTetFeildstyle()),
            SizedBox(height: 10),
            Row(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 3,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                ),
                SizedBox(width: 20),
                Text("1", style: AppWidget.HeadlineTetFeildstyle()),
                SizedBox(width: 20),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 3,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.remove, color: Colors.white, size: 30),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Rs.999",
                        style: AppWidget.boldWhitetextFeildStyle(),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "ORDER NOW",
                        style: AppWidget.whiteTextFeildstyle(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
