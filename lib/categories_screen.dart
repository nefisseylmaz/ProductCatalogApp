import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedIndex = 0;

  final List<String> categories = ['Kadın', 'Erkek', 'Çocuk', 'Ev Tekstil', 'Ayakkabı'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sol menü (dikey kategori listesi)
          Container(
            width: 100,
            color: Colors.grey[200],
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    color: isSelected ? Colors.white : Colors.grey[200],
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected ? Colors.orange : Colors.black,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Sağ taraf: ürünler
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              padding: const EdgeInsets.all(16),
              childAspectRatio: 0.75,
              children: List.generate(
                6,
                    (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.shopping_bag, size: 50),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Sweatshirt',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
