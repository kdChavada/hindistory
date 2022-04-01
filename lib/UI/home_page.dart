import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hindistory/UI/abouthisapp.dart';
import 'package:hindistory/UI/category_view_data.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<bool> isNotification = ValueNotifier(false);

  Future<void> getData() async {
    await dbHelper.databaseGet();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HINDI STORY"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: dbHelper.homeCategory.length,
        itemBuilder: (context, v) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryViewData(
                          nameTitle:

                              "${dbHelper.homeCategory[v]['REMEDIE_NAME']}",

                      id: dbHelper.homeCategory[v]['ID'],
                      )));
              print(dbHelper.homeCategory[v]['ID']);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/Group 1.png',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 24.0,
                        top: 30.0,
                        child: Row(
                          children: [
                            const Image(
                              image: AssetImage('assets/images/ganesha.png'),
                              height: 30,
                              width: 30,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              "${dbHelper.homeCategory[v]['REMEDIE_NAME']}",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/logo_hindi_story.png'),
            ),
            //Like Story
            //
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: Container(
            //     margin: const EdgeInsets.only(left: 10, right: 10),
            //     child: Stack(
            //       children: [
            //         Image.asset(
            //           'assets/images/Group 1.png',
            //           fit: BoxFit.cover,
            //         ),
            //         Positioned(
            //           bottom: 20.0,
            //           child: Row(
            //             children: [
            //               const SizedBox(
            //                 width: 10.0,
            //               ),
            //               const Icon(
            //                 CupertinoIcons.heart,
            //               ),
            //               const SizedBox(
            //                 width: 15.0,
            //               ),
            //               Text(
            //                 "Liked Story",
            //                 style: GoogleFonts.poppins(
            //                   color: Colors.black,
            //                   fontSize: 16.0,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            const SizedBox(
              height: 15.0,
            ),

            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Group 1.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Icon(CupertinoIcons.bell)),
                          const SizedBox(
                            width: 17,
                          ),
                          Text(
                            "Notification",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          ValueListenableBuilder(
                              valueListenable: isNotification,
                              builder: (context, v, c) {
                                return CupertinoSwitch(
                                  activeColor: Colors.blue,
                                  value: isNotification.value,
                                  onChanged: (v) {
                                    isNotification.value = v;
                                    // NotificationService();
                                  },
                                );
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Notification

            const SizedBox(
              height: 10.0,
            ),

            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Group 1.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20.0,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(CupertinoIcons.square_favorites),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "FAQs",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //FAQS

            const SizedBox(
              height: 10.0,
            ),
            //Privacy  Policy
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Group 1.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20.0,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(CupertinoIcons.doc),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Privacy Policy",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 10.0,
            ),
            //About App
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutApp()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Group 1.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20.0,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(Icons.info_outline),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "About App",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 10.0,
            ),
            //Share
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Group 1.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20.0,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(CupertinoIcons.share),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Share",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
