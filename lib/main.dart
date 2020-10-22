import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home()
  ));
  
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   int _people = 1;
   String _infoText = "Pode entrar!";

   void _changePeople(int delta){
     setState(() {
        if (_people == 0 && delta == -1){
           _people =0;
           _infoText = "Está vazio :(";
        }
        else if (_people == 9 && delta == 1){
           _people += delta;
          _infoText = "Lotado!!";
        }
        else if (_people == 10 && delta == 1){
          _infoText = "Lotado!!";
        }
        else if (_people == 1 && delta == -1){
           _people += delta;
          _infoText = "Está vazio :(";
        }
        else if (_people >= 0){
          _people += delta;
          _infoText = "Pode entrar!";
        }
        
        
       
       
     });
    

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar:AppBar(title: Text("Contador de pessoas")),
          body: Stack(
            children: [
              Image.asset(
                "images/restaurant.jpg",
                fit: BoxFit.cover,
                height: 1000.0,
                width: 1400.0,
              ),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pessoas: $_people",
             style: TextStyle(
              color: Colors.white,fontSize: 50,
               )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text("+1", style: TextStyle(
                      color: Colors.white, fontSize: 40),
                      ),
                      onPressed:(){
                        _changePeople(1);

                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text("-1", style: TextStyle(
                      color: Colors.white, fontSize: 40),
                      ),
                      onPressed:(){
                        _changePeople(-1);
                        
                      },
                    ),
                  ),
                  
                ]
              ),
              Text(_infoText,
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 40)
                  ),

          ],
        ),
      ]
            ),
    );
  }
}