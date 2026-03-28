import 'package:flutter/material.dart';

import 'item_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation1 = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _animation2 = Tween<Offset>(begin: const Offset(-1.5, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.2, 1, curve: Curves.easeOut),
          ),
        );

    _animation3 = Tween<Offset>(begin: const Offset(-1.5, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.4, 1, curve: Curves.easeOut),
          ),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildButton(
    String title,
    Color color,
    VoidCallback onTap,
    Animation<Offset> animation,
  ) {
    return SlideTransition(
      position: animation,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          SizedBox.expand(
            child: Image.asset(
              'assets/backgrounds/backgroundMobile.png',
              fit: BoxFit.cover,
            ),
          ),

          Container(color: Colors.black.withOpacity(0.3)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 300),
                  buildButton(
                    "Item 1",
                    Colors.orange,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ItemPage(title: "Item 1"),
                      ),
                    ),
                    _animation1,
                  ),
                  buildButton(
                    "Item 2",
                    Colors.blue,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ItemPage(title: "Item 2"),
                      ),
                    ),
                    _animation2,
                  ),
                  buildButton(
                    "Item 3",
                    Colors.green,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ItemPage(title: "Item 3"),
                      ),
                    ),
                    _animation3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
