import 'package:carton2me/core/routes.dart';
import 'package:carton2me/presentation/screens/auth/Widget/product_details.dart';
import 'package:carton2me/presentation/screens/product_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HouseConnect extends StatelessWidget {
  const HouseConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 250, 242, 242),
          Color.fromARGB(255, 255, 215, 229)
        ])),
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              surfaceTintColor: Colors.white,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                 onTap: (){
                   Navigator.push(context, Routes.createRoute(
                     child: ProductDetailScreen(
                      productDetail: ProductDetail(
                        title: 'House Id',
                        description: 'Description',
                        imageUrl: 'assets/images/img2.png',
                        price: index.toString(),

                      ),
                      
                   ),),);
                 },
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage('assets/images/img2.png'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "House Id",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    Text("01",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "DateTime",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "3:00 PM",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "14-04-2022",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications from a single codebase for any web browser,",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "Meter:- 2.0",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
