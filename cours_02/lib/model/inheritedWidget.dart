import 'package:flutter/widgets.dart';
import 'package:formation_flutter/model/product.dart';

class InhProWidget extends InheritedWidget {
  const InhProWidget({super.key, required this.produit, required Widget child})
    : super(child: child);

  final Product produit;

  static InhProWidget of(BuildContext context) {
    final InhProWidget? result = context
        .dependOnInheritedWidgetOfExactType<InhProWidget>();
    assert(result != null, 'No InhProWidget found in the context');
    return result!;
  }

  @override
  bool updateShouldNotify(InhProWidget old) {
    return produit != old.produit;
  }
}
