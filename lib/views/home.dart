import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tugas_build_wallpaper/data/data.dart';
import 'package:tugas_build_wallpaper/model/categories_model.dart';
import 'package:tugas_build_wallpaper/widgets/widgets.dart';
import 'package:http/http.dart' as http;

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

class _HomePageState extends State<HomePage> {
  // getTrendingWallpaper() async {
  //   await http.get("https://api.pexels.com/v1/curated?per_page=1",
  //       headers: {"Authorization": apiKEY}).then((value) {
  //     //print(value.body);

  //     Map<String, dynamic> jsonData = jsonDecode(value.body);
  //     jsonData["photos"].forEach((element) {
  //       //print(element);
  //       PhotosModel photosModel = new PhotosModel();
  //       photosModel = PhotosModel.fromMap(element);
  //       photos.add(photosModel);
  //       //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
  //     });

  //     setState(() {});
  //   });
  // }

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
      margin: EdgeInsets.only(right: 4),
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imgUrl,
              height: 50,
              width: 100,
              fit: BoxFit.cover,
            )),
        Container(
          color: Colors.black26,
          height: 50,
          width: 100,
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ), // Gejlas
        )
      ]),
    );
  }
}
