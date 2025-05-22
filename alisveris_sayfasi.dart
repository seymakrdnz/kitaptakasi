import 'package:flutter/material.dart';

class AlisverisSayfasi extends StatelessWidget {
  final List<String> sepet; // Sepetteki kitaplar
  final Function(String) kitapCikar; // Sepetten kitap çıkarma fonksiyonu

  AlisverisSayfasi({required this.sepet, required this.kitapCikar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sepetim')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            sepet.isEmpty
                ? Center(child: Text('Sepetiniz boş.'))
                : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: sepet.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(sepet[index]),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => kitapCikar(sepet[index]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Alışverişe Devam Et"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Ödeme sayfasına geçiş (sonra ekleyeceğiz)
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Ödeme sayfasına yönlendiriliyor...',
                                ),
                              ),
                            );
                          },
                          child: Text("Ödemeyi Yap"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade100,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }
}
