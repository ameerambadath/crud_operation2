import 'package:crud_operation2/main.dart';
import 'package:crud_operation2/otp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class phoneNumber extends StatefulWidget {
  const phoneNumber({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<phoneNumber> createState() => _phoneNumberState();
}

var phone = "";
// Future<void> _sendVerificationCode(BuildContext context, String phoneNumber) async {
//   await _auth.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       verificationCompleted: (PhoneAuthCredential credential) {},
//       verificationFailed: (FirebaseAuthException e) {},
//       codeSent: (String verificationId, int? resendToken) {
//       },
//       codeAutoRetrievalTimeout: (String verificationId){},);
// }
// Future<void> _verifyOTP() async {
//   String smsCode =await _smsCodeController.text.trim();
//   var verificationId;
//   PhoneAuthCredential credential = PhoneAuthProvider.credential(
//     verificationId: verificationId,
//     smsCode: smsCode,
//   );
//   try {
//     UserCredential userCredential =
//     await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
//       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Files(),));
//       return value;
//     });
//     User? user = userCredential.user;
//
//     // User signed in successfully
//   } on FirebaseAuthException catch (e) {
//     print(e);
//     // OTP verification failed
//   }}

class _phoneNumberState extends State<phoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP LOGIN"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Text("Enter Your Mobile Number Here"),
            TextFormField(
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                phone = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: "+91" + phone,
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      phoneNumber.verify=verificationId;
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => otpaPage()));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
                child: Text("GET OTP")),
          ],
        ),
      ),
    );
  }
}
