import 'package:flutter/widgets.dart';
import 'package:formation_flutter/model/product.dart';

class InhProWidget extends InheritedWidget {
  const InhProWidget({super.key, required this.produit, required super.child});

  final Product produit;
}
