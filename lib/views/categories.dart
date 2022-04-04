import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tugas_build_wallpaper/data/data.dart';
import 'package:tugas_build_wallpaper/model/wallpaper_model.dart';

import 'package:http/http.dart' as http;
import 'package:tugas_build_wallpaper/widgets/widgets.dart';

class Categorie extends StatefulWidget {
  final String? categorieName;
  Categorie({required this.categorieName});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpaperModel> wallpapres = [];

  getSearcgWallpaper(String query) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=15&page=1"),
        headers: {"Authorization": apiKEY}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        WallpaperModel wallpaperModel = new WallpaperModel();
        wallpaperModel = WallpaperModel.fromMap(element);
        wallpapres.add(wallpaperModel);
      });

      setState(() {});
    });
  }

  @override
  void initState() {
    getSearcgWallpaper(widget.categorieName!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            
            SizedBox(
              height: 16,
            ),
            wallpapersList(wallpapers: wallpapres, context: context),
          ],
        )),
      ),
    );
  }
}
