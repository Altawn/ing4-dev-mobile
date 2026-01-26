import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PositionedDirectional(
            top: 0.0,
            start: 0.0,
            end: 0.0,
            height: 300.0,
            child: _ProductPicture(),
          ),
          const PositionedDirectional(
            top: 260.0,
            start: 0.0,
            end: 0.0,
            bottom: 0.0,
            child: _ProductDetails(),
          ),
        ],
      ),
    );
  }
}

class _ProductPicture extends StatelessWidget {
  const _ProductPicture();

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=1310&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) =>
          const Center(child: Icon(Icons.error)),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: const SingleChildScrollView(
        child: Column(children: [_ProductData()]),
      ),
    );
  }
}

class _ProductData extends StatelessWidget {
  const _ProductData();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _ProductInfo('Quantité', '200g'),
        _ProductInfo('Vendu', 'France', showSeparator: false),
      ],
    );
  }
}

class _ProductInfo extends StatelessWidget {
  final String label;
  final String value;
  final bool showSeparator;

  const _ProductInfo(
    this.label,
    this.value, {
    super.key,
    this.showSeparator = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.only(bottom: 12.0),
      decoration: showSeparator
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF080040),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

/// Faire ici boutons Végétalien & Végétarien
class _ProductButtons extends StatelessWidget {
  const _ProductButtons();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
