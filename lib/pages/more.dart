import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:queue_buster_store_partner/service/auth_service.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  final authService = GetIt.I<AuthService>();

  File? selectedImage;
  bool light = true;
  final storeNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
          "Store Photo",
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
                border: OutlineInputBorder(), labelText: "Name of the store"),
            controller: storeNameController,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: Card(
            shape: RoundedRectangleBorder(
              // borderRadius: BorderRadius.circular(40), // if you need this
              side: BorderSide(
                color: Colors.grey.withOpacity(1),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Online/Offline',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  ),),
              Switch(
                // This bool value toggles the switch.
                value: light,
                activeColor: Colors.lightBlue,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    light = value;
                  });
                },
              ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        ElevatedButton(onPressed: () {
          authService.logout();
        }, child: Text("SignOut",
        style: TextStyle(
          fontSize: 16
        ),))
      ])),
    ));
  }

  Future pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(returnImage!.path);
    });
  }
}
