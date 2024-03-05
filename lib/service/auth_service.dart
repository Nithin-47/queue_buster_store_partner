import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:queue_buster_store_partner/constants/route_names.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = GetIt.I<SupabaseClient>();

  User? get currentUser => supabase.auth.currentUser;

  void logout() {
    supabase.auth.signOut();
  }

  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String storeName,
    File? storeImage,
    required BuildContext context,
  }) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) =>
          const Dialog(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Signing up...")
                ],
              ),
            ),
          ));

    final Map<String, dynamic> storeData = await supabase.from("stores").insert({
        "name": storeName,
      }).select().single();

      final authRes = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          "first_name": firstName,
          "last_name": lastName,
          "store_id": storeData["id"],
        }
      );

      final User? user = authRes.user;

      if(user == null) {
        throw Exception("User is null");
      }

      if(context.mounted) {
        context.go(RouteNames.authLogin.path);
      }

    } catch (e) {
      debugPrint("Error: $e");
      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Signup failed")));
      }
    } finally {
      if(context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const Dialog(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Checking Credentials...")
                ],
              ),
            ),
          ));

      final AuthResponse res = await supabase.auth.signInWithPassword(
          email: email,
          password: password
      );

      final User? user = res.user;

      if(user == null) {
        throw Exception("User is null");
      }

      if(context.mounted) {
        context.go(RouteNames.home.path);
      }
    } catch(e) {
      debugPrint("Error: $e");
      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login failed")));
      }
    } finally {
      if(context.mounted) {
        Navigator.pop(context);
      }
    }
  }
}