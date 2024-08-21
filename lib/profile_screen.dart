import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Adınız: John Doe', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text('E-Posta: johndoe@example.com', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Bilgileri düzenleme ekranına yönlendirme
              },
              child: Text('Bilgileri Düzenle'),
            ),
            TextButton(
              onPressed: () {
                // Sipariş geçmişi ekranına yönlendirme
              },
              child: Text('Sipariş Geçmişi'),
            ),
          ],
        ),
      ),
    );
  }
}
