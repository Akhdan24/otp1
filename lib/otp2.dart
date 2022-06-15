import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp1/lottie.dart';
import 'package:otp1/otp1.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:supercharged/supercharged.dart';

class otp2 extends StatefulWidget {
  final String verificationID;

  otp2(this.verificationID);

  @override
  State<otp2> createState() => _otp2State();
}

class _otp2State extends State<otp2> {

  TextEditingController codeController = TextEditingController();
  String smsCode = '';
  PhoneAuthCredential? credential;
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
              onTap: () {
                Get.back(result: otp1());
              },
              child: Icon(Icons.west_outlined, color: Colors.black),
            ),
            SizedBox(width: 10),
            Text("Masukan Kode OTP",
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black)),
            SizedBox(height: 30),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 10),
                Container(
                  width: 350,
                  child: Text("Untuk mengganti password, masukkan kode OTP yang dikirim ke nomor",
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.black38)),
                ),
                SizedBox(height: 50),
                PinCodeTextField(
                  keyboardType: TextInputType.phone,
                  controller: codeController,
                  appContext: context,
                  length: 6,
                  onChanged: (String value) {},
                  pinTheme: PinTheme(
                    inactiveColor: Colors.black45,
                    activeColor: "AAD7DD".toColor(),
                    selectedColor: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: "AAD7DD".toColor(),
                    onPressed: () async {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      smsCode = codeController.text.trim();
                      credential = PhoneAuthProvider.credential(
                          verificationId: widget.verificationID, smsCode: smsCode);
                      await auth.signInWithCredential(credential!).then((value) {
                        Fluttertoast.showToast(
                          msg: 'anda berhasil login',
                          fontSize: 20,
                        );
                        Get.to(lottie());
                      });
                    },
                    child: Text("Verifikasi Sekarang",
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
