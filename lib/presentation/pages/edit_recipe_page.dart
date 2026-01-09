import 'package:flutter/material.dart';
import '../../models/recipe.dart';
import '../../services/recipe_service.dart';

class EditRecipePage extends StatefulWidget {
  final Recipe recipe;
  const EditRecipePage({super.key, required this.recipe});

  @override
  State<EditRecipePage> createState() => _EditRecipePageState();
}

class _EditRecipePageState extends State<EditRecipePage> {
  final service = RecipeService();
  final formKey = GlobalKey<FormState>();

  late TextEditingController titleCtrl;
  late TextEditingController ingredientCtrl;
  late TextEditingController stepCtrl;
  late String category;

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController(text: widget.recipe.title);
    ingredientCtrl = TextEditingController(text: widget.recipe.ingredients);
    stepCtrl = TextEditingController(text: widget.recipe.steps);
    category = widget.recipe.category;
  }

  void submit() async {
    if (!formKey.currentState!.validate()) return;

    final success = await service.updateRecipe(widget.recipe.id, {
      "title": titleCtrl.text,
      "category": category,
      "ingredients": ingredientCtrl.text,
      "steps": stepCtrl.text,
    });

    if (success && mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Resep")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: "Judul"),
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),
              DropdownButtonFormField(
                value: category,
                items: const [
                  DropdownMenuItem(value: "Sarapan", child: Text("Sarapan")),
                  DropdownMenuItem(value: "Makan Siang", child: Text("Makan Siang")),
                  DropdownMenuItem(value: "Makan Malam", child: Text("Makan Malam")),
                  DropdownMenuItem(value: "Dessert", child: Text("Dessert")),
                ],
                onChanged: (v) => setState(() => category = v!),
              ),
              TextFormField(
                controller: ingredientCtrl,
                decoration: const InputDecoration(labelText: "Bahan"),
                maxLines: 3,
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: stepCtrl,
                decoration: const InputDecoration(labelText: "Langkah"),
                maxLines: 4,
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: submit,
                child: const Text("Simpan Perubahan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
