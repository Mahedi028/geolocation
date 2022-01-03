import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Geo Location Tracker',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            ),

      ),
      body: MyHomePage(),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


   Future getLocation()async{
     try{
        Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
      );
      setState(() {
        position=position;
      });
      print(position.latitude);
      print(position.longitude);

     }catch(err){
       print(err);
     }

   

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: Colors.red,
              size: 100,
            ),
            SizedBox(height: 10,),
            Text(
              'Get the location',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 10,),
              Text(''),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Get Location',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    
                  ),
                  ),
                onPressed: (){}
                )
          ],
        ),
      ),
      
    );
  }
}