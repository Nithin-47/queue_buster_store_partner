import 'package:flutter/material.dart';

/// Flutter code sample for [SearchBar].

void main() => runApp(const SearchBarApp());

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  // bool isDark = false;

  @override
  Widget build(BuildContext context) {
    // final ThemeData themeData = ThemeData(
    //     useMaterial3: true,
    //     brightness: isDark ? Brightness.dark : Brightness.light);

    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  // leading: ,
                  trailing: <Widget>[
                    Tooltip(
                      message: 'Search',
                      child: IconButton(

                        onPressed: () {

                        },
                        icon: const Icon(Icons.search),
                      ),
                    )
                  ],
                );
              },
              suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          }),
        );
  }
}
