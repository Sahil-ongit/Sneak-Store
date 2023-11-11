import 'package:flutter/material.dart';
import 'package:log/products/Nike_product/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey.withOpacity(0.3)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 110,
              width: 130,
              child: Image.asset(
                widget.product.image,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              widget.product.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('\₹''${widget.product.price}')
          ],
        ),
      ),
    );
  }
}
