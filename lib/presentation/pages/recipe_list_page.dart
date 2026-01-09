import 'package:flutter/material.dart';
import '../../models/recipe.dart';
import '../../services/recipe_service.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_page.dart';
import 'add_recipe_page.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  final RecipeService service = RecipeService();

  List<Recipe> recipes = [];
  List<Recipe> filteredRecipes = [];

  bool loading = true;
  String selectedCategory = "Semua";
  String searchText = "";

  final List<String> categories = [
    "Semua",
    "Sarapan",
    "Makan Siang",
    "Dessert",
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    setState(() => loading = true);
    final data = await service.fetchRecipes();

    if (!mounted) return;

    setState(() {
      recipes = data;
      applyFilter();
      loading = false;
    });
  }

  void applyFilter() {
    filteredRecipes = recipes.where((recipe) {
      final matchCategory = selectedCategory == "Semua"
          ? true
          : recipe.category == selectedCategory;

      final matchSearch = recipe.title
          .toLowerCase()
          .contains(searchText.toLowerCase());

      return matchCategory && matchSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Resep")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddRecipePage()),
          );
          if (result == true) fetchData();
        },
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // 🔍 SEARCH
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Cari resep...",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                        applyFilter();
                      });
                    },
                  ),
                ),

                // 🏷 FILTER CHIP
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final isSelected = selectedCategory == category;

                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(category),
                          selected: isSelected,
                          onSelected: (_) {
                            setState(() {
                              selectedCategory = category;
                              applyFilter();
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 12),

                // 📋 LIST
                Expanded(
                  child: filteredRecipes.isEmpty
                      ? const Center(child: Text("Resep tidak ditemukan"))
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: filteredRecipes.length,
                          itemBuilder: (context, index) {
                            return RecipeCard(
                              recipe: filteredRecipes[index],
                              onTap: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => RecipeDetailPage(
                                      recipe: filteredRecipes[index],
                                    ),
                                  ),
                                );
                                if (result == true) fetchData();
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
