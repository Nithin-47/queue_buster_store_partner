import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:queue_buster_store_partner/utils/functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MenuCard extends StatelessWidget {
  final String name;
  final double price;
  final String? imageUrl;

  const MenuCard({
    super.key,
    required this.name,
    required this.price,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(4),
    child: (
      Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: imageUrl != null ? NetworkImage(getPublicUrl(imageUrl!)) : null,
                child: imageUrl == null ? const Icon(Icons.fastfood) : null,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    price.toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ],
          ),
        )
      )
    ),
  );
}