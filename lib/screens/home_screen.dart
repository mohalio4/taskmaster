import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';
import '../widgets/custom_drawer.dart';
import 'task_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('TaskMaster'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Hello 👋", style: TextStyle(fontSize: 26)),
                SizedBox(height: 8),
                Text("You have tasks waiting today"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GlassCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _StatItem("Total", "32"),
                _StatItem("Done", "12"),
                _StatItem("Pending", "20"),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const TaskListScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 22)),
        Text(label),
      ],
    );
  }
}
