import 'package:flutter/material.dart';
import 'package:pazar/models/apidatamodel.dart';

import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({
    @required required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.imageAlt.toString(),
        style: const TextStyle(height: 1.5, fontSize: 15),
      ),
    );
  }
}
