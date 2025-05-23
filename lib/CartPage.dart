import 'package:flutter/material.dart';
import 'package:flutter_application_8/OrderSuccessPage.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Sepet ürünleri ve toplam bilgisi burada tutulacak
  // Şimdilik örnek verilerle ilerleyelim
  final List<Map<String, dynamic>> cartItems = [
    {'name': 'Lorem Ipsum', 'price': 1500.00},
    {'name': 'Lorem Ipsum', 'price': 1500.00},
    {'name': 'Lorem Ipsum', 'price': 1500.00},
    {'name': 'Lorem Ipsum', 'price': 1500.00},
    {'name': 'Lorem Ipsum', 'price': 1500.00},
  ];

  double get total => cartItems.fold(0, (sum, item) => sum + item['price']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'SEPETİM',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          '${item['price'].toStringAsFixed(2)}TL', // Fiyatı formatla
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(height: 20, color: Colors.black),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TOPLAM',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${total.toStringAsFixed(2)}TL', // Toplam fiyatı formatla
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent, // Kırmızı renk
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                // Ödeme Başarılı sayfasına git
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderSuccessPage()));
              },
              child: const Text(
                'ÖDEME YAP',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 