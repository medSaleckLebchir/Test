//import 'dart:developer';

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
            pageHeader(),
            pageBody(context),
          ],
        ),
      ),
    );
  }

  Widget pageHeader() {
    return SliverPersistentHeader(
      pinned: true, // Fixe l'appbar en haut de l'écran
      floating: false,
      delegate: _SliverAppBarDelegate(
        minHeight: 100.0, // Hauteur minimale de l'appbar
        maxHeight: 300.0, // Hauteur maximale de l'appbar
        child: AppBar(
          leading: Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 12, right: 10),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 17,
              color: Colors.black,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                color: Colors.greenAccent,
              ),
              padding: const EdgeInsets.all(5),
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
              margin: const EdgeInsets.all(10),
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
    );
  }

  Widget pageBody(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: [
              firstBodyPart(),
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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(bottom: 5, left: 5),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '1 product from Jos\' Pizza',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.all(5),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1x ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Pizza Campagnarde',
                              style: TextStyle(fontSize: 15)),
                          SizedBox(width: 10),
                          Text('13.590 DT', style: TextStyle(fontSize: 15))
                        ])),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5, right: 15),
                padding: const EdgeInsets.only(bottom: 5, left: 80),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(70),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(70),
                                ),
                              ),
                              child: const Text('-20%',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(width: 10),
                          const Text('16.990 DT',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2.0,
                              )),
                        ])),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  padding: const EdgeInsets.only(bottom: 10, left: 75),
                  child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Medium, Pâte fine',
                          style: TextStyle(fontSize: 13)))),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Delivery',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: screenWidth * 0.1),
                        child: Image.asset(
                          'assets/icon.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const Text('VS5C+92R Tunis, Tunisie',
                          style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.083),
                      height: screenHeight * 0.01,
                      width: screenWidth * 0.005,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.004, left: screenWidth * 0.083),
                      height: screenHeight * 0.01,
                      width: screenWidth * 0.005,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  padding: const EdgeInsets.all(10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.flag,
                            color: Colors.green,
                            size: 35,
                          ),
                          SizedBox(width: screenWidth * 0.1),
                          const Text(
                              'Rue du Lac de Tanganyika hôtel lac\nLéman, 425, 4/425',
                              style: TextStyle(fontSize: 13))
                        ],
                      ))),
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
                  child: Text('Summary',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.all(5),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delevery', style: TextStyle(fontSize: 15)),
                          SizedBox(width: 10),
                          Text('No cost', style: TextStyle(fontSize: 15))
                        ])),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(left: 5, bottom: 10),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Products', style: TextStyle(fontSize: 15)),
                          SizedBox(width: 10),
                          Text('13,590 DT', style: TextStyle(fontSize: 15))
                        ])),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                padding: const EdgeInsets.all(5),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Products',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Text('13,590 DT',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ])),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                padding: const EdgeInsets.all(5),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      Icon(
                        Icons.newspaper_sharp,
                        color: Colors.grey,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Text('Paid with cash',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold))
                    ])),
              ),
            ],
          );
        },
        childCount: 1, // Nombre d'éléments de la liste
      ),
    );
  }

  Widget firstBodyPart() {
    return Container(
      padding: const EdgeInsets.only(top: 40, bottom: 40, left: 15),
      child: Row(children: [
        Image.asset(
          'assets/image.png',
          width: 100,
          height: 100,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Delivred',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.left),
            Text(
              "Tue 11 | ${DateTime.timestamp().hour}:${DateTime.timestamp().minute}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
