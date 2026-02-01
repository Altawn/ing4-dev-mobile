import 'package:flutter/material.dart';
import 'package:formation_flutter/l10n/app_localizations.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/res/app_colors.dart';
import 'package:formation_flutter/res/app_icons.dart';
import 'package:formation_flutter/res/app_theme_extension.dart';
import 'package:formation_flutter/model/inheritedWidget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  // ignore: constant_identifier_names
  static const double IMAGE_HEIGHT = 300.0;

  @override
  Widget build(BuildContext context) {
    return InhProWidget(
      produit: generateProduct(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SizedBox.expand(
              child: Stack(
                children: [
                  PositionedDirectional(
                    top: 0.0,
                    start: 0.0,
                    end: 0.0,
                    height: IMAGE_HEIGHT,
                    child: Image.network(
                      InhProWidget.of(context).produit.picture ?? '',
                      fit: BoxFit.cover,
                      cacheHeight:
                          (IMAGE_HEIGHT *
                                  MediaQuery.devicePixelRatioOf(context))
                              .toInt(),
                    ),
                  ),
                  PositionedDirectional(
                    top: IMAGE_HEIGHT - 16.0,
                    start: 0.0,
                    end: 0.0,
                    bottom: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.0),
                        ),
                        color: Colors.white,
                      ),
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 20.0,
                        vertical: 30.0,
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            InhProWidget.of(context).produit.name ?? '',
                            style: context.theme.title1,
                          ),
                          Text(
                            InhProWidget.of(
                                  context,
                                ).produit.brands?.join(', ') ??
                                '',
                            style: context.theme.title2,
                          ),
                          Scores(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Scores extends StatelessWidget {
  const Scores({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: .start,
            children: [
              Expanded(flex: 44, child: const _Nutriscore()),
              VerticalDivider(),
              Expanded(flex: 56, child: const _NovaGroup()),
            ],
          ),
        ),
        Divider(),
        const _GreenScore(),
      ],
    );
  }
}

class _Nutriscore extends StatelessWidget {
  const _Nutriscore();

  @override
  Widget build(BuildContext context) {
    final nutriscore =
        InhProWidget.of(context).produit.nutriScore ??
        ProductNutriScore.unknown;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.nutriscore,
          style: context.theme.title3,
        ),
        const SizedBox(height: 5.0),
        Image.asset(_findAssetName(nutriscore), height: 42.0),
      ],
    );
  }

  String _findAssetName(ProductNutriScore nutriscore) {
    return switch (nutriscore) {
      ProductNutriScore.A => 'res/drawables/nutriscore_a.png',
      ProductNutriScore.B => 'res/drawables/nutriscore_b.png',
      ProductNutriScore.C => 'res/drawables/nutriscore_c.png',
      ProductNutriScore.D => 'res/drawables/nutriscore_d.png',
      ProductNutriScore.E => 'res/drawables/nutriscore_e.png',
      ProductNutriScore.unknown => 'TODO',
    };
  }
}

class _NovaGroup extends StatelessWidget {
  const _NovaGroup();

  @override
  Widget build(BuildContext context) {
    final novaScore =
        InhProWidget.of(context).produit.novaScore ?? ProductNovaScore.unknown;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.nova_group,
          style: context.theme.title3,
        ),
        const SizedBox(height: 5.0),
        Text(
          _findLabel(novaScore),
          style: const TextStyle(color: AppColors.grey2),
        ),
      ],
    );
  }

  String _findLabel(ProductNovaScore novaScore) {
    return switch (novaScore) {
      ProductNovaScore.group1 =>
        'Aliments non transformés ou transformés minimalement',
      ProductNovaScore.group2 => 'Ingrédients culinaires transformés',
      ProductNovaScore.group3 => 'Aliments transformés',
      ProductNovaScore.group4 =>
        'Produits alimentaires et boissons ultra-transformés',
      ProductNovaScore.unknown => 'Score non calculé',
    };
  }
}

class _GreenScore extends StatelessWidget {
  const _GreenScore();

  @override
  Widget build(BuildContext context) {
    final greenScore =
        InhProWidget.of(context).produit.greenScore ??
        ProductGreenScore.unknown;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.greenscore,
          style: context.theme.title3,
        ),
        const SizedBox(height: 5.0),
        Row(
          children: <Widget>[
            Icon(_findIcon(greenScore), color: _findIconColor(greenScore)),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                _findLabel(greenScore),
                style: const TextStyle(color: AppColors.grey2),
              ),
            ),
          ],
        ),
      ],
    );
  }

  IconData _findIcon(ProductGreenScore greenScore) {
    return switch (greenScore) {
      ProductGreenScore.APlus => AppIcons.ecoscore_a_plus,
      ProductGreenScore.A => AppIcons.ecoscore_a,
      ProductGreenScore.B => AppIcons.ecoscore_b,
      ProductGreenScore.C => AppIcons.ecoscore_c,
      ProductGreenScore.D => AppIcons.ecoscore_d,
      ProductGreenScore.E => AppIcons.ecoscore_e,
      ProductGreenScore.F => AppIcons.ecoscore_f,
      ProductGreenScore.unknown => AppIcons.ecoscore_e,
    };
  }

  Color _findIconColor(ProductGreenScore greenScore) {
    return switch (greenScore) {
      ProductGreenScore.APlus => AppColors.greenScoreAPlus,
      ProductGreenScore.A => AppColors.greenScoreA,
      ProductGreenScore.B => AppColors.greenScoreB,
      ProductGreenScore.C => AppColors.greenScoreC,
      ProductGreenScore.D => AppColors.greenScoreD,
      ProductGreenScore.E => AppColors.greenScoreE,
      ProductGreenScore.F => AppColors.greenScoreF,
      ProductGreenScore.unknown => Colors.transparent,
    };
  }

  String _findLabel(ProductGreenScore greenScore) {
    return switch (greenScore) {
      ProductGreenScore.APlus => 'Très faible impact environnemental',
      ProductGreenScore.A => 'Très faible impact environnemental',
      ProductGreenScore.B => 'Faible impact environnemental',
      ProductGreenScore.C => "Impact modéré sur l'environnement",
      ProductGreenScore.D => 'Impact environnemental élevé',
      ProductGreenScore.E => 'Impact environnemental très élevé',
      ProductGreenScore.F => 'Impact environnemental très élevé',
      ProductGreenScore.unknown => 'Score non calculé',
    };
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
