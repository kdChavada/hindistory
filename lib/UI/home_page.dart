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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("हिंदी कहानी"),
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
                      Container(
                        height: h * 0.1,
                        width: w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xFF3366FF),
                                Color(0xFF00CCFF),
                              ],
                              begin: FractionalOffset(1.0, 1.0),
                              end: FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              const Image(
                                image: AssetImage(
                                  'assets/images/ganesha.png',
                                ),
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Text(
                                "${dbHelper.homeCategory[v]['REMEDIE_NAME']}",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ],
                          ),
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
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/logo_hindi_story.png'),
            ),

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
                    Container(
                      height: h * 0.1,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xFF3366FF),
                              Color(0xFF00CCFF),
                            ],
                            begin: FractionalOffset(1.0, 1.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Icon(
                                CupertinoIcons.bell,
                                color: Colors.white,
                              )),
                          const SizedBox(
                            width: 17,
                          ),
                          Text(
                            "अधिसूचना",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
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
                                  trackColor: Colors.white,
                                  activeColor: Colors.green,
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
                    Container(
                      height: h * 0.1,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xFF3366FF),
                              Color(0xFF00CCFF),
                            ],
                            begin: FractionalOffset(1.0, 1.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(
                            CupertinoIcons.square_favorites,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "पूछे जाने वाले प्रश्न",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
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
                    Container(
                      height: h * 0.1,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xFF3366FF),
                              Color(0xFF00CCFF),
                            ],
                            begin: FractionalOffset(1.0, 1.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(
                            CupertinoIcons.doc,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "गोपनीयता नीति",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
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
                    Container(
                      height: h * 0.1,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xFF3366FF),
                              Color(0xFF00CCFF),
                            ],
                            begin: FractionalOffset(1.0, 1.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "ऐप के बारे में",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
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
                    Container(
                      height: h * 0.1,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xFF3366FF),
                              Color(0xFF00CCFF),
                            ],
                            begin: FractionalOffset(1.0, 1.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(
                            CupertinoIcons.share,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "साझा करना",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
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
