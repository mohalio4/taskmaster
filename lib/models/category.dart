import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;

  const Category({required this.name, required this.icon, required this.color});
}

class AppCategories {
  static const work = Category(name: 'Work', icon: Icons.work, color: Colors.blue);
  static const personal = Category(name: 'Personal', icon: Icons.person, color: Colors.purple);
  static const shopping = Category(name: 'Shopping', icon: Icons.shopping_cart, color: Colors.pink);
  static const study = Category(name: 'Study', icon: Icons.book, color: Colors.green);
  static const health = Category(name: 'Health', icon: Icons.favorite, color: Colors.red);
  static const other = Category(name: 'Other', icon: Icons.more_horiz, color: Colors.grey);

  static const all = [work, personal, shopping, study, health, other];

  static Category fromName(String name) =>
      all.firstWhere((c) => c.name == name, orElse: () => other);
}
