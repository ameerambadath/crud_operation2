import 'package:crud_operation2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'phoneNumber.dart';
import 'SignupPage.dart';
import 'files.dart';
var currentuser;
final GoogleSignIn googleSignIn = GoogleSignIn();

var size,width,height;
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height*0.9,
                  width: width,
                  child: Column(

                    children: [
                      SizedBox(
                        height: height*0.2,
                        width: width,
                      ),
                      Container(
                        height: height*0.1,
                        width: width/2,
                        // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/instagram_logo.png'))),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(hintText: "enter your email",
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.grey[200],border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                        child: TextField(
                         controller: password,
                          obscureText: true,
                          decoration: InputDecoration(hintText: "Password",suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.grey[200],border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
                          ),
                        ),
                      ),




                      ListTile(
                        trailing: TextButton(onPressed: (){}, child: Text("ForgetPassword?",style: TextStyle(color: Colors.blue),)),
                      ),
                      InkWell(
                         onTap: () async {
                           try {
                             UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                 email: email.text,
                                 password: password.text,
                             ).then((value) {

                               Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) {
                                 return Files();
                               },));
                               return value;
                             },);

                           } on FirebaseAuthException catch (e) {
                             if (e.code == 'user-not-found') {
                               print('No user found for that email.');
                             } else if (e.code == 'wrong-password') {
                               print('Wrong password provided for that user.');
                             }
                           }
                         },



                        child: Container(
                          height: height*0.06,
                          width: width*0.9,
                          color: Colors.blue,
                          child: Center(
                            child: Text("Log In",style: TextStyle(color: Colors.white,fontSize: 18),),

                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: width,

                      ),
                      Divider(color: Colors.grey,),
                      InkWell(
                        onTap: () async {
                          await googleSignIn.signIn().then((value) => currentuser = value?.displayName);

                          if(currentuser !=null){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Files(),));

                          }else{
                            print("not exist");
                          }

                        },
                        child: Container(
                          height: height*0.06,
                          width: width*0.9,
                          color: Colors.blue,
                          child: Center(child: Text("sign in with google",style: TextStyle(color: Colors.white,fontSize: 18),)),
                        ),
                      ),
                      Divider(),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => phoneNumber(),));
                        },
                        child: Container(
                          height: height*0.06,
                          width: width*0.9,
                          color: Colors.blue,
                          child: Center(
                            child: Text("LOGIN THROUGH OTP",style: TextStyle(color: Colors.white,fontSize: 18),),

                          ),
                        ),
                      ),




                    ],
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage(),));
                    }, child: Text("Sign Up",style: TextStyle(color: Colors.blue),))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

