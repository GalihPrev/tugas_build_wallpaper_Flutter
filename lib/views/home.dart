import 'package:flutter/material.dart';
import 'package:tugas_build_wallpaper/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

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
            decoration: BoxDecoration(color: Color(0xfff5f8fd)),
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Search"),
                  ),
                ),
                Icon(Icons.search),
              ],
            ),
          )
        ],
      )),
    );
  }
}
