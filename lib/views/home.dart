import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tugas_build_wallpaper/data/data.dart';
import 'package:tugas_build_wallpaper/model/categories_model.dart';
import 'package:tugas_build_wallpaper/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<CategoriesModel> categories = [];

void initState() {
  categories = getCategories();
  initState();
}

TextEditingController searchController = new TextEditingController();

ScrollController _scrollController = new ScrollController();

@override
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24),
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ),
                ),
                Icon(Icons.search),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 80,
            child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoriesTile(
                    title: categories[index].categorieName.toString(),
                    imgUrl: categories[index].imgUrl.toString(),
                  );
                }),
          ),
        ],
      )),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrl, title;

  CategoriesTile({required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Container(
          child: Image.network(imgUrl), //Gajelas kwkw
        ),
        Container(
          child: Text(title), // Gejlas
        )
      ]),
    );
  }
}
