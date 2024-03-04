import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:queue_buster_store_partner/service/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import "package:queue_buster_store_partner/router.dart"
    show goRouter;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
      url: "https://iqkgaxhigqltsmxtkcsk.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlxa2dheGhpZ3FsdHNteHRrY3NrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY1NTQ0OTYsImV4cCI6MjAyMjEzMDQ5Nn0.5oj8Ss2Oa8qXzzba_E2zo0b7TjAumij2ESL5eiq-tyo",
  );

  GetIt.I.registerSingleton<SupabaseClient>(Supabase.instance.client);
  GetIt.I.registerSingleton(AuthService());

  runApp(
    MaterialApp.router(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      routerConfig: goRouter,
    )
  );
}