// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:go_router/go_router.dart';
// import 'package:queue_buster_store_partner/constants/route_names.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// class CheckSession extends StatefulWidget {
//   const CheckSession({super.key});
//
//   @override
//   State<CheckSession> createState() => _CheckSessionState();
// }
//
// class _CheckSessionState extends State<CheckSession> {
//   final supabase = GetIt.I<SupabaseClient>();
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: supabase.auth.onAuthStateChange,
//       builder: (context, snapshot) {
//         if(snapshot.data?.session == null) {
//           context.go(RouteNames.authLogin.path);
//         }
//
//         context.go(RouteNames.home.path);
//
//         return null;
//       }
//     );
//   }
// }
