import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _kayitOl(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.app_registration, size: 80, color: Colors.red),
                const SizedBox(height: 20),
                const Text(
                  'Kayıt Ol',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Ad Soyad',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-Posta',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => _kayitOl(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade300,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text('Kayıt Ol'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Login ekranına dön
                  },
                  child: const Text('Zaten hesabınız var mı? Giriş Yap'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
