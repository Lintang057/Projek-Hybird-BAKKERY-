import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List products = [
<<<<<<< HEAD

      {
        "name": "Donat Pinkan Mambo",
        "price": "Rp 9.000",
        "image": "🍩",
      },

      {
        "name": "French Toast Delight",
        "price": "Rp 8.000",
        "image": "🍞",
      },

      {
        "name": "The Cowboy Cookie",
        "price": "Rp 10.000",
        "image": "🍪",
      },

      {
        "name": "Croissant Strawberry",
        "price": "Rp 15.000",
        "image": "🥐",
      },

    ];
=======
    {
      "name": "Donat",
      "price": "Rp 9.000",
      "image": "🍩",
      "toppings": ["Coklat", "Keju", "Strawberry"]
    },
    {
      "name": "Toast",
      "price": "Rp 8.000",
      "image": "🍞",
      "toppings": ["Butter", "Jam", "Chocolate"]
    },
    {
      "name": "Cookies",
      "price": "Rp 10.000",
      "image": "🍪",
      "toppings": ["Choco Chip", "Almond"]
    },
    {
      "name": "Croissant",
      "price": "Rp 15.000",
      "image": "🥐",
      "toppings": ["Plain", "Cheese", "Chocolate"]
    },
    {
      "name": "Burger",
      "price": "Rp 20.000",
      "image": "🍔",
      "toppings": ["Beef", "Cheese", "Chicken"]
    },
  ];
>>>>>>> 7e480cc (updategit branch -M main)

    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      appBar: AppBar(
        title: const Text("Bakery's"),
        centerTitle: true,
        backgroundColor: Colors.pink,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // ================= HERO BANNER
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.pink, Colors.pinkAccent],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Fresh Bakery Everyday 🧁",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Best taste, fresh from oven",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            // ================= SEARCH BAR (UI ONLY)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                  )
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Cari roti favorit kamu...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ================= TITLE
            const Text(
              "Menu Favorit",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // ================= GRID
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.85,
                ),

                itemBuilder: (context, index) {
                  final item = products[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProductDetailPage(product: item),
                        ),
                      );
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          // ICON PRODUCT
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.pink.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              item["image"],
                              style: const TextStyle(fontSize: 45),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // NAME
                          Text(
                            item["name"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 5),

                          // PRICE BADGE
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.pink.shade50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              item["price"],
                              style: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}