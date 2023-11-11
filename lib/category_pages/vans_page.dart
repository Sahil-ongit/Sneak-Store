import 'package:flutter/material.dart';
import 'package:log/components/product_card.dart';
import 'package:log/products/Vans_product/my_product.dart';

class VansPage extends StatelessWidget {
  const VansPage({super.key});

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
                  child: Text("Vans"),
                )),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: VansProduct.Vans.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final allProducts = VansProduct.Vans[index];
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
