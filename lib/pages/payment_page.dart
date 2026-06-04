// ============================
// lib/pages/payment_page.dart
// ============================

import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final int totalHarga;

  const PaymentPage({super.key, required this.totalHarga});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedEWallet = "Gopay";
  String jarakToko = "Mencari lokasi kamu...";
  bool isLoadingJarak = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          jarakToko = "1.2 km dari lokasi kamu";
          isLoadingJarak = false;
        });
      }
    });
  }

  String formatRupiah(int number) {
    String str = number.toString();
    String result = '';
    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      result = str[i] + result;
      count++;
      if (count == 3 && i != 0) {
        result = '.' + result;
        count = 0;
      }
    }
    return 'Rp ' + result;
  }

  void showAllPaymentsBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Semua Metode Pembayaran",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff4e342e)),
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.account_balance_rounded, color: Colors.blue),
                title: const Text("Transfer Bank BCA", style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  setState(() => selectedEWallet = "BCA Transfer");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.wallet_rounded, color: Colors.lightBlue),
                title: const Text("DANA", style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  setState(() => selectedEWallet = "DANA");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Checkout", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'serif')),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xffb59f95),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Pick Up Order",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.star_rounded, color: Colors.amber),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Icon(
                    isLoadingJarak ? Icons.location_searching_rounded : Icons.my_location_rounded,
                    color: isLoadingJarak ? Colors.grey : const Color(0xff6d4c41),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "A BAKERY'S Shop",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xff4e342e)),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          jarakToko,
                          style: TextStyle(
                            fontSize: 12, 
                            color: isLoadingJarak ? Colors.grey : Colors.green.shade700, 
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isLoadingJarak)
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xff6d4c41)),
                    )
                ],
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pembayaran Langsung:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff4e342e)),
                ),
                GestureDetector(
                  onTap: showAllPaymentsBottomSheet,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: Colors.brown.shade50, borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      "lihat semuanya",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.brown),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildEWalletButton("Gopay", "Gopay", Colors.blue.shade600),
                buildEWalletButton("SPay", "Shopee\nPay", Colors.orange.shade700),
                buildEWalletButton("Ovo", "OVO", Colors.purple.shade600),
              ],
            ),
            if (selectedEWallet != "Gopay" && selectedEWallet != "SPay" && selectedEWallet != "Ovo")
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Center(
                  child: Chip(
                    label: Text("Terpilih: $selectedEWallet"),
                    backgroundColor: const Color(0xffb59f95),
                    labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xffe0e0e0),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("🛒  Pesanan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("Total: 3 Item", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54)),
                    ],
                  ),
                  const Divider(color: Colors.black38, height: 25, thickness: 1.2),
                  buildOrderItemRow("1x", "pinkan mambo\ndark chocolatte", "Rp 8.000"),
                  const Divider(color: Colors.black12, height: 20),
                  buildOrderItemRow("1x", "cookies macha red", "Rp 10.000"),
                  const Divider(color: Colors.black12, height: 20),
                  buildOrderItemRow("1x", "croisant\nstrawberries and chocolates", "Rp 15.000"),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Pembayaran:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(
                    formatRupiah(widget.totalHarga),
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffb59f95),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      title: const Center(child: Text("Sukses 🎉", style: TextStyle(fontWeight: FontWeight.bold))),
                      content: Text("Pesanan diproses menggunakan $selectedEWallet. Silakan ambil di toko jika sudah matang!", textAlign: TextAlign.center),
                      actions: [
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffb59f95)),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text("Selesai", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Order Now", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderItemRow(String qty, String name, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(qty, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
          const SizedBox(width: 20),
          Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black87))),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }

  Widget buildEWalletButton(String keyName, String displayName, Color brandColor) {
    bool isSelected = selectedEWallet == keyName;
    return GestureDetector(
      onTap: () { setState(() => selectedEWallet = keyName); },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 80, width: 80, alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? brandColor : Colors.grey.shade300, width: isSelected ? 3 : 1),
        ),
        child: Text(displayName, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isSelected ? brandColor : Colors.black54)),
      ),
    );
  }
}