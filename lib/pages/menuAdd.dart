
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class menuAdd extends StatefulWidget {
  const menuAdd({super.key});

  @override
  State<menuAdd> createState() => _menuAddState();
}

class _menuAddState extends State<menuAdd> {

  File ? selectedImage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Item",style: TextStyle(''),),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                pickImageFromGallery();

              },
              child: selectedImage != null ? CircleAvatar(radius: 70, foregroundImage: Image.file(selectedImage!).image,)  : CircleAvatar(
                child: Icon(Icons.add_photo_alternate,size: 30,),
                radius: 70,
              ),
            ),
            Text("Add Photo")
          ],
        ),
      ),

    );
  }


  Future pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(returnImage!.path);
    });

  }




}



