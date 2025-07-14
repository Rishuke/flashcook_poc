import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/model/menu.dart';
import '../../router.dart';
import '../bloc/menus_bloc/menus_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final menu = Menu(
                    id: FirebaseFirestore.instance.collection('menus').doc().id,
                    title: titleController.text,
                    description: descriptionController.text,
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
