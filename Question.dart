
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {

  String level = 'Beginner';
  String level1 = "Begg";
  final FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.symmetric(horizontal: 40,),
      children: [
        SizedBox(height: 230,),
        Center(child: Text("Which service are you looking for?", textAlign: TextAlign.center, style: TextStyle(fontSize: 23),),),
        SizedBox(height: 60,),

        RadioListTile(value: "Nurse",
         groupValue: level, 
         title: Text("Nurse"),
         subtitle: Text("0-1 year experience"),
         onChanged: (value){setState(() {
           level=value.toString();
         });},
         ),

         RadioListTile(value: "House Worker",
         groupValue: level, 
         title: Text("House Nurse"),
         onChanged: (value){setState(() {
           level=value.toString();
         });},
         ),

        SizedBox(height: 230,),
        Center(child: Text("What kind of professional you looking for?", textAlign: TextAlign.center, style: TextStyle(fontSize: 23),),),
        SizedBox(height: 60,),

        RadioListTile(value: "Experienced",
         groupValue: level1, 
         title: Text("Experienced"),
         subtitle: Text("0-1 year experience"),
         onChanged: (value){setState(() {
           level1=value.toString();
         });},
         ),

         RadioListTile(value: "Beginner",
         groupValue: level1, 
         title: Text("Beginner"),
         onChanged: (value){setState(() {
           level1=value.toString();
         });},
         ),

         ElevatedButton(onPressed: () async{
              FirebaseFirestore.instance.collection('questions')
          .add({
            'service': level,
            'experience': level1
        });
            }, child: Text('Submit')),
      ],
      ),
    );

  }
}