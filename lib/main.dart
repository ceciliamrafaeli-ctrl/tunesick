import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tunesick',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFF050B0B),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget postCard({
    required String usuario,
    required String conteudo,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF2B0A24),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF8C145E),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            usuario,
            style: const TextStyle(
              color: Color(0xFFFF4DB8),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            conteudo,
            style: const TextStyle(
              color: Color(0xFFF5F5F5),
              fontSize: 15,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.favorite_border, color: Color(0xFFFF4DB8)),
              Icon(Icons.comment_outlined, color: Colors.white70),
              Icon(Icons.share_outlined, color: Colors.white70),
            ],
          )
        ],
      ),
    );
  }

  Widget reviewCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF140714),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Featured Review",
            style: TextStyle(
              color: Color(0xFFFF4DB8),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "The Sickness — Disturbed",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "A defining album of early 2000s nu metal, combining aggressive riffs, memorable hooks and iconic vocals.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.5,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "★★★★☆ 4.5/5",
            style: TextStyle(
              color: Color(0xFFFF4DB8),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget commentsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF140714),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Comments",
            style: TextStyle(
              color: Color(0xFFFF4DB8),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "@riotcore: This album still sounds insane.",
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 6),
          Text(
            "@pinknoise: One of my favorites ever.",
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 6),
          Text(
            "@voidstatic: Peak nu metal era.",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tunesick",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: const Color(0xFF110505),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF050B0B),
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF2B0A24),
              ),
              child: Text(
                "Tunesick",
                style: TextStyle(
                  color: Color(0xFFFF4DB8),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white70),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.album, color: Colors.white70),
              title: Text(
                "Reviews",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(18),
            child: Text(
              "Music reviews, opinions and discussions.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
          reviewCard(),
          commentsCard(),
          postCard(
            usuario: "@metalhead",
            conteudo: "Spineshank deserved way more recognition in the 2000s scene.",
          ),
          postCard(
            usuario: "@altgirl",
            conteudo: "What album has your favorite opening track?",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF1493),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}