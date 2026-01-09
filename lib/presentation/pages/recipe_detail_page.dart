import 'package:flutter/material.dart';
import '../../models/recipe.dart';
import '../../services/recipe_service.dart';
import 'edit_recipe_page.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final service = RecipeService();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA), // bg beda supaya shadow kelihatan
      appBar: AppBar(
        title: const Text("Detail Resep"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditRecipePage(recipe: recipe),
                ),
              );

              if (result == true && context.mounted) {
                Navigator.pop(context, true);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Hapus Resep"),
                  content:
                      const Text("Apakah kamu yakin ingin menghapus resep ini?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text("Batal"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text("Hapus"),
                    ),
                  ],
                ),
              );

              if (confirm == true) {
                await service.deleteRecipe(recipe.id);
                if (context.mounted) {
                  Navigator.pop(context, true);
                }
              }
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.18),
                  blurRadius: 14,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Kategori: ${recipe.category}",
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),

                const Text(
                  "Bahan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(recipe.ingredients),
                const SizedBox(height: 16),

                const Text(
                  "Langkah",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(recipe.steps),

                if (recipe.note.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  const Text(
                    "Catatan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(recipe.note),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  } 
}
