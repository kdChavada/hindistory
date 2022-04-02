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
        title: const Text("ऐप के बारे में"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF3366FF),
                Color(0xFF00CCFF),
              ],
              begin: FractionalOffset(1.0, 1.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Text(
              "हिंदी कहानियां जिनमें 1000+ रोचक कहानियां हैं। भगवान के बारे में अद्भुत कहानी, त्यौहार, प्रेरक कहानियां, अकबर-बारबेल, तेनाली रमन कहानियां, पंचतंत्र, कहानी, नैतिक कहानियां, मजेदार/हास्य, प्रेरक, हिंदी उपन्यास/उपन्यास, शैक्षिक, दादी नानी की कहानियां, लोक कथाएं, किस्से कहानियां, कथाएं , पशु, सफलता, जीवन लघु कहानी, अद्भुत और अनोखी कहानियाँ आदि।",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "यह ऐप हमें प्रतिदिन अच्छी कहानियों के साथ बात करता है जिससे हम एक सहयोगी अनुभव के साथ दुनिया को साझा और समृद्ध कर सकते हैं।",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "1000+ मजेदार कहानी कहानी हर तरह की रोमनचक कहानी के लिए एक सर्वश्रेष्ठ ऐप है।",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "ऐप में सभी भारतीय हिंदी कहानियां हैं, ऐप में शामिल हैं ..",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
