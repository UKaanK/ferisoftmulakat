import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_8/CartPage.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<dynamic> products = []; // Ürünleri tutacak liste
  bool isLoading = true; // Yüklenme durumu
  String? error; // Hata mesajı

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Sayfa yüklendiğinde ürünleri çek
  }

  Future<void> fetchProducts() async {
    final url = Uri.parse('http://flutter.kodps.com/api/get-products');
    final token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIwMTk2ZjI2Yy1jZjg2LTczYjgtOWEwMS0xMWUzMWI2YTlkZWMiLCJqdGkiOiJmMjMxOTM4OTYyMGQ5ZDZmZTY3MzQzYTliNzExMjMxM2Q5MDRiOGM2NGNhNTExMjYzYTFlN2U0NDQ0YmIzYWE5ODhlNTYxY2EwOWMyYzIzNyIsImlhdCI6MTc0NzgyNDA0OS4wNTA3NTYsIm5iZiI6MTc0NzgyNDA0OS4wNTA3NTgsImV4cCI6MTc3OTM2MDA0OS4wMzU4Miwic3ViIjoiNCIsInNjb3BlcyI6W119.JKOyIMFG64GPMP9mFdGo_NJyrO_spXwNDV14l-RRWTei9s9D5zKV32Vn_dmxqF_bjynyUTN5-Yw2Uv2QxMr53jZkyCQ16n7YdhytklZTSg2lwVr6gvyyEXS2CTrIQXfI9OWUK_yVbnt-Tt52tubMpfG9KU5YKb379q-jy42XuaRC9M1Qof6FNPBpFBSeioDIhR056dfO8HjE99-DnK9agLeUcX5uAzX3nkU5zMExhfOcMg-sXL4DRrFqzsF8kj-Bf5ixvdWQbIa4rR1GSRQi1lK9iMx0nYfYU8uzGZMTvjccjaMe2vGLqQKmFt164_Pmnn-4W72vlt4rXc8XjMKCkkRpYELPfi6vieuhR2sFvfUF9MbN7_LNoep-d6MMBeIBZnx2ape8-XNdAhAdjhbM1qEYtruKsfLFKhdpwKq1LBr_IxXwTNVzEV2H9FsAipWdP2qfKMTyUQCZdZjcuKzAlYxO6LalejaU3x8_2xV6z3li8aLlJfUQiM--OWNPH9_dcYBnu5Dm3cDmVc06dzXeFu4o-BJJjbbq8HUPb_xToniM6RX5RHw0tvKJJUgx4XChjM_cFMR4filtI7o6qJamnagq3eXZwPGmWuh01VKnFhcGPwl3ZQN52X3pXztwM_5PzDslnDkOZMkuZS7Oz6n6aNrJatUiBuScrXc9D7upwQw'; // Sağlanan bearer token

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Başarılı yanıt - Doğrudan listeyi kullan
        final List<dynamic> productList = json.decode(response.body);
        setState(() {
          products = productList;
          isLoading = false;
        });
      } else {
        // Hata durumu
        setState(() {
          error = 'Ürünler yüklenirken hata oluştu: ${response.statusCode}';
          isLoading = false;
        });
        print('API Hatası: ${response.statusCode}');
        print('Yanıt: ${response.body}');
      }
    } catch (e) {
      // İstek sırasında hata oluştu
      setState(() {
        error = 'Bağlantı hatası: ${e.toString()}';
        isLoading = false;
      });
      print('İstek Hatası: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text('Hata: $error'))
              : ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Ürün Resmi (Placeholder)
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[300],
                              child: const Center(child: Text('150x150')),
                            ),
                            const SizedBox(width: 10),
                            // Ürün Bilgileri
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['product_name'] ?? 'Lorem Ipsum',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    product['product_description'] ?? 'Lorem Ipsum is simply dummy text...',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '${product['product_price']?.toStringAsFixed(2) ?? '1.500,00'}TL',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Sepete Ekle butonu
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey[800],
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                      onPressed: () {
                                        print('Sepete eklendi: ${product['product_name']}');
                                      },
                                      child: const Text(
                                        'Sepete Ekle',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
} 