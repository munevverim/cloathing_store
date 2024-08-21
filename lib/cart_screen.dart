import 'package:flutter/material.dart';
import 'package:clothing_store/models/product.dart';

class CartScreen extends StatelessWidget {
  final List<Product> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sepetim'),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Sepetiniz boş',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return _buildCartItem(cartItems[index], context);
                    },
                  ),
                ),
                _buildTotalSection(totalPrice, context),
              ],
            ),
    );
  }

  Widget _buildCartItem(Product product, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.network(
          product.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(product.name),
        subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle, color: Colors.red),
          onPressed: () {
            // Ürün sepetten çıkarma işlemi
            // Sepet durumunu güncellemek için state yönetimi (örneğin, setState) veya bir state management çözümü kullanılmalıdır.
          },
        ),
      ),
    );
  }

  Widget _buildTotalSection(double totalPrice, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Toplam Fiyat: \$${totalPrice.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Sipariş tamamlama işlemi
              // Siparişin onaylandığı bir ekran veya işlem sonrası ekranına yönlendirme yapılabilir.
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.black,
            ),
            child: Text(
              'Siparişi Tamamla',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
