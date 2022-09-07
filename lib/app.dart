import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  var _imageApp = AssetImage("image/padrao.jpg");
  var _lista = [
    "pedra",
    "papel",
    "tesoura",
  ];
  var _infDoResult = "Escolha uma opção abaixo";

  var _vitoria = 0;
  var _empate = 0;
  var _derrota = 0;

void exibir(String obDigitado){
 var _numero = Random().nextInt(_lista.length);
 var _escolhaRandom = _lista[_numero];

   switch(_escolhaRandom){

    case "pedra" :
      setState(() {
        _imageApp = AssetImage("image/pedra.jpg");
      });
    break;

    case "papel" :
      setState(() {
         _imageApp = AssetImage("image/papel.jpg");
      });
    break;

    case "tesoura" : 
      setState(() {
        _imageApp = AssetImage("image/tesoura.jpg");
      });
    break;
   };

   if(obDigitado == "pedra" && _escolhaRandom == "tesoura" ||
      obDigitado == "tesoura" && _escolhaRandom == "papel" ||
      obDigitado == "papel" && _escolhaRandom == "pedra"
   ){
       setState(() {
         _infDoResult = "VOCÊ VENCEU!";
       });

       setState(() {
          _vitoria++;
       });
   }

   else if(_escolhaRandom == "pedra" && obDigitado == "tesoura" ||
          _escolhaRandom == "tesoura" && obDigitado == "papel" ||
           _escolhaRandom == "papel" && obDigitado == "pedra"
       ){
          setState(() {
             _infDoResult = "VOCÊ PERDEU!";
          });

          setState(() {
            _derrota++;
          });
       }
       else{
           
           setState(() {
              _infDoResult = "HOUVE UM EMPATE!";
          });

           setState(() {
            _empate++;
          });
       }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
         width: double.infinity,
        padding: EdgeInsets.only(top:20,bottom:20),
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Escolha do App:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            Padding(padding: EdgeInsets.only(top: 10, bottom: 40), 
            child: Image( image: this._imageApp,
             height: 100,
            ),),
            Padding(padding:EdgeInsets.only(bottom: 20), 
            child:Text( _infDoResult ,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ), ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
        
              GestureDetector(
                onTap: () => exibir("pedra"),
                child: Image.asset("image/pedra.jpg", height: 80),),
              
              GestureDetector(
                onTap: () => exibir("papel"),
                child:  Image.asset("image/papel.jpg", height:  80,),
              ),
              
              GestureDetector(
                onTap: () => exibir("tesoura"),
                child: Image.asset("image/tesoura.jpg", height: 80,),
              ),

            ]),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [
              
              Padding( padding: EdgeInsets.only(top: 50), 
                child: Text("Vitória:",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
              )),

              Padding( padding: EdgeInsets.only(top: 50), 
                child: Text("Empate:",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                )
              )),

              Padding( padding: EdgeInsets.only(top: 50), 
                child: Text("Derrota:",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              )),

            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [
              
              Padding( padding: EdgeInsets.only(top: 5), 
                child: Text("$_vitoria",
                style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Colors.green
                )
                )),

              Padding( padding: EdgeInsets.only(top: 5), 
                child: Text( "$_empate",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                    color:  Colors.orange
                )
                )),

              Padding( padding: EdgeInsets.only(top: 5), 
                child: Text( "$_derrota",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:  Colors.red
                )
                )),

            ])


          ]),
      ),
    );
  }
}