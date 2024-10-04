import 'package:flutter/material.dart';

void main() {
  runApp(ProductApp());
}

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class Product {
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

List<Product> products = [
  Product(
    title: 'Smartphone',
    description: 'A smartphone with a 6.1-inch display and 128GB storage.',
    price: 699.99,
    imageUrl: 'https://via.placeholder.com/150',
  ),
  Product(
    title: 'Laptop',
    description: 'A powerful laptop with 16GB RAM and 512GB SSD.',
    price: 1199.99,
    imageUrl: 'https://via.placeholder.com/150',
  ),
  Product(
    title: 'Headphones',
    description: 'Noise-canceling wireless headphones.',
    price: 299.99,
    imageUrl: 'https://via.placeholder.com/150',
  ),
];

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.title),
            subtitle: Text(product.description),
            trailing: Text('\$${product.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl),
            SizedBox(height: 16.0),
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
