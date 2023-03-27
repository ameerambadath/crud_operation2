import 'package:crud_operation2/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var size,width,height;
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController name=TextEditingController();
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
                        child: TextFormField(

                          controller: name,

                          decoration: InputDecoration(hintText: "username",
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.grey[200],border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
                          ),
                            validator: (value){
                              if (value!.isEmpty || !RegExp(r'^[+]+$').hasMatch(value!)){
                                return "please check your name again";
                              }else{
                                return null;
                              }
                            }
                        ),
                      ),
                      Padding(

                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                        child: TextFormField(
                          validator: (value){
                            if (value!.isEmpty || !RegExp(r'^[+]+$').hasMatch(value!)){
                              return "please check your name again";
                            }else{
                              return null;
                            }
                          },
                          controller: email,


                          decoration: InputDecoration(hintText: "email",
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.grey[200],border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                        child: TextFormField(
                          validator: (value){
                            if (value!.isEmpty || !RegExp(r'^[+]+$').hasMatch(value!)){
                              return "please check your name again";
                            }else{
                              return null;
                              print("abcd");
                            }
                          },
                         controller: password,
                        obscureText: true,
                          decoration: InputDecoration(hintText: "Password",suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.grey[200],border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
                          ),
                        ),
                      ),
                      // ListTile(
                      //   trailing: TextButton(onPressed: (){}, child: Text("ForgetPassword?",style: TextStyle(color: Colors.blue),)),
                      // ),
                      InkWell(
                        onTap: () async {
                          try {
                            UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                            ).then((value) {

                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) {
                                return LoginPage();
                              },));
                              return value;
                            },);

                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print('The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Container(
                          height: height*0.06,
                          width: width*0.9,
                          color: Colors.blue,
                          child: Center(
                            child: Text("Register",style: TextStyle(color: Colors.white,fontSize: 18),),

                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: width,

                      ),
                      Divider(color: Colors.grey,),

                      Container(
                        height: 100,
                        width: width,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              // decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/FacebookLogo.png"))),
                            ),

                          ],
                        ),
                      ),


                    ],
                  ),
                ),
                Divider(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("Don't have an account?"),
                //     TextButton(onPressed: (){
                //
                //     }, child: Text("Sign Up",style: TextStyle(color: Colors.blue),))
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

