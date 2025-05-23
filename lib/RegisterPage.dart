import 'package:flutter/material.dart';
import 'package:flutter_application_8/LoginPage.dart'; // LoginPage import'ını ekle

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Arka plan rengini beyaz yap
      body: Center( // İçeriği ortala
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0), // Kenar boşlukları
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Dikeyde ortala
            crossAxisAlignment: CrossAxisAlignment.stretch, // Yatayda genişlet
            children: [
              // FERISOFT logosu
              Image.network(
                'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIwMTk2ZjI2Yy1jZjg2LTczYjgtOWEwMS0xMWUzMWI2YTlkZWMiLCJqdGkiOiJmMjMxOTM4OTYyMGQ5ZDZmZTY3MzQzYTliNzExMjMxM2Q5MDRiOGM2NGNhNTExMjYzYTFlN2U0NDQ0YmIzYWE5ODhlNTYxY2EwOWMyYzIzNyIsImlhdCI6MTc0NzgyNDA0OS4wNTA3NTYsIm5iZiI6MTc0NzgyNDA0OS4wNTA3NTgsImV4cCI6MTc3OTM2MDA0OS4wMzU4Miwic3ViIjoiNCIsInNjb3BlcyI6W119.JKOyIMFG64GPMP9mFdGo_NJyrO_spXwNDV14l-RRWTei9s9D5zKV32Vn_dmxqF_bjynyUTN5-Yw2Uv2QxMr53jZkyCQ16n7YdhytklZTSg2lwVr6gvyyEXS2CTrIQXfI9OWUK_yVbnt-Tt52tubMpfG9KU5YKb379q-jy42XuaRC9M1Qof6FNPBpFBSeioDIhR056dfO8HjE99-DnK9agLeUcX5uAzX3nkU5zMExhfOcMg-sXL4DRrFqzsF8kj-Bf5ixvdWQbIa4rR1GSRQi1lK9iMx0nYfYU8uzGZMTvjccjaMe2vGLqQKmFt164_Pmnn-4W72vlt4rXc8XjMKCkkRpYELPfi6vieuhR2sFvfUF9MbN7_LNoep-d6MMBeIBZnx2ape8-XNdAhAdjhbM1qEYtruKsfLFKhdpwKq1LBr_IxXwTNVzEV2H9FsAipWdP2qfKMTyUQCZdZjcuKzAlYxO6LalejaU3x8_2xV6z3li8aLlJfUQiM--OWNPH9_dcYBnu5Dm3cDmVc06dzXeFu4o-BJJjbbq8HUPb_xToniM6RX5RHw0tvKJJUgx4XChjM_cFMR4filtI7o6qJamnagq3eXZwPGmWuh01VKnFhcGPwl3ZQN52X3pXztwM_5PzDslnDkOZMkuZS7Oz6n6aNrJatUiBuScrXc9D7upwQw', // Geçici logo URL'si, gerçek URL ile değiştirilebilir
                height: 50,
              ),
              const SizedBox(height: 40),
              // Başlık metni
              const Text(
                'Alışveriş yapmaya başlamak için lütfen kayıt yapınız.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              // Ad Soyad alanı
              const Text('Ad Soyad'),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Emirhan Ertürk',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none, // Kenarlığı kaldır
                  ),
                  filled: true, // Arka planı doldur
                  fillColor: Colors.grey[200], // Gri arka plan
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                ),
              ),
              const SizedBox(height: 20),
              // E-posta alanı
              const Text('E-Posta Adresi'),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'example@ferisoft.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                   contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                ),
              ),
              const SizedBox(height: 20),
              // Şifre alanı
              const Text('Şifre'),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: '********',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                   contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              // KAYIT OL butonu
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[800], // Koyu lacivert renk
                   padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  // Kayıt olma işlemleri buraya gelecek
                },
                child: const Text(
                  'KAYIT OL',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              // Zaten hesap var mı metni
              const Text(
                'Hesabınız var mı?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 5),
              // GİRİŞ YAP butonu
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent, // Kırmızı renk
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // Giriş sayfasına geri dön
                },
                child: const Text(
                  'GİRİŞ YAP',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
