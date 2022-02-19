import 'package:flutter/material.dart';
import 'package:hindistory/main.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
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
        title: const Text("STORY"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: dbHelper.category.length,
        itemBuilder: (context, v) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${dbHelper.category[v]['NAME']}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text("${dbHelper.category[v]['DESCRIPTION']}"),
            ],
          );
        },
      ),
    );
  }
}
