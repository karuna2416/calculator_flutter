import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    title: "calculator",
    home: Calculator(),
  ));
}
class Calculator extends StatefulWidget{
  State<Calculator> createState()=>
      _CalculatorState();

}
class _CalculatorState extends State<Calculator>
{
  int num1=0;
  int num2=0;
  String result="";
  String output="";
  String oprator="";

  void onclick(String button)
  {
  if(button=="c")
    {
      int num1=0;
      int num2=0;
      output="";
      result="";
    }
  else if(button=="+"|| button=="-"||button=="*"||button=="/")
    {
      num1=int.parse(output);
      result="";
      oprator=button;

    }
  else if(button=="=")
    {
      num2=int.parse(output);
      if(oprator=="+")
        {
          result=(num1+num2).toString();
        }
       if(oprator=="-")
         {
           result=(num1-num2).toString();
         }
      if(oprator=="*")
      {
        result=(num1*num2).toString();
      }       if(oprator=="/")
      {
        result=(num1/num2).toString();
      }
    }
  else{
    result=int.parse(output+button).toString();
  }
  setState(() {
    output=result;
  });
  }
  Widget Buttoncustom(String button)
  {
    return Expanded(
        child:OutlinedButton(onPressed: ()=>onclick(button),
            child: Text(button))
    );
  }
  Widget build(context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text("$output"),
            ),
            Row(
              children: [
                Buttoncustom("9"),
                Buttoncustom("8"),
                Buttoncustom("7"),
                Buttoncustom("+"),

              ],
            ),
            Row(
              children: [
                Buttoncustom("6"),
                Buttoncustom("5"),
                Buttoncustom("4"),
                Buttoncustom("-"),

              ],
            ),
            Row(
              children: [
                Buttoncustom("3"),
                Buttoncustom("2"),
                Buttoncustom("1"),
                Buttoncustom("/"),

              ],
            ),
            Row(
              children: [
                Buttoncustom("c"),
                Buttoncustom("="),


              ],
            )
          ],
        ),
      )

    );
  }
}