import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/modules/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return MaterialApp(
      title: homeController.pageName.value,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true, // Fixe l'appbar en haut de l'écran
              floating: false,
              delegate: _SliverAppBarDelegate(
                minHeight: 100.0, // Hauteur minimale de l'appbar
                maxHeight: 200.0, // Hauteur maximale de l'appbar
                child: AppBar(
                  leading: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  actions: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.greenAccent,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Row(
                        children: [
                          Icon(Icons.message),
                          SizedBox(width: 8),
                          Text('Help'),
                        ],
                      ),
                    ),
                  ],
                  flexibleSpace: Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Jos\'s Pizza',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.front_hand_outlined,
                                size: 50,
                                color: Colors.yellow,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text('Delivred',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      textAlign: TextAlign.left),
                                  Text(
                                    "Tue 11 | ${DateTime.timestamp().hour}:${DateTime.timestamp().minute}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Glovo id: timsx7r91".toUpperCase(),
                                    style: const TextStyle(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      const Center(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Your glovo',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 10, left: 5),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('1 product from Jos\' Pizza',
                                  style: TextStyle(fontSize: 13)))),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('1x ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text('Pizza Campagnarde',
                                      style: TextStyle(fontSize: 15)),
                                  SizedBox(width: 10),
                                  Text('13.590 DT',
                                      style: TextStyle(fontSize: 18))
                                ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 80),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(50),
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(50),
                                        ),
                                      ),
                                      child: const Text('-20%',
                                          style: TextStyle(fontSize: 15))),
                                  const SizedBox(width: 10),
                                  const Text('16.990 DT',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                        decorationThickness: 2.0,
                                      )),
                                ])),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 10, left: 80),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Medium, Pâte fine',
                                  style: TextStyle(fontSize: 13)))),
                    ],
                  );
                },
                childCount: 1, // Nombre d'éléments de la liste
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
