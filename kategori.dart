import 'package:flutter/material.dart';



class KitapTakasApp extends StatelessWidget {
  const KitapTakasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitap Takası',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black87)),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/anasayfa': (context) => HomePage(),

        '/kategoriler': (context) => KategorilerEkrani(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Kitap Takası'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red.shade100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://www.example.com/profile.jpg',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kullanıcı Adı',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
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
      body: HomePageContent(),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          // Ana Sayfa İçeriği buraya
        ],
      ),
    );
  }
}

class KategorilerEkrani extends StatelessWidget {
  final List<String> kategoriler = [
    'Roman',
    'Tarih',
    'Bilim',
    'Çocuk',
    'Fantastik',
    'Polisiye',
    'Kişisel Gelişim',
    'Felsefe',
  ];

  KategorilerEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategoriler'),
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://www.example.com/profile.jpg',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kullanıcı Adı',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/anasayfa'); // Ana Sayfa'ya git
              },
            ),
            ListTile(
              title: Text('Kategoriler'),
              onTap: () {
                Navigator.pop(context); // Kategoriler sayfasında kal
              },
            ),
            ListTile(
              title: Text('Profil'),
              onTap: () {
                Navigator.popAndPushNamed(
                  context,
                  '/profil',
                ); // Profil sayfasına git
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children:
              kategoriler.map((kategori) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                KategoriDetaySayfasi(kategori: kategori),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Center(
                      child: Text(kategori, style: TextStyle(fontSize: 18)),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

class KategoriDetaySayfasi extends StatelessWidget {
  final String kategori;

  const KategoriDetaySayfasi({super.key, required this.kategori});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$kategori Kitapları')),
      body: Center(
        child: Text('$kategori kategorisindeki kitaplar burada gösterilecek.'),
      ),
    );
  }
}
