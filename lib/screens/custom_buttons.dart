import 'dart:ui';
import 'package:flutter/material.dart';

class CustomButtonsScreen extends StatelessWidget {
  const CustomButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            GlassButton(text: "Glass Button"),
            SizedBox(height: 20),
            GlowButton(text: "Glowing Button"),
            SizedBox(height: 20),
            GradientBorderButton(text: "Gradient Border"),
          ],
        ),
      ),
    );
  }
}


class GlassButton extends StatelessWidget {
  final String text;
  const GlassButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.white),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}


class GlowButton extends StatelessWidget {
  final String text;
  const GlowButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent,
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}


class GradientBorderButton extends StatelessWidget {
  final String text;
  const GradientBorderButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.blue],
        ),
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
