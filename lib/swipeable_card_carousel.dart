import 'package:flutter/material.dart';

class SwipeableCardCarousel extends StatelessWidget {
  const SwipeableCardCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 0.85);

    final List<Map<String, String>> cards = [
      {
        "title": "Kitten",
        "subtitle": "Every cat possesses a charm",
        "image": "assets/card1.jpg",
      },
      {
        "title": "Puppies",
        "subtitle": "A puppy’s love is always unconditional, honest, and true",
        "image": "assets/card2.jpg",
      },
      {
        "title": "Cubs",
        "subtitle": "Once a Cubs fan, always a Cubs fan",
        "image": "assets/card3.jpeg",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipeable Card Carousel'),
        centerTitle: true,
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    card['image']!,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card['title']!,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            card['subtitle']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
