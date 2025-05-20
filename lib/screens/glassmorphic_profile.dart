import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphicProfileScreen extends StatefulWidget {
  const GlassmorphicProfileScreen({super.key});

  @override
  State<GlassmorphicProfileScreen> createState() => _GlassmorphicProfileScreenState();
}

class _GlassmorphicProfileScreenState extends State<GlassmorphicProfileScreen> {
  bool isHoveringEmail = false;
  bool isHoveringPhone = false;
  bool isHoveringLink = false;

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
          // Background Image
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
                  height: 420,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(38),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white.withAlpha(51)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/girl.jpg'),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Smirthi',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'UI Designer',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Contact Icons with Hover
                      // Contact Icons with Hover + Equal Alignment
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: _buildHoverIcon(
          icon: Icons.email,
          label: 'smith@mail.com',
          isHovering: isHoveringEmail,
          onHoverChange: (val) => setState(() => isHoveringEmail = val),
        ),
      ),
      Expanded(
        child: _buildHoverIcon(
          icon: Icons.phone,
          label: '9876532101',
          isHovering: isHoveringPhone,
          onHoverChange: (val) => setState(() => isHoveringPhone = val),
        ),
      ),
      Expanded(
        child: _buildHoverIcon(
          icon: Icons.link,
          label: 'smirthi.dev',
          isHovering: isHoveringLink,
          onHoverChange: (val) => setState(() => isHoveringLink = val),
        ),
      ),
    ],
  ),
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

  Widget _buildHoverIcon({
  required IconData icon,
  required String label,
  required bool isHovering,
  required Function(bool) onHoverChange,
}) {
  return MouseRegion(
    onEnter: (_) => onHoverChange(true),
    onExit: (_) => onHoverChange(false),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white70),
        const SizedBox(height: 6),
        SizedBox(
          height: 16,
          child: AnimatedOpacity(
            opacity: isHovering ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis, // to keep width controlled
              maxLines: 1,
            ),
          ),
        ),
      ],
    ),
  );
}
}
