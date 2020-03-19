//Importing necessary packages.
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
///*************************************************************

//Class weather_data to get the data from the Api and display it as widgets.
class Weatherdata extends StatefulWidget {
  final String enteredCity;

  //Class Constructor
  Weatherdata({@required this.enteredCity});

  //Creating the state.
  @override
  MyState createState() => new MyState(city: enteredCity);
}//End of the Class(Weatherdata)

//Class MyState to create the screen of this state.
class MyState extends State <Weatherdata>
{
  //Api Id to access the Api.
  final String apiId = "6ce067d1f4ddada6288ebeba7099c03f";
  String city;
  
  //Class Constructor
  MyState({@required this.city});
  
///*************************************************************
 
  //function get data to get the weather data from the Api.
  Future<Map> getdata(String apiId,String city) async
  {
    String apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiId&units=metric";
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

///*************************************************************
   
   //Build function to render the widgets.
   @override
   Widget build(BuildContext context)
   {
     return new MaterialApp(
       //Screen_Background
       home: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Background_2.jpg"),
              fit: BoxFit.cover,
           ),
         ),
///***************************************************************         
         child: Scaffold(
           backgroundColor: Colors.transparent,
           //App Bar.
           appBar: new AppBar(
           title: const Text('Weathercaster',
           style: TextStyle(
             fontWeight: FontWeight.bold,
             fontStyle: FontStyle.italic,
             fontSize: 25,
             color: Colors.black
            ),
           ),
           centerTitle: true,
           backgroundColor: Colors.teal,
          ),
///***************************************************************
           body: new Column(
         children: <Widget>[            
            //Gif widget
            weatherGif(),
///***************************************************************
            //SizedBox to give spaces between widgets.            
            SizedBox(height: 12,),
///***************************************************************           
            //temperature widget
            updateTempwidget(city),
///***************************************************************
            //humidity widget 
            updateHumidwidget(city),
///***************************************************************            
            //wind widget 
            updateWindwidget(city),
///***************************************************************            
            //overall widget
            updateoverallwidget(city),
///***************************************************************
             
///***************************************************************           
            ],
           ),
          ),
         ),
       );
   } 
///***************************************************************
   //widget function to display GIF as widget.
   Widget weatherGif()
   {
     return new Container(
            padding: EdgeInsets.only(bottom: 5),
            constraints: BoxConstraints.tightFor(width:600,height:220),
            child: new Image.network(
              'https://cdn.dribbble.com/users/1761137/screenshots/3665783/dribbble.gif',
              //'https://cdn.dribbble.com/users/224485/screenshots/1953696/weathernew.gif',
               fit:BoxFit.cover,
            ),
          );
   }
///***************************************************************
   //widget function to display the temperature as widget.
   Widget updateTempwidget(String city)
  {
    return new FutureBuilder(
      future: getdata(apiId, city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot)
      {
         if(snapshot.hasData)
         {
           Map content = snapshot.data;
             return new Container(
              child: new Column(
                children: <Widget>[
                   new ListTile(
                     title: new Text('Temperature: ${content['main']['temp_max'].toString()}°C',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                       fontSize: 18,
                       color: Colors.black
                     ),
                     ),
                   ),
                ],
              ),
           );
         }
         else{
           return new Container();
         }
      },);
  }
///*************************************************************
  //widget function to display the humidity as widget.
  Widget updateHumidwidget(String city)
  {
    return new FutureBuilder(
      future: getdata(apiId, city),
      builder: (BuildContext context,AsyncSnapshot<Map> snapshot)
      {
         if(snapshot.hasData)
         {
           Map content = snapshot.data;
             return new Container(
              child: new Column(
                children: <Widget>[
                   new ListTile(
                     title: new Text('Humidity: ${content['main']['humidity'].toString()}%',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                       fontSize: 18,
                       color: Colors.black
                     ),
                     ),
                   ),
                ],
              ),
           );
         }
         else{
           return new Container();
         }
      },);
  }
///*************************************************************
//widget function to display the overall weather as widget.
Widget updateoverallwidget(String city)
  {
    return new FutureBuilder(
      future: getdata(apiId, city),
      builder: (BuildContext context,AsyncSnapshot<Map> snapshot)
      {
         if(snapshot.hasData)
         {
           Map content = snapshot.data;
             return new Container(
              child: new Column(
                children: <Widget>[
                   new ListTile(
                     title: new Text('OverAll: ${content['weather'][0]['main'].toString()}.',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                       fontSize: 18,
                       color: Colors.black
                     ),
                     ),
                   ),
                ],
              ),
           );
         }
         else{
           return new Container();
         }
      },);
  }
///*************************************************************
  //widget function to display the Wind speed as widget.
  Widget updateWindwidget(String city)
  {
    return new FutureBuilder(
      future: getdata(apiId, city),
      builder: (BuildContext context,AsyncSnapshot<Map> snapshot)
      {
         if(snapshot.hasData)
         {
           Map content = snapshot.data;
             return new Container(
              child: new Column(
                children: <Widget>[
                   new ListTile(
                     title: new Text('Wind: ${content['wind']['speed'].toString()}Km/h',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                       fontSize: 18,
                       color: Colors.black
                     ),
                     ),
                   ),
                ],
              ),
           );
         }
         else{
           return new Container();
         }
      },);
  }
///***************************************************************     
}//End of the Class(MyState).