import 'package:flutter/material.dart';
import 'package:log/components/product_card.dart';
import 'package:log/products/Nike_product/my_product.dart';

class NikePage extends StatelessWidget {
  const NikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => Navigator.popAndPushNamed(context, 'cartpage'),
          child: Icon(Icons.shopping_bag_outlined)),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Text("Nike"),
                )),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: NikeProduct.Nike.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final allProducts = NikeProduct.Nike[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detailspage'),
              child: ProductCard(
            product: allProducts,
          ));
        },
      ),
    );
  }
}
