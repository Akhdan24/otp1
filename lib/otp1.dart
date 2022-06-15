import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp1/otp2.dart';
import 'package:supercharged/supercharged.dart';
import 'package:get/get.dart';

class otp1 extends StatefulWidget {
  const otp1({Key? key}) : super(key: key);

  @override
  State<otp1> createState() => _otp1State();
}

class _otp1State extends State<otp1> {
  TextEditingController numberController = TextEditingController();
  String verificationIDReceived = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.west_outlined, color: Colors.black),
            ),
            SizedBox(width: 10),
            Text("Masukan Nomor Telepon",
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black)),
            SizedBox(height: 20),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: numberController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 4, 0, 4),
                    border: OutlineInputBorder(),
                    hintText: "contoh :  +628123456789"),
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: "AAD7DD".toColor(),
                    onPressed: () async {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      auth.verifyPhoneNumber(
                          phoneNumber: numberController.text,
                          timeout: const Duration(seconds: 60),
                          verificationCompleted:
                              (PhoneAuthCredential credential) async {
                            Fluttertoast.showToast(
                              msg: "Terkirim",
                              fontSize: 20,
                            );
                          },
                          verificationFailed:
                              (FirebaseAuthException exception) {
                            print(exception.message);
                          },
                          codeSent: (String verificationID, int? resendToken) {
                            // otpCodeVisible = true;
                            Fluttertoast.showToast(
                              msg: "Terkirim $verificationID",
                              fontSize: 20,
                            );
                            setState(() {
                              verificationIDReceived = verificationID;
                            });
                            Get.to(otp2(verificationIDReceived));
                          },
                          codeAutoRetrievalTimeout: (String verificationID) {});
                    },
                    child: Text("Kirim Kode Verifikasi",
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
