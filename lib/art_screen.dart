import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'colors.dart';

class ArtsScreen extends StatefulWidget {
  const ArtsScreen({Key? key}) : super(key: key);

  @override
  State<ArtsScreen> createState() => _ArtsScreenState();
}

class _ArtsScreenState extends State<ArtsScreen> {
  List imgList = [];

  getImages() async {
    final directory = await getExternalStorageDirectory();
    final aiImageDirectory = Directory("${directory?.path}/AI Image");

    if (await aiImageDirectory.exists()) {
      imgList = aiImageDirectory.listSync();
      print(imgList);
    } else {
      print("Directory does not exist");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();
  }

  popImage(filepath) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.file(
                  filepath,
                  fit: BoxFit.cover,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Art Gallery",
          style: TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 300),
              itemCount: imgList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      popImage(imgList[index]);
                    },
                    child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        // child: Image.file(
                        //   imgList[index],
                        //   fit: BoxFit.cover,
                        // ),
                        child: Image.file(
                          File(imgList[index].path),
                          fit: BoxFit.cover,
                        )));
              })),
    );
  }
}
