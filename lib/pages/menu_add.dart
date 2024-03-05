import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:queue_buster_store_partner/constants/route_names.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:queue_buster_store_partner/service/auth_service.dart';

class MenuAddPage extends StatefulWidget {
  const MenuAddPage({super.key});

  @override
  State<MenuAddPage> createState() => _MenuAddPageState();
}

class _MenuAddPageState extends State<MenuAddPage> {
  final supabase = GetIt.I<SupabaseClient>();
  final authService = GetIt.I<AuthService>();

  File? selectedImage;
  
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  
  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();

    super.dispose();
  }

  void handleAdd() async {
    try {
      final storeId = authService.currentUser!.userMetadata?["store_id"];
      final String storeName = (await supabase.from("stores").select("name").eq("id", storeId).single())["name"];

      final imagePath = await supabase.storage.from("items").upload(
        "$storeName/${_nameController.text}.jpg",
        selectedImage!,
        fileOptions: const FileOptions(
          cacheControl: "3600",
          upsert: true,
        ),
      );

      await supabase.from("items").insert({
        "name": _nameController.text,
        "price": int.parse(_priceController.text),
        "store_id": storeId,
        "image_url": imagePath,
      });
    } catch(e) {
      debugPrint("ERROR: $e");
    } finally {
      if(mounted) {
        context.go(RouteNames.menu.path);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Item",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
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
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Divider(
                height: 3,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name of the item"
                ),
                controller: _nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Price of the item"
                ),
                controller: _priceController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: handleAdd, child: const Text("Add"))
              ],
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
