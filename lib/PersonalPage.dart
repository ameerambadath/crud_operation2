import 'package:flutter/material.dart';

class PersonalPAge extends StatefulWidget {
  final String name;
  final String place;
  final String email;
  final String mobileNo;
  PersonalPAge({Key? key, required this.name, required this.place, required this.email, required this.mobileNo}) : super(key: key);

  @override

  State<PersonalPAge> createState() => _PersonalPAgeState();

}

class _PersonalPAgeState extends State<PersonalPAge> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController mobileNo=TextEditingController();
  TextEditingController place=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Specific Detailes"),

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child:
        Column(

          children: [
            SizedBox(
              height: 100,
            ),
            Text("NAME",style: TextStyle(fontSize: 30,color: Colors.green),),
            Text(widget.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            Text("email",style: TextStyle(fontSize: 30,color: Colors.green)),
            Text(widget.email,style: TextStyle(fontSize: 25),),

            SizedBox(height: 50,),
            Text("PLACE",style: TextStyle(fontSize: 30,color: Colors.green)),
            Text(widget.place,style: TextStyle(fontSize: 25),),
            SizedBox(height: 50,),

            Text("MOBILE NO",style: TextStyle(fontSize: 30,color: Colors.green)),
            Text(widget.mobileNo,style: TextStyle(fontSize: 25),)
          ],
        ),
      ),
    );
  }
}
