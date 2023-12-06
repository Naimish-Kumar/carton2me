import 'package:flutter/material.dart';

class ShowDetailsScreen extends StatelessWidget {
  const ShowDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              child: Card(
                elevation: 5,
                child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/img1.png'),
                    ),
                    title: Text('Item $index'),
                    subtitle: const Text(
                      'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                    }),
              ),
            );
          }),
    ));
  }
}
