import 'package:flutter/material.dart';
import 'package:ui_blocks/screens/custom_buttons.dart';
import 'package:ui_blocks/screens/expansion_card.dart';
import 'package:ui_blocks/screens/flip_card.dart';
import 'screens/glassmorphic_profile.dart';
import 'screens/task_list_screen.dart'; 

void main() {
  runApp(const UIBlocksApp());
}

class UIBlocksApp extends StatelessWidget {
  const UIBlocksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Blocks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: Colors.blueAccent,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Blocks'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            context,
            title: 'Glassmorphic Profile Card',
            subtitle: 'A stylish frosted-glass profile component',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const GlassmorphicProfileScreen()),
              );
            },
          ),
          _buildCard(
            context,
            title: 'Task List',
            subtitle: 'Mock data task management UI',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TaskListScreen()),
              );
            },
          ),
          _buildCard(
            context,
  title: 'Custom Button Set',
  subtitle: 'Stylish interactive buttons with animation',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CustomButtonsScreen()),
    );
  },
),
_buildCard(
  context,
  title: 'Interactive Expansion Card',
  subtitle: 'Tap to expand and see details',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ExpansionCardScreen()),
    );
  },
),
_buildCard(
  context,
  title: 'Flip Card Animation',
  subtitle: 'Tap to flip between front and back',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FlipCardss()),
    );
  },
),


        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
