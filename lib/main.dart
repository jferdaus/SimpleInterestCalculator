import "package:flutter/material.dart" ;

import "app_screens/home.dart";




void main(){
  runApp(

    const MaterialApp(
      title: "Exploring UI Widgets",
      debugShowCheckedModeBanner: false,

      home: Home(),
    )

  ) ;

}