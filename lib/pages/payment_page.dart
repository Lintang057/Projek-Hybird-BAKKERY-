import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import 'qr_page.dart';

class PaymentPage extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const PaymentPage({
    super.key,
    required this.items,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPayment = "";

  Widget buildPaymentOption(String title, IconData icon, Color color) {
    bool isSelected = selectedPayment == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = title;
        });

        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Dipilih: $title")),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.pink : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.pink),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int total = 0;

    for (var item in widget.items) {
      total += (item["price"] as num).toInt() *
          (item["qty"] as num).toInt();
    }
    @override
    Widget _sectionTitle(String title) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      );
    }
    Widget paymentItem(String id, String title, IconData icon, Color color) {
      bool isSelected = selectedPayment == id;

      return GestureDetector(
        onTap: () {
          setState(() {
            selectedPayment = id;
          });
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green.shade100 : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey,
                  width: 2,
                ),
              ),
              child: Icon(
                icon,
                size: 40,
                color: isSelected ? Colors.green : color,
              ),
            ),
            const SizedBox(height: 5),
            Text(title),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              // 🔙 BACK ICON
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // PICK UP ORDER
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 73, 116),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "Pick Up Order - Ambil di Toko",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // INFO TOKO
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "A BAKKERY'S \n📍 Jarak ± 1,2 km\n🟢 Siap diambil setelah pesanan selesai",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // METODE PEMBAYARAN
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedPayment.isEmpty
                        ? "Metode Pembayaran: (belum dipilih)"
                        : "Metode: $selectedPayment",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return DraggableScrollableSheet(
                            expand: false,
                            initialChildSize: 0.7,
                            minChildSize: 0.5,
                            maxChildSize: 0.9,
                            builder: (context, scrollController) {
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: ListView(
                                  controller: scrollController,
                                  children: [

                                    const Center(
                                      child: Text(
                                        "Pilih Metode Pembayaran",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 20),

                                    _sectionTitle("E-Wallet"),
                                    buildPaymentOption("GoPay", Icons.account_balance_wallet, Colors.green),
                                    buildPaymentOption("ShopeePay", Icons.payment, Colors.orange),
                                    buildPaymentOption("OVO", Icons.account_balance, Colors.purple),
                                    buildPaymentOption("DANA", Icons.account_balance_wallet, Colors.blue),
                                    buildPaymentOption("LinkAja", Icons.account_balance_wallet, Colors.red),

                                    const SizedBox(height: 20),

                                    _sectionTitle("Bank Transfer"),
                                    buildPaymentOption("BCA", Icons.account_balance, Colors.blue),
                                    buildPaymentOption("BRI", Icons.account_balance, Colors.blue),
                                    buildPaymentOption("BNI", Icons.account_balance, Colors.orange),
                                    buildPaymentOption("Mandiri", Icons.account_balance, Colors.yellow),

                                    const SizedBox(height: 20),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: const Text(
                      "lihat semuanya",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // QUICK PAYMENT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  paymentItem("gopay", "Gopay",
                      Icons.account_balance_wallet, Colors.blue),
                  paymentItem("shopee", "ShopeePay",
                      Icons.payment, Colors.orange),
                  paymentItem("ovo", "OVO",
                      Icons.account_balance, Colors.purple),
                ],
              ),

              const SizedBox(height: 20),

              // LIST + TOTAL (BIAR BISA SCROLL)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      // LIST PESANAN
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.shopping_cart),
                                Text("Total ${widget.items.length} item"),
                              ],
                            ),
                            const Divider(color: Colors.black),
                            ...widget.items.map(
                              (item) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${item['qty']}x ${item['name']}",
                                      ),
                                    ),
                                    Text(
                                      "Rp.${(item['price'] as num) *
                                          (item['qty'] as num)}",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // TOTAL
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Rp.$total",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // ORDER BUTTON (SUDAH FIX)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: () async {
                    if (selectedPayment.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Pilih metode pembayaran dulu")),
                      );
                      return;
                    }

                    for (var item in widget.items) {
                      await DatabaseHelper.instance.insertHistory({
                        "productName": item["name"],
                        "price": item["price"].toString(),
                        "image": item["emoji"],
                        "orderDate": DateTime.now().toString(),
                      });
                    }
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Pesanan berhasil disimpan")),
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QRPage(
                          items: widget.items,
                          paymentMethod: selectedPayment,
                          total: total,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "ORDER NOW",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}