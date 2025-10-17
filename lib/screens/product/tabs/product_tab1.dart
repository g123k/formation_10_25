import 'package:flutter/material.dart';

class ProductTab1 extends StatefulWidget {
  const ProductTab1({super.key});

  @override
  State<ProductTab1> createState() => _ProductTab1State();
}

class _ProductTab1State extends State<ProductTab1> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(child: InkWell(
      onTap: () => setState(() => counter++),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(8.0),
        child: Text(counter.toString()),
      ),
    ));
  }
}
