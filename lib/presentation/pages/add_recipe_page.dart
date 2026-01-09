import 'package:flutter/material.dart';
import '../../services/recipe_service.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final service = RecipeService();
  final formKey = GlobalKey<FormState>();

  final titleCtrl = TextEditingController();
  final ingredientCtrl = TextEditingController();
  final stepCtrl = TextEditingController();
  String category = "Sarapan";

  void submit() async {
    if (!formKey.currentState!.validate()) return;

    await service.addRecipe({
      "title": titleCtrl.text,
      "category": category,
      "ingredients": ingredientCtrl.text,
      "steps": stepCtrl.text,
      "note": "",
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Resep")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: "Judul Resep"),
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),
              DropdownButtonFormField(
                value: category,
                items: const [
                  DropdownMenuItem(value: "Sarapan", child: Text("Sarapan")),
                  DropdownMenuItem(
                      value: "Makan Siang", child: Text("Makan Siang")),
                  DropdownMenuItem(
                      value: "Makan Malam", child: Text("Makan Malam")),
                  DropdownMenuItem(value: "Dessert", child: Text("Dessert")),
                ],
                onChanged: (v) => setState(() => category = v!),
                decoration: const InputDecoration(labelText: "Kategori"),
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
                child: const Text("Simpan Resep"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
