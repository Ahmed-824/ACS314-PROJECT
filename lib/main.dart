import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text("Log in page",style: TextStyle(color: Colors.white),),
         centerTitle: true,

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
    
        Text(
          "My Application",
        style: TextStyle(
          color:Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.w800),
          ),
          Text("Enter Password"),
          TextField(),
          Text("Enter Username"),
          TextField(),
          SizedBox(height: 20,),
          MaterialButton(onPressed:(){},child: Text("Login", style: TextStyle(color: Colors.white,)),color: Colors.deepOrangeAccent,)
          ],
        )
      )
    )
  );
}