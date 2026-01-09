import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../models/recipe.dart';
import '../../services/recipe_service.dart';
import 'recipe_list_page.dart';
import 'add_recipe_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final RecipeService service = RecipeService();

  int total = 0;
  int sarapan = 0;
  int makanSiang = 0;
  int dessert = 0;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadSummary();
  }

  Future<void> loadSummary() async {
    setState(() => loading = true);

    final List<Recipe> data = await service.fetchRecipes();

    if (!mounted) return;

    setState(() {
      total = data.length;
      sarapan = data.where((e) => e.category == "Sarapan").length;
      makanSiang = data.where((e) => e.category == "Makan Siang").length;
      dessert = data.where((e) => e.category == "Dessert").length;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Resep Masakan"),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 2.2, // 🔑 biar tidak tinggi
                    children: [
                      _summaryCard("Total Resep", total),
                      _summaryCard("Sarapan", sarapan),
                      _summaryCard("Makan Siang", makanSiang),
                      _summaryCard("Dessert", dessert),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// ===== BUTTON FULL WIDTH =====
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RecipeListPage(),
                          ),
                        );
                        loadSummary(); // 🔥 REFRESH SAAT BALIK
                      },
                      child: const Text("Daftar Resep"),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AddRecipePage(),
                          ),
                        );
                        loadSummary();
                      },
                      child: const Text("Tambah Resep Baru"),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _summaryCard(String title, int value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
