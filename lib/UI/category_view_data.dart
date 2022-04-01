import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  getData() {
    newData = [];
    for (int i = 0; i < dbHelper.category.length; i++) {
      if (dbHelper.category[i]['TYPE_ID'] == widget.id) {
        newData.add(dbHelper.category[i]);
        print(newData.length);
      }
    }
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
                     margin: const EdgeInsets.only(left: 16,right: 16),

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
                          title: Text(
                            "${newData[v]['NAME']}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                "${newData[v]['DESCRIPTION']}",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
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
