import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../main.dart';

class CategoryViewData extends StatefulWidget {
  String? nameTitle;
  int? id;

  CategoryViewData({Key? key, required this.nameTitle, required this.id})
      : super(key: key);

  @override
  State<CategoryViewData> createState() => _CategoryViewDataState();
}

class _CategoryViewDataState extends State<CategoryViewData> {
  List newData = [];
  final String defaultLanguage = 'en-US';
  TextToSpeech tts = TextToSpeech();

  getData() {
    newData = [];
    for (int i = 0; i < dbHelper.category.length; i++) {
      if (dbHelper.category[i]['TYPE_ID'] == widget.id) {
        newData.add(dbHelper.category[i]);
      }
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  void dispose() {
    tts.setVolume(0.0);
    tts.speak("");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("${widget.nameTitle}"),
        ),
        body: ListView.builder(
            itemCount: newData.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, v) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
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
                    child: Column(
                      children: [
                        ExpansionTile(
                          iconColor: Colors.grey[300],
                          title: Text(
                            "${newData[v]['NAME']}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Text(
                                    "${newData[v]['DESCRIPTION']}",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Share.share(
                                            '${newData[v]['DESCRIPTION']}');
                                      },
                                      icon: const Icon(
                                          CupertinoIcons
                                              .arrowshape_turn_up_right_fill,
                                          color: Colors.white,
                                          size: 30),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        tts.speak(
                                            "${newData[v]['DESCRIPTION']}");
                                        //tts.speak("DESCRIPTION");
                                      },
                                      icon: const Icon(CupertinoIcons.speaker_2,
                                          color: Colors.white, size: 30),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Future<void> _copyToClipboard() async {
                                          await Clipboard.setData(ClipboardData(
                                              text:
                                                  '${newData[v]['DESCRIPTION']}'));
                                          _scaffoldKey.currentState!
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text('Copied'),
                                            ),
                                          );
                                        }

                                        _copyToClipboard();
                                      },
                                      icon: const Icon(CupertinoIcons.doc,
                                          color: Colors.white, size: 30),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              );
            }));
  }
}
