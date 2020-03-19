//Importing necessary packages.
//import 'dart:html';

import 'package:flutter/material.dart';
import './weather_data.dart';
///*************************************************************
//main function.
void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}
///*************************************************************
//The home page class.
class MyApp extends StatefulWidget {
  //Creating the state.
  @override
  _State createState() => new _State();
}//End of the Class(MyApp)
///*************************************************************
//The home page state.
class _State extends State<MyApp> {

  //String variable to store the city that entered by the user.
  String city;

  //TextEditing Controller to get the data from Textfield.
  TextEditingController getCity = new TextEditingController();
///*************************************************************
  //dispose function to get only the text from the textfield. 
  @override
  void dispose() {
    getCity.dispose();
    super.dispose();
  } 
  /*void showDefaultSnackbar(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Please Enter a City !'),
      ),
    );
  }*/
  //Function to get the weather of entered city form the Api when the 'Get Weather' button is Pressed.
  void getWeather()
  {
    var router = new MaterialPageRoute(
    builder: (BuildContext context) => new Weatherdata(enteredCity: getCity.text,),);
    Navigator.of(context).push(router);
  }
///*************************************************************
  //Build function to render the widgets. 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //Screen_Background
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Background_1.jpg"),
              fit: BoxFit.cover,
           ),
         ),
///*************************************************************
      child: new Scaffold(
        backgroundColor: Colors.transparent,
      //App Bar.
      appBar: new AppBar(
        title: const Text('Weathercaster',
        style: TextStyle(
          fontWeight:FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 25,
          color: Colors.black
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: new Image.asset("assets/images/cloudy.png"),
      ),
///***************************************************************
      //Scaffold  Body.
      body: new Column(
        children: <Widget>[
          //Weather Gif.
          new Container(
            padding: EdgeInsets.only(bottom: 5),
            constraints: BoxConstraints.tightFor(width:600,height:220),
            child: new Image.network(
              'https://cdn.dribbble.com/users/1761137/screenshots/3665783/dribbble.gif',
               fit:BoxFit.cover,
            ),
          ),
///****************************************************************
          //TextField to let the user enter the city.
          new Container(
            padding: EdgeInsets.all(35),
            child: new TextField(
                controller: getCity,
                decoration: new InputDecoration(
                  fillColor: Colors.teal,
                  border:new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(25),
                    ),
                    borderSide: const BorderSide(color: Colors.teal,
                    ),
                  ),  
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(25),
                    ),
                    borderSide: const BorderSide(color: Colors.teal,
                    ),
                  ),   
                   labelText: 'City',
                   labelStyle: TextStyle(
                     fontSize: 20,
                    color: Colors.black,
                   ),
                   hintText: 'Enter your city',
                   icon: new Icon(Icons.location_on,
                   color: Colors.black,
                   size: 30,),
                ),
                keyboardType: TextInputType.text,
                autocorrect: true,
          ),
          ),
///*****************************************************************
          SizedBox(height: 12,),
          //Button to get the weather of the entered city.
          new Container(
            padding: EdgeInsets.only(left: 25),
            child: new RaisedButton(
            onPressed:()=> getWeather(),
            child: Text('Get Weather',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            color: Colors.teal,  
              ),            
            ),
///********************************************************************          
         ],
        ),
       ),          
      ),
    );
  }
}//End of the Class(_State)