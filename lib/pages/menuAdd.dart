import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class menuAdd extends StatefulWidget {
  const menuAdd({super.key});

  @override
  State<menuAdd> createState() => _menuAddState();
}

class _menuAddState extends State<menuAdd> {
  File? selectedImage;
  final nameController = TextEditingController();
  final priceController = TextEditingController();





  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Item",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                pickImageFromGallery();
              },
              child: selectedImage != null
                  ? CircleAvatar(
                      radius: 70,
                      foregroundImage: Image.file(selectedImage!).image,
                    )
                  : const CircleAvatar(
                      radius: 70,
                      child: Icon(
                        Icons.add_photo_alternate,
                        size: 30,
                      ),
                    ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Add Photo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            // Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            //     child:
            //         Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            //       Expanded(
            //         flex: 1,
            //         child: Container(
            //           color: Colors.black,
            //           height: 1.5,
            //           width: 1.5,
            //         ),
            //       ),
            //     ]))
            // const SizedBox(
            //   height: 12,
            // ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: const Divider(
                height: 3,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name of the item"
                ),
                controller: nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Price of the item"
                ),
                controller: priceController,
              ),
            )


          ],
        ),
      ),
    );
  }

  Future pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(returnImage!.path);
    });
  }
}
