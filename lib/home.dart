import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _weightcontroller = TextEditingController();
  double answer = 0;
  final _heightcontroller = TextEditingController();
  var msg = "";      //this variable is to display either u are overweight, underweight or healthy
  String result = "";
  var appbarcolor = Colors.blueGrey.shade500;
  var bgcolor = Colors.blueGrey.shade300;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator"),
      backgroundColor: appbarcolor,
      ),
      backgroundColor: bgcolor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            const Text("Weight:"),
            const Spacer(),
            TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              controller: _weightcontroller,
              decoration: InputDecoration(
                hintText: "Enter your weight in kg",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ), 
            ),
          
          const Spacer(flex: 2,),          
            const Text("Height:"),
            const Spacer(),
            TextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              controller: _heightcontroller,
              decoration: InputDecoration(
                hintText: "Enter your height in cm",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ), 
            ),
            const Spacer(flex: 2,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)
              ),
              onPressed: () {

                var w = _weightcontroller.text.toString();           //weight in text
                var h =_heightcontroller.text.toString();            //height in text
                

                if(w == "" || h == ""){
                  
                  setState(() {
                    result = "Please fill up all required  fields";
                  });
                }
                else{
                double weight = double.parse(w);
                double height = double.parse(h);
                double heightinmeters = (height/100);
                answer = (weight/(heightinmeters*heightinmeters));
                if(answer < 18.5){
                  msg = "You are underweight!";
                  appbarcolor = Colors.yellow.shade400;
                  bgcolor = Colors.yellow.shade300;
                }
                else if(answer > 24.9 ){
                  msg = "You are overweight!";
                  appbarcolor = Colors.red.shade400;
                  bgcolor = Colors.red.shade300;
                }
                else{
                  msg = "You are healthy";
                  appbarcolor = Colors.green.shade400;
                  bgcolor = Colors.green.shade300;
                }
                setState(() {
                 result = "Your BMI is ${answer.toStringAsFixed(2)}";
                });
              }  
              },
              child: const Text("Calculate", style: TextStyle(color: Colors.white),)),
  
              const Spacer(flex: 4,),

              Text(result, style: const TextStyle(fontSize: 17),),
              const SizedBox(height: 10,),
              Text(msg, style: const TextStyle(fontSize: 16),),
              const Spacer(),
  
          ],
        ),
      ),
    );
  }
}