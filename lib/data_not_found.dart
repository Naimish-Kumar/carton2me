import 'package:flutter/material.dart';

class DataNotFound extends StatelessWidget {
  const DataNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        //  decoration: const BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   Color.fromARGB(255, 250, 242, 242),
        //   Color.fromARGB(255, 255, 215, 229)
        // ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/data_not_found.png', height: 400),
            const Center(
              child: Text(
                'Data Not Found',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
