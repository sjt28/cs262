import 'package:flutter/material.dart';

void main() => runApp(new MyCalculatorApp());

class MyCalculatorApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Calculator',
        home: MyCalculator()
    );
  }
}

class MyCalculator extends StatefulWidget{



  @override
  State<StatefulWidget> createState () => Calculator();
}

class Calculator extends State<MyCalculator>{

//Register Controler for TextFormField - we have 2 tff
final controller_numberA = TextEditingController();
final controller_numberB = TextEditingController();
final my_form_key = GlobalKey<FormState>();

String textToShow="";

//Create the sum function
  void Sum()
  {
    //Validate form
    if(my_form_key.currentState.validate())
      {
        int numberA = int.parse(controller_numberA.text);
        int numberB = int.parse(controller_numberB.text);
        int result = numberA + numberB;

        setState((){
          textToShow = "$numberA + $numberB = $result";
      });
  }
  }

  //Create the minus function
  void Minus()
  {
    //Validate form
    if(my_form_key.currentState.validate())
    {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA - numberB;

      setState(() {
        textToShow = "$numberA - $numberB = $result";
      });
    }
  }

  //Create the Multiplication function
  void Multiplication()
  {
    //Validate form
    if(my_form_key.currentState.validate())
    {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA * numberB;

      setState(() {
        textToShow = "$numberA * $numberB = $result";
      });
    }
  }

  //Create the Division function
  void Division()
  {
    //Validate form
    if(my_form_key.currentState.validate())
    {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      double result = numberA / numberB;

      setState(() {
        textToShow = "$numberA / $numberB = $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    //Create layout

    return new Scaffold(body:Form(key:my_form_key,child:
    Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Create 2 Text Form Field in Vertical
        TextFormField(
      controller: controller_numberA,
      validator: (value) {
        if(value.isEmpty) return "Please enter number";

      }, decoration: InputDecoration(hintText: "Enter number"),
          keyboardType: TextInputType.number),
        TextFormField(
            controller: controller_numberB,
            validator: (value) {
              if(value.isEmpty) return "Please enter number";

            }, decoration: InputDecoration(hintText: "Enter number"),
            keyboardType: TextInputType.number),

        //Create Result TextField
        Text(textToShow,style:TextStyle(fontSize: 20.0),),
        //Create the buttons with which to chose the function in a row
        Row(mainAxisAlignment: MainAxisAlignment.center,children:<Widget>[
          RaisedButton(
            onPressed: Sum,
            child: Text('+'),
          ),
          RaisedButton(
            onPressed: Minus,
            child: Text('-'),
          ),
          RaisedButton(
            onPressed: Multiplication,
            child: Text('*'),
          ),
          RaisedButton(
            onPressed: Division,
            child: Text('/'),
          ),
        ],)


      ],

    )
    ));
  }
}