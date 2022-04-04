import 'package:flutter/material.dart';
import 'package:tugas_build_wallpaper/model/wallpaper_model.dart';
import 'package:tugas_build_wallpaper/views/image_view.dart';

Widget brandName() {
  return Center(
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Wallpaper',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black)),
      TextSpan(
          text: 'Hub',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue))
    ])),
  );
}

Widget wallpapersList({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgUrl: wallpaper.src!.portrait!,
                          )));
            },
            child: Hero(
              tag: wallpaper.src!.portrait!,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(wallpaper.src!.portrait!)),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
