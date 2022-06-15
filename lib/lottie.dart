import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:supercharged/supercharged.dart';

import 'otp1.dart';

class lottie extends StatefulWidget {
  const lottie({Key? key}) : super(key: key);

  @override
  State<lottie> createState() => _lottieState();
}

class _lottieState extends State<lottie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  child: LottieBuilder.network(
                      'https://assets8.lottiefiles.com/packages/lf20_m3ixidnq.json'),
                ),
                // SizedBox(height: 1),
                Text("Pendaftaran Berhasil",
                    style: GoogleFonts.poppins().copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                      "Selamat Anda telah terdaftar sebagai member di aplikasi ini",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                ),
              ],
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
                    child: Text(
                      "Kembali ke Home",
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    onPressed: () async {
                      Get.to(otp1());
                    },
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
