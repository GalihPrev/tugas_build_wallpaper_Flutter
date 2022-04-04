import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tugas_build_wallpaper/data/data.dart';
import 'package:tugas_build_wallpaper/model/wallpaper_model.dart';
import 'package:tugas_build_wallpaper/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String? searchQuery;
  Search({required this.searchQuery});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = new TextEditingController();
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
    getSearcgWallpaper(widget.searchQuery!);
    super.initState();
    _searchController.text = widget.searchQuery!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      controller: _searchController,
                      decoration: InputDecoration(
                          hintText: "Search", border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                      onTap: (() {
                        getSearcgWallpaper(_searchController.text);
                      }),
                      child: Container(child: Icon(Icons.search))),
                ],
              ),
            ),
            SizedBox(height: 16),
            wallpapersList(wallpapers: wallpapres, context: context),
          ],
        )),
      ),
    );
  }
}
