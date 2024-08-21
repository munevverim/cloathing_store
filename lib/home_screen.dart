import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothing Store'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Çok Satanlar Bölümü
            SectionTitle(title: "Çok Satanlar"),
            ProductCarousel(products: bestSellerProducts),

            // İndirimdekiler Bölümü
            SectionTitle(title: "İndirimdekiler"),
            ProductCarousel(products: discountProducts),

            // Yeni Gelenler Bölümü
            SectionTitle(title: "Yeni Gelenler"),
            ProductCarousel(products: newProducts),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anasayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Sepet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/cart');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProductCarousel extends StatelessWidget {
  final List<Product> products;

  ProductCarousel({required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.imageUrl, height: 100, width: 100, fit: BoxFit.cover),
          SizedBox(height: 8),
          Text(product.name),
          Text("\$${product.price}", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

// Örnek ürün verileri
List<Product> bestSellerProducts = [
  Product(name: "Elbise", imageUrl: "https://example.com/dress.jpg", price: 50),
  Product(name: "Ceket", imageUrl: "https://example.com/jacket.jpg", price: 100),
];

List<Product> discountProducts = [
  Product(name: "Pantolon", imageUrl: "https://example.com/pants.jpg", price: 30),
  Product(name: "Tişört", imageUrl: "https://example.com/tshirt.jpg", price: 20),
];

List<Product> newProducts = [
  Product(name: "Etek", imageUrl: "https://example.com/skirt.jpg", price: 40),
  Product(name: "Gömlek", imageUrl: "https://example.com/shirt.jpg", price: 60),
];
