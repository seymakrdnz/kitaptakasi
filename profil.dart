import 'package:flutter/material.dart';

class ProfilEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profilim'),
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 20),
            Text(
              'Kullanıcı Adı',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('ornek@mail.com', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Takas Geçmişi'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favori Kitaplar'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Çıkış Yap', style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
