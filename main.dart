import 'package:flutter/material.dart';
import 'kayitOl.dart';
import 'login.dart';
import 'kategori.dart';
import 'profil.dart';
import 'alisveris_sayfasi.dart';

void main() {
  runApp(KitapTakasApp());
}

class KitapTakasApp extends StatelessWidget {
  const KitapTakasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitap Takası',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red.shade100,
          foregroundColor: Colors.black,
          elevation: 1,
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => HomePage(),
        '/kategoriler': (context) => KategorilerEkrani(),
        '/profil': (context) => ProfilEkrani(),
        '/login': (context) => LoginPage(),
        '/kayıtOl': (context) => RegisterPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> sepet = [];

  void kitapEkle(String kitap) {
    setState(() {
      sepet.add(kitap);
    });
  }

  final List<Map<String, String>> kitaplar = [
    {'isim': 'Kinyas ve Kayra', 'resim': 'resimler/resim1.png'},
    {'isim': 'Değirmen', 'resim': 'resimler/resim2.jpg'},
    {'isim': 'Küçük Prens', 'resim': 'resimler/resim3.jpg'},
    {'isim': 'Zambaklar Ülkesinde', 'resim': 'resimler/resim4.jpg'},
    {'isim': 'Faust', 'resim': 'resimler/resim5.jpg'},
    {'isim': 'Yer Altından Notlar', 'resim': 'resimler/resim6.jpg'},
  ];

  final List<Map<String, String>> yazarlar = [
    {'isim': 'Halide Edip', 'resim': 'resimler/halideEdip.jpg'},
    {'isim': 'Atilla İlhan', 'resim': 'resimler/atillaIlhan.jpg'},
    {'isim': 'Dostoyevski', 'resim': 'resimler/dostoyevski.jpg'},
    {'isim': 'Hakan Günday', 'resim': 'resimler/hakanGünday.jpg'},
    {'isim': 'Tezer Özlü', 'resim': 'resimler/tezerOzlu.jpg'},
    {'isim': 'Sabahattin Ali', 'resim': 'resimler/sabahattinAli.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Kitap Takası'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => AlisverisSayfasi(
                        sepet: sepet,
                        kitapCikar: (String kitap) {
                          setState(() {
                            sepet.remove(kitap);
                          });
                        },
                      ),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red.shade100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white),
                  SizedBox(height: 10),
                  Text('Kitap', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            ListTile(
              title: Text('Ana Sayfa'),
              onTap:
                  () => Navigator.popUntil(context, ModalRoute.withName('/')),
            ),
            ListTile(
              title: Text('Kategoriler'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/kategoriler');
              },
            ),
            ListTile(
              title: Text('Profil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profil');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _aramaKutusu(),
            SizedBox(height: 20),
            _bolumBasligi('En Popüler'),
            _populerKitaplar(),
            SizedBox(height: 20),
            _kitaplarListesi(),
            SizedBox(height: 20),
            _bolumBasligi('Yazarlar'),
            _yazarlarListesi(),
          ],
        ),
      ),
    );
  }

  Widget _aramaKutusu() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Kitap ara...',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _bolumBasligi(String baslik) {
    return Text(
      baslik,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _populerKitaplar() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return _kitapCard(
            kitaplar[index]['isim']!,
            kitaplar[index]['resim']!,
          );
        },
      ),
    );
  }

  Widget _kitaplarListesi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _bolumBasligi('Kitaplar'),
            TextButton(onPressed: () {}, child: Text('Tümünü Listele')),
          ],
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: kitaplar.length,
            itemBuilder: (context, index) {
              String kitap = kitaplar[index]['isim']!;
              String resim = kitaplar[index]['resim']!;
              return Container(
                width: 140,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      child: Image.asset(
                        resim,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(kitap, textAlign: TextAlign.center),
                    ),
                    ElevatedButton(
                      onPressed: () => kitapEkle(kitap),
                      child: Text('Takas Yap'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _yazarlarListesi() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: yazarlar.length,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    yazarlar[index]['resim']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Text(yazarlar[index]['isim']!, textAlign: TextAlign.center),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _kitapCard(String isim, String resimYolu) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              resimYolu,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(isim, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
