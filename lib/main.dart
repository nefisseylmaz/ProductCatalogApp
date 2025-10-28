import 'package:flutter/material.dart';
import 'categories_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ürün Kataloğu',
      home: HomeScreen(),
    );
  }
}

// Tek bir ürün kutusu için widget
class ProductCard extends StatelessWidget {
  final String name;
  final String price;

  const ProductCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Icon(Icons.shopping_bag, size: 50),
            ),
            const SizedBox(height: 8),
            Text(name,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(price,
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Row(
              children: List.generate(
                  5,
                  (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
// Kategoriler sayfası
// Kategoriler sayfası
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, List<Map<String, String>>> categoryData = {
    'Kadın': [
      {'name': 'Sweatshirt', 'image': 'https://cdn.dsmcdn.com/ty1121/product/media/images/prod/SPM/PIM/20240111/15/2c331a48-890d-3acb-8dd2-79ed5f2e5d2f/1_org_zoom.jpg'},
      {'name': 'Tişört', 'image': 'https://cdn.dsmcdn.com/ty1013/product/media/images/prod/SPM/PIM/20230904/17/60b9df18-82b1-474a-a0df-2c8888f257f4/1_org_zoom.jpg'},
      {'name': 'Elbise', 'image': 'https://cdn.dsmcdn.com/ty1080/product/media/images/prod/SPM/PIM/20231207/17/aa36e7c8-7b84-4c34-847f-451d4a9c6068/1_org_zoom.jpg'},
      {'name': 'Mont', 'image': 'https://cdn.dsmcdn.com/ty957/product/media/images/prod/SPM/PIM/20230726/22/1531e4f7-1e43-45a0-9778-21009eb839bb/1_org_zoom.jpg'},
    ],
    'Erkek': [
      {'name': 'Gömlek', 'image': 'https://cdn.dsmcdn.com/ty903/product/media/images/20230405/11/311589478/889496801/1/1_org_zoom.jpg'},
      {'name': 'Tişört', 'image': 'https://cdn.dsmcdn.com/ty1332/product/media/images/prod/SPM/PIM/20240320/12/17a8de9c-2b2c-4493-9df5-3cf53d6f77c9/1_org_zoom.jpg'},
      {'name': 'Pantolon', 'image': 'https://cdn.dsmcdn.com/ty1082/product/media/images/prod/SPM/PIM/20231208/12/1d6c0d87-3f5b-4d4a-bd23-0f5b5c1d9e3a/1_org_zoom.jpg'},
      {'name': 'Mont', 'image': 'https://cdn.dsmcdn.com/ty972/product/media/images/prod/SPM/PIM/20230806/10/dedffb59-3ff8-4b9b-8f6e-3b40a5076e7a/1_org_zoom.jpg'},
    ],
    'Çocuk': [
      {'name': 'Sweatshirt', 'image': 'https://cdn.dsmcdn.com/ty945/product/media/images/prod/SPM/PIM/20230718/14/4e324a08-8a0d-4f76-a2f5-0e59a4a0a203/1_org_zoom.jpg'},
      {'name': 'Mont', 'image': 'https://cdn.dsmcdn.com/ty1230/product/media/images/prod/SPM/PIM/20240125/11/44176a73-43b4-4e59-9b08-88b1f5b2c67a/1_org_zoom.jpg'},
      {'name': 'Etek', 'image': 'https://cdn.dsmcdn.com/ty915/product/media/images/prod/SPM/PIM/20230501/13/3a8a8e5f-88bb-4d7c-8b21-5f043a63b91c/1_org_zoom.jpg'},
      {'name': 'Tişört', 'image': 'https://cdn.dsmcdn.com/ty1371/product/media/images/prod/SPM/PIM/20240409/16/5d02f260-e8db-459f-8c5d-90718d92ce71/1_org_zoom.jpg'},
    ],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categoryData.keys.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Üstte sekmeler
        TabBar(
          controller: _tabController,
          tabs: categoryData.keys.map((key) => Tab(text: key)).toList(),
          labelColor: Colors.pink,
          unselectedLabelColor: Colors.grey,
        ),

        // Sekme içeriği
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: categoryData.keys.map((key) {
              final items = categoryData[key]!;
              return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
                padding: const EdgeInsets.all(16),
                children: items.map((item) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            item['image']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['name']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}


// Ürünlerin listelendiği sayfa
class ProductGridPage extends StatelessWidget {
  const ProductGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ürün Kataloğu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Yatayda 2 ürün
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
          children: const [
            ProductCard(name: 'Elbise', price: '₺120'),
            ProductCard(name: 'Çanta', price: '₺250'),
            ProductCard(name: 'Ayakkabı', price: '₺300'),
            ProductCard(name: 'Saat', price: '₺450'),
          ],
        ),
      ),
    );
  }
}

// Alt menü için StatefulWidget yapısı
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Sayfalar (şimdilik sadece Ana Sayfa var)
  final List<Widget> _pages = [
    const ProductGridPage(), // ürün kataloğu burada olacak
    const CategoriesSidebarPage(),
    const Center(child: Text('Favorilerim')),
    const Center(child: Text('Sepetim')),
    const Center(child: Text('Hesabım')),
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Kategoriler'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorilerim'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Sepetim'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Hesabım'),
        ],
      ),
    );
  }
}

// Yeni kategori sayfası (yan menülü görünüm)
class CategoriesSidebarPage extends StatefulWidget {
  const CategoriesSidebarPage({super.key});

  @override
  State<CategoriesSidebarPage> createState() => _CategoriesSidebarPageState();
}

class _CategoriesSidebarPageState extends State<CategoriesSidebarPage> {
  String selectedCategory = 'Kadın';

  final Map<String, List<String>> subCategories = {
    'Kadın': ['Sweatshirt', 'Tişört', 'Dış Giyim', 'Pantolon'],
    'Erkek': ['Tişört', 'Gömlek', 'Mont', 'Pantolon'],
    'Çocuk': ['Tişört', 'Sweatshirt', 'Pantolon', 'Ayakkabı'],
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Sol menü (kategori listesi)
        Container(
          width: 100,
          color: Colors.grey[200],
          child: ListView(
            children: subCategories.keys.map((category) {
              bool isSelected = selectedCategory == category;
              return ListTile(
                title: Text(
                  category,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.pink : Colors.black,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              );
            }).toList(),
          ),
        ),

        // Sağ tarafta alt kategoriler (örneğin Sweatshirt, Tişört, vs.)
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            padding: const EdgeInsets.all(16),
            children: subCategories[selectedCategory]!
                .map(
                  (item) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                        ),
                        child: const Icon(Icons.image, size: 40),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}

