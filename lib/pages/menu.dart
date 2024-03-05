import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:queue_buster_store_partner/models/menu.dart';
import 'package:queue_buster_store_partner/widgets/menu_card.dart';
import "package:go_router/go_router.dart";
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:queue_buster_store_partner/constants/route_names.dart';
import 'package:queue_buster_store_partner/service/auth_service.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final supabase = GetIt.I<SupabaseClient>();

  List<Menu> availableMenu = [];
  List<Menu> unavailableMenu = [];

  void fetchMenu() async {
    final int storeId = GetIt.I<AuthService>().currentUser!.userMetadata?["store_id"];
    final items = await supabase.from("items").select().eq("store_id", storeId);

    for(var item in items) {
      final menu = Menu(
        id: item["id"],
        name: item["name"],
        price: double.parse(item["price"].toString()),
        storeId: item["store_id"],
        imageUrl: item["image_url"],
        available: item["available"],
      );

      if(item["available"]) {
        availableMenu.add(menu);
      } else {
        unavailableMenu.add(menu);
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.event_available)),
              Tab(icon: Icon(Icons.event_busy))
            ],
          ),
          title: const Center(
            child: Text('Menu',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: availableMenu.length,
              itemBuilder: (BuildContext context, int index) {
                return MenuCard(
                  name: availableMenu[index].name,
                  price: availableMenu[index].price,
                  imageUrl: availableMenu[index].imageUrl,
                );
              },
            ),
            ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: unavailableMenu.length,
              itemBuilder: (BuildContext context, int index) {
                return MenuCard(
                  name: unavailableMenu[index].name,
                  price: unavailableMenu[index].price,
                  imageUrl: unavailableMenu[index].imageUrl,
                );
              },
            ),
          ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go(RouteNames.menuAdd.path);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
