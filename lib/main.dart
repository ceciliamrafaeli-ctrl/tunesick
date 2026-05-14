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

Drawer menuDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: const Color(0xFF050B0B),
    child: ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 143, 27, 118),
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
          leading: const Icon(Icons.home, color: Colors.white70),
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.album, color: Colors.white70),
          title: const Text(
            "Reviews",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReviewsPage(),
              ),
            );
          },
        ),
      ],
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget postCard(String usuario, String conteudo) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 81, 4, 82),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            usuario,
            style: const TextStyle(
              color: Color(0xFFFF4DB8),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            conteudo,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menuDrawer(context),
      appBar: AppBar(
        title: const Text("Tunesick Home"),
        backgroundColor: const Color.fromARGB(255, 172, 8, 85),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search artists, albums...",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: const Color.fromARGB(255, 76, 6, 35),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 12),
          postCard(
            "@metalhead",
            "Spineshank deserved way more recognition in the 2000s scene.",
          ),
          postCard(
            "@altgirl",
            "What album has your favorite opening track?",
          ),
        ],
      ),
    );
  }
}

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  Widget reviewCard(String album, String review, String nota) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 80, 21, 80),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            album,
            style: const TextStyle(
              color: Color(0xFFFF4DB8),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            review,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            nota,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menuDrawer(context),
      appBar: AppBar(
        title: const Text("Tunesick Reviews"),
        backgroundColor: const Color(0xFF110505),
      ),
      body: ListView(
        children: [
          reviewCard(
            "The Sickness - Disturbed",
            "A defining nu metal album with iconic vocals and memorable riffs.",
            "★★★★☆ 4.5/5",
          ),
          reviewCard(
            "Self-Destructive Pattern - Spineshank",
            "Heavy, electronic and underrated release from the early 2000s.",
            "★★★★★ 5/5",
          ),
        ],
      ),
    );
  }
}