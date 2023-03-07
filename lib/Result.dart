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
  var myspan = <TextSpan>[];
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
          color: Colors.grey[800],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: [
                  Text("Your BMI ",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w600),),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
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
                  ),
                  Text("Some Health Tips : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.grey[900],
                    elevation: 10.0,

                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
                          child: RichText(text: TextSpan(
                            style: const TextStyle(
                              height: 1.3,
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                            children: myspan,
                          ),
                            textScaleFactor: 1,
                          ),
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
          myspan = [
            TextSpan(text: "\u2022 Choosing food with lots of nutrients. ",style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "Set up a routine to eat and drink things you like and that have a lot of nutrients as well as calories. Talk with your health care provider or dietitian about how many calories to eat a day or in each meal. You also can ask how many servings you should eat of the different food groups.\n",),
            TextSpan(text: "\n\u2022 Try smoothies and shakes. ",style:TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:"Avoid beverages with few nutrients or calories, such as diet soda. But a blend of high-calorie, nutritious ingredients in a smoothie or shake can help if you're eating on the go. Meal replacement drinks also may be part of your weight-gain effort.\n",),
            TextSpan(text: "\n\u2022 Eating more frequently. ",style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "Slowly begin to eat 5 to 6 smaller meals during the day. Try to tune into your body to recognize when you might be hungry. But you may need to plan times to eat even if you aren't that hungry.",),
          ];
        });
      }
      else if(mybmi>18.5 && mybmi<25.0){
        setState(() {
          health = "You're Normal";
          cardcolor = Colors.green;
          myspan = [
            TextSpan(text: "\u2022 Exercise Regularly ",style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "Regular 30 minute cardio exercise helps to boose metabolism and reduces risk of heart disease.\n",),
            TextSpan(text: "\n\u2022 Eat Lots of Protein ",style:TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:"Eating a lot of protein may help you maintain your weight, since protein can help reduce appetite and promote fullness.protein requires a significant amount of energy for your body to break down. Therefore, eating it regularly may increase the number of calories you burn during the day.\n",),
            TextSpan(text: "\n\u2022 Stay Hydrated ",style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "Drinking water regularly may promote fullness and increase your metabolism, both important factors in weight maintenance.",),
          ];
        });
      }
      else{
        setState(() {
          health = "You're Overweight!!";
          cardcolor = Colors.red;
          myspan = [
            TextSpan(text: "\u2022 Eat high fibre foods: ",style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "Foods containing lots of fibre can help keep you feeling full, which is perfect for losing weight. Fibre is only found in food from plants, such as fruit and veg, oats, wholegrain bread, brown rice and pasta, and beans, peas and lentils.\n",),
            TextSpan(text: "\n\u2022 Do not stock junk food ",style:TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:"To avoid temptation, do not stock junk food – such as chocolate, biscuits, crisps and sweet fizzy drinks – at home. Instead, opt for healthy snacks, such as fruit, unsalted rice cakes, oat cakes, unsalted or unsweetened popcorn, and fruit juice.\n",),
            TextSpan(text: "\n\u2022 Get more active!! ",style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "Being active is key to losing weight and keeping it off. As well as providing lots of health benefits, exercise can help burn off the excess calories you cannot lose through diet alone.Find an activity you enjoy and are able to fit into your routine.",),
          ];
        });
      }
  }
}

