import 'package:carton2me/presentation/screens/auth/Widget/product_details.dart';
import 'package:carton2me/presentation/screens/auth/Widget/submit_button.dart';

import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetail productDetail;
  ProductDetailScreen({
    super.key,
    required this.productDetail,
  });

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item ${widget.productDetail.price.toString()}',
          style: const TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      widget.productDetail.imageUrl.toString(),
                      height: 250,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Select your favorite social network and share our icons with your contacts or friends.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.productDetail.description.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Select your favorite social network and share our icons with your contacts or friends. If you don’t have these social networks, simply copy the link and paste it in the one you use. For moreSelect your favorite social network and share our icons with your contacts or friends. Select your favorite social network and share our icons with your contacts or friends.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 60,),
                    Center(
                      child: SubmitButton(
                        onPressed: () {},
                        text: 'Submit',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
