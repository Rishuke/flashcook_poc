import 'package:auto_route/auto_route.dart';
import '../../data/model/menu.dart';
import '../bloc/menus_bloc/menus_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MenuDetailScreen extends StatelessWidget {
  const MenuDetailScreen({super.key, required this.menu});

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: menu.title);
    final descriptionController = TextEditingController(text: menu.description);

    return Scaffold(
      appBar: AppBar(title: const Text('Détail du Menu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Titre')),
            TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<MenusBloc>().add(UpdateMenu(
                        menu: menu.copyWith(
                      title: titleController.text,
                      description: descriptionController.text,
                    )));
                Navigator.of(context).pop();
              },
              child: const Text('Enregistrer'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text('Dernière modification : ${menu.updatedAt}'),
            ),
          ],
        ),
      ),
    );
  }
}
