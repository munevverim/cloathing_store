import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Paneli'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Ürün Ekle/Düzenle'),
            onTap: () {
              // Ürün ekleme/düzenleme ekranına yönlendirme
            },
          ),
          ListTile(
            title: Text('Siparişleri Yönet'),
            onTap: () {
              // Sipariş yönetimi ekranına yönlendirme
            },
          ),
        ],
      ),
    );
  }
}
