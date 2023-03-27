import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operation2/EditPage.dart';
import 'package:crud_operation2/LoginPage.dart';
import 'package:crud_operation2/PersonalPage.dart';
import 'package:crud_operation2/addfile.dart';
import 'package:crud_operation2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'deletepage.dart';
// var height,width,size;
// List deatailes=[{
//   "name":"ameer",
//   "email":"ameerambdath@gmail.com",
//   "phone number":"8606021154",
//   "place":"pmna"
// },
//   {
//     "name":"adul",
//     "email":"ameerambdath@gmail.com",
//     "phone number":"8606021154",
//     "place":"pmna"
//   },
// ];


class Files extends StatefulWidget {
  const Files({Key? key}) : super(key: key);

  @override
  State<Files> createState() => _FilesState();
}

class _FilesState extends State<Files> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).size;
    // height=size.height;
    // width=size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
          return Home();
        }) ,));
      },child:Icon(Icons.add),),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Text("HELLO,$currentuser"),
        actions: [TextButton(onPressed: () async {
          FirebaseAuth.instance.signOut();
          // await googleSignIn.signOut();
          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),));
        }, child: Text("Logout",style: TextStyle(color: Colors.white),)),],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [

            Text("EMPLOYEE DETAILES:-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("employee").snapshots(),
              builder: (context, snapshot) {
                var data=snapshot.data?.docs;

                return Expanded(
                  flex: 0,
                  child: ListView.builder(

                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data?.length??1,
                    itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonalPAge(name: '${data?[index]["name"]}', place: '${data?[index]["place"]}', email: '${data?[index]["email"]}', mobileNo: '${data?[index]["mobileno"]}',),));
                      },
                      child: Container(

                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey,
                        child: Row(


                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name :${data?[index]["name"]}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                Text("Email :${data?[index]["email"]}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                Text("phone no :${data?[index]["mobileno"]}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                Text("place :${data?[index]["place"]}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                                Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                SizedBox(height: 10,)

                              ],

                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                ElevatedButton(onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditPage(id: "${data?[index].id}",name: '${data![index]["name"]}', place: '${data[index]["place"]}', mobileno: '${data[index]["mobileno"]}', email: '${data[index]["email"]}',),));
                                }, child: Text("Edit",)),
                                ElevatedButton(onPressed: (){
                                  FirebaseFirestore.instance.collection("employee").doc(data?[index].id).delete();
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeletePage(id: "${data?[index].id}",name: '${data![index]["name"]}', place: '${data[index]["place"]}', mobileno: '${data[index]["mobileno"]}', email: '${data[index]["email"]}',),));
                                }, child: Text("Delete",))
                              ],
                            )
                          ],
                        )
                      ),
                    );
                  },),
                );
              }
            ),
          ],
        ),
      )


    );
  }
}
