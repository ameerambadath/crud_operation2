import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeletePage extends StatefulWidget {
  final String name;
  final String place;
  final String mobileno;
  final String email;
  final String id;

  DeletePage({Key? key, required this.name, required this.place, required this.mobileno, required this.email, required this.id}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}
class _DeletePageState extends State<DeletePage> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController mobileno=TextEditingController();
  TextEditingController place=TextEditingController();


  @override
  void initState() {
    name.text=widget.name;
    email.text=widget.email;
    mobileno.text=widget.mobileno;
    place.text=widget.place;

    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1589810264340-0ce27bfbf751?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHNvbGlkJTIwYmFja2dyb3VuZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"),fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                ),
                Center(child: Text("Edit your detailes",style: TextStyle(color: Colors.yellow,fontSize: 35,fontWeight: FontWeight.bold),)),
                Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
                TextFormField(
                  controller:name,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,),borderRadius: BorderRadius.circular(20)),

                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue),
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
                TextFormField(
                  controller:email,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green),borderRadius: BorderRadius.circular(20)),
                      // hintText: "enter you email",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue),
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("phone number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
                TextFormField(
                  controller:mobileno,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green),borderRadius: BorderRadius.circular(20)),
                      // hintText: "enter you phone number here",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue),
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Place",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
                TextFormField(
                  controller:place,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green),borderRadius: BorderRadius.circular(20)),
                      // hintText: "enter your placehere",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue),
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(height: 50,),
                Center(
                  child: InkWell(
                    onTap: (){
                      showDialog(
                        context: context, builder: (context) {
                        return AlertDialog(
                          title:Text( "detailes Deleted Successfully"),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }, child: Text("ok"))
                          ],
                        );
                      },);
                      FirebaseFirestore.instance.collection("employee").doc(widget.id).update({
                        'name':name.text,
                        "email":email.text,
                        "place":place.text,
                        "mobileno":mobileno.text
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(borderRadius:  BorderRadius.circular(20),gradient: LinearGradient(colors:[Colors.white,Colors.black])),
                      child:Center(child: Text("Delete",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),)) ,
                    ),
                  ),
                ),
              ],



            ),
          ),
        ),
      ),
    );
  }
}
