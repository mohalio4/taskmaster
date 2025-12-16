import 'dart:ui';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../screens/home_screen.dart';
import '../screens/task_list_screen.dart';
import '../screens/add_edit_task_screen.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback? onNavigate;

  const CustomDrawer({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.bgStart.withOpacity(0.9),
                  AppColors.bgEnd.withOpacity(0.9),
                ],
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.purple1, AppColors.purple2],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Color(0xFF6366F1),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "TaskMaster User",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "user@taskmaster.com",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                _DrawerItem(
                  icon: Icons.home,
                  title: "Home",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                ),
                _DrawerItem(
                  icon: Icons.list,
                  title: "All Tasks",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TaskListScreen()),
                    );
                    onNavigate?.call();
                  },
                ),
                _DrawerItem(
                  icon: Icons.add_circle,
                  title: "Add Task",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const AddEditTaskScreen()),
                    );
                    onNavigate?.call();
                  },
                ),
                const Divider(color: Colors.white24),
                _DrawerItem(
                  icon: Icons.settings,
                  title: "Settings",
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Settings - Coming Soon'),
                      ),
                    );
                  },
                ),
                _DrawerItem(
                  icon: Icons.info,
                  title: "About",
                  onTap: () {
                    Navigator.pop(context);
                    showAboutDialog(
                      context: context,
                      applicationName: 'TaskMaster',
                      applicationVersion: '1.0.0',
                      applicationIcon: const Icon(
                        Icons.task_alt,
                        size: 50,
                        color: Color(0xFF6366F1),
                      ),
                      children: [
                        const Text(
                          'A modern task management app with glassmorphic UI design.',
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddEditTaskScreen {
  const AddEditTaskScreen();
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textPrimary),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
      hoverColor: Colors.white.withOpacity(0.1),
    );
  }
}