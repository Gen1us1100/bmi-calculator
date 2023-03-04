import 'package:flutter/material.dart';
//import 'BmiCalculator.dart';
class Result extends StatefulWidget {
  final String bmi;
  const Result({super.key,required this.bmi});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String health = "";
  Color cardcolor = Colors.transparent;
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      changeState(widget.bmi);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Result"),
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[800],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your BMI ",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w600),),
                  Card(
                    margin: EdgeInsets.fromLTRB(8.0, 60.0, 8.0, 8.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    color: cardcolor,
                    elevation: 10.0,
                    child: Column(
                      children: [
                         ListTile(
                          title: Text(widget.bmi,style: TextStyle(fontSize: 90),textAlign: TextAlign.center,),
                          subtitle: Text('${health}',style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),

                        )
                      ],
                    ),
                  )
                ],
                ),
          ),
            ),
      ),
        );

  }
  void changeState(String bmi){
      double mybmi = double.parse(bmi);
      if(mybmi<18.5){
        setState(() {
          health = "You're too thin";
          cardcolor = Colors.yellow;
        });
      }
      else if(mybmi>18.5 && mybmi<25.0){
        setState(() {
          health = "You're Normal";
          cardcolor = Colors.green;
        });
      }
      else{
        setState(() {
          health = "You're Overweight!!";
          cardcolor = Colors.red;
        });
      }
  }
}

