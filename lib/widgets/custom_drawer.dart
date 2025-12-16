import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.6),
      child: ListView(
        children: const [
          DrawerHeader(
            child: Text("👤 User Profile", style: TextStyle(fontSize: 20)),
          ),
          ListTile(leading: Icon(Icons.home), title: Text("Home")),
          ListTile(leading: Icon(Icons.list), title: Text("All Tasks")),
          ListTile(leading: Icon(Icons.add), title: Text("Add Task")),
          ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
        ],
      ),
    );
  }
}
