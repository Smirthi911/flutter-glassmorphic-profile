import 'package:flutter/material.dart';
import 'dart:math';

class FlipCardss extends StatefulWidget {
  const FlipCardss({super.key});

  @override
  State<FlipCardss> createState() => _FlipCardssState();
}

class _FlipCardssState extends State<FlipCardss>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flip Card")),
      body: Center(
        child: GestureDetector(
          onTap: _flipCard,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final angle = _controller.value * pi;
              final isUnder = angle > pi / 2;
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(angle),
                child: isUnder
                    ? _buildCard("Back", Colors.deepPurple)
                    : _buildCard("Front", Colors.teal),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String text, Color color) {
    return Container(
      width: 220,
      height: 300,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
