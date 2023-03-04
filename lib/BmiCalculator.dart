import 'package:flutter/material.dart';

import 'Result.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculator();
}

class _BmiCalculator extends State<BmiCalculator> {
  int currentindex = 0;//variable for Radio Button
  String finalresult = "";
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[850],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Row(
                  children: [
                    radioButton("Man", Colors.blue, 0),
                    radioButton("Woman", Colors.pink, 1),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "Your Height in Cm : ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Container(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: heightController,
                  decoration: InputDecoration(
                      hintText: "Enter your height",
                      filled: true,
                      fillColor: Color.fromARGB(100, 157, 156, 156),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Your Weight in Kg : ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Container(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: weightController,
                  decoration: InputDecoration(
                      hintText: "Enter your weight",
                      filled: true,
                      fillColor: Color.fromARGB(100, 157, 156, 156),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 80,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 0, 0),
                    ),
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                      ),
                    ),
                    onPressed: () {
                      double height = double.parse(heightController.value.text);
                      double weight = double.parse(weightController.value.text);
                      calculateBmi(height, weight);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Result(bmi: finalresult,)));
                    },
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  //Calculating function
  void calculateBmi(double height,double weight){
    double result = 10000*(weight / (height * height));
    String bmi = result.toStringAsFixed(2);
    setState(() {
      finalresult = bmi;
    });
  }


  //Function to change index value
  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      height: 120.0,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: currentindex == index
                ? color
                : Color.fromARGB(99, 100, 100, 100)),
        child: Text(
          value,
          style: TextStyle(
            color: currentindex == index ? Colors.white : color,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          changeIndex(index);
        },
      ),
    ));
  }
}
