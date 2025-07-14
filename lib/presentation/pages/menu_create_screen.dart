import 'package:auto_route/auto_route.dart';
import 'package:flashcook_poc/data/model/menu.dart';
import 'package:flashcook_poc/router.dart';
import '../bloc/menus_bloc/menus_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
@RoutePage()
class MenuCreateScreen extends StatelessWidget {
  static void navigateTo(BuildContext context) {
    context.pushRoute(const MenuCreateRoute());
  }

  const MenuCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final priceController = TextEditingController();
    final categoryController = TextEditingController();
    final imageUrlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Créer un Menu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Titre'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Prix'),
              ),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Catégorie'),
              ),
              TextField(
                controller: imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final menu = Menu(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: titleController.text,
                    description: descriptionController.text,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  );

                  context.read<MenusBloc>().add(CreateMenu(
                      title: menu.title, description: menu.description));
                  Navigator.of(context).pop();
                },
                child: const Text('Créer le menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
