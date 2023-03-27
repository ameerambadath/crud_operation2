import 'package:crud_operation2/main.dart';
import 'package:crud_operation2/phoneNumber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'files.dart';

class otpaPage extends StatefulWidget {
  const otpaPage({Key? key}) : super(key: key);
  @override
  State<otpaPage> createState() => _otpaPageState();
}

class _otpaPageState extends State<otpaPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var code="";
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Enter OTP Here"),
        TextFormField(
          onChanged: (value){
            code=value;
          },
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        ElevatedButton(
            onPressed: () async {
              try{
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId:phoneNumber.verify, smsCode: code);

                // Sign the user in (or link) with the credential
                await auth.signInWithCredential(credential);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Files()));
              }
           catch(e){
                print("Wrong OTP");
           }
            },
            child: Text("VERIFY OTP")),
      ],
    ));
  }
}
