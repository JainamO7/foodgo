import 'package:flutter/material.dart';
import 'package:foodgo/pages/home.dart';
import 'package:foodgo/service/Widget_supoort.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container( margin: EdgeInsets.only(top: 40.0),
      
        child: Column(
          children: [
            Image.asset("images/onboard.png"),
            SizedBox(height: 20,),
            Text("The Fastes\nFood Delivery", style: AppWidget.HeadlineTetFeildstyle(),textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            Text("Craving somthing delicious?\nOrder no and get your favrites\ndelivered fast!",style: AppWidget.sImpleTetFeildstyle(),textAlign: TextAlign.center,),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home() ));
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(color: Color(0xff8c592a),borderRadius: BorderRadius.circular(20)),
                child: Center(child: Text("Get started", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}