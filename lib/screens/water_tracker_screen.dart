import 'dart:ui';
import 'package:flutter/material.dart';

class WaterTrackerScreen extends StatefulWidget {
  const WaterTrackerScreen({super.key});

  @override
  State<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> {
  int glassesDrunk = 0;
  final int goal = 8;
  bool showMessage = false;

  void _addGlass() {
    if (glassesDrunk < goal) {
      setState(() {
        glassesDrunk++;
        showMessage = false;
      });
    }
  }

  void _resetGlasses() {
    setState(() {
      glassesDrunk = 0;
      showMessage = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showMessage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = glassesDrunk / goal;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/water.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  width: 300,
                  height: 420,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Daily Water Intake",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "$glassesDrunk / $goal glasses",
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              value: progress,
                              strokeWidth: 8,
                              backgroundColor: Colors.white24,
                              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: _addGlass,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.2),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text("Add Glass"),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: _resetGlasses,
                            child: const Text(
                              "Reset",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          if (showMessage)
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                                    ),
                                    child: const Text(
                                      "Water intake has been reset.",
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
