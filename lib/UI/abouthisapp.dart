import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("About App"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        child: Column(
          children: [
            Text(
              "hindi stories containing 1000+ interesting stories. Wonderful story about god, festivals, motivational stories, akbar-barbel, tenali raman stories, panchtantra, story, moral stories, funny/comedy, motivational, hindi novel/upanyas, educational, dadi nani ki kahaniya , lok kathayen, kisse kahaniya, kathayen, Animal, success, life short story, amazing and unique stories etc.",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30,),
            Text(
              "This app speaks to us daily with good stories allowing us to share and enrich the world with a collaborative experience.",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30,),
            Text(
              "1000+ Majedar Kahani Story is a Best App for Har Tarah Ki Romanchak Kahaniya.",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30,),
            Text(
              "The app contains all indian hindi stories, app includes..",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
