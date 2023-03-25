import 'package:flutter/material.dart';

class OtpLogin extends StatefulWidget {
  const OtpLogin({Key? key}) : super(key: key);

  @override
  State<OtpLogin> createState() => _OtpLoginState();
}

class _OtpLoginState extends State<OtpLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP LOGIN"),
      ),
      body: Column(
        children: [
          SizedBox(height: 300,),
          Text("Enter Your Mobile Number Here"),
          TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),),
          ElevatedButton(onPressed: (){}, child: Text("GET OTP")),

        ],
      ),
    );
  }
}
