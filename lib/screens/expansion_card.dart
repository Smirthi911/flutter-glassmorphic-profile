import 'package:flutter/material.dart';

class ExpansionCardScreen extends StatelessWidget {
  const ExpansionCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expansion Card")),
      body: const Center(
        child: ExpansionCard(),
      ),
    );
  }
}

class ExpansionCard extends StatefulWidget {
  const ExpansionCard({super.key});

  @override
  State<ExpansionCard> createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(Icons.info),
              title: Text("Hi This is Smirthi"),
              subtitle: Text("Tap to view more"),
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstChild: const SizedBox.shrink(),
              secondChild: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "I have created this card to have a expandable version",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
