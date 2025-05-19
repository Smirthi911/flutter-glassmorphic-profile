import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphicProfileScreen extends StatelessWidget {
  const GlassmorphicProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withAlpha(77),
        elevation: 0,
        title: const Text("Glassmorphic Profile"),
      ),
      body: Stack(
        children: [
          // Background Image from local assets
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/picture.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Glassmorphic Card
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(38),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white.withAlpha(51)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/girl.jpg'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Smirthi',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'UI Designer',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.email, color: Colors.white70),
                          Icon(Icons.phone, color: Colors.white70),
                          Icon(Icons.link, color: Colors.white70),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
