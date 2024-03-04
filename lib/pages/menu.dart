import 'package:flutter/material.dart';
import 'package:queue_buster_store_partner/widgets/switch.dart';
import "package:go_router/go_router.dart";

import '../constants/route_names.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Column(
    //     children: [
    //       const Center(
    //         child: Text(
    //           "MENU",
    //           style: TextStyle(
    //             fontSize: 20,
    //             fontWeight: FontWeight.w300,
    //           ),
    //         ),
    //       ),
    //       Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
    //           child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    //             Expanded(
    //               flex: 1,
    //               child: Container(
    //                 color: Colors.black,
    //                 height: 1.5,
    //                 width: 1.5,
    //               ),
    //             ),
    //           ]))
    //     ],
    //   ),
    //
    // );
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
            child: Text('MENU',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                bool light = true;

                return SizedBox(
                  height: 150,
                  child: Card(
                      elevation: 2,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("assets/login.svg"),
                            radius: 40,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "HEllo",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'price',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                          // const SizedBox(
                          //   width: 80,
                          // ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Available"),
                              TextButton(onPressed: () {}, child: Icon(Icons.close)),
                            ],
                          )
                        ],
                      )),
                );
              },
            ),
            ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                bool light = true;

                return SizedBox(
                  height: 150,
                  child: Card(
                      elevation: 2,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("assets/login.svg"),
                            radius: 40,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "HEllo",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'price',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                          // const SizedBox(
                          //   width: 80,
                          // ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Available"),
                              TextButton(onPressed: () {}, child: Icon(Icons.done)),
                            ],
                          )
                        ],
                      )),
                );
              },
            ),
          ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(RouteNames.menuAdd.path);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
