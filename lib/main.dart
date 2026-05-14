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
            color: Color.fromARGB(255, 91, 3, 109),
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
            "Início",
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
            "Avaliações",
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> curtidas = [12, 8, 15];
  List<bool> curtiu = [false, false, false];

  Widget postCard(
    int index,
    String usuario,
    String conteudo,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 82, 4, 48),
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
          const SizedBox(height: 12),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (curtiu[index]) {
                      curtidas[index]--;
                      curtiu[index] = false;
                    } else {
                      curtidas[index]++;
                      curtiu[index] = true;
                    }
                  });
                },
                icon: Icon(
                  curtiu[index]
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: const Color(0xFFFF4DB8),
                ),
              ),
              Text(
                "${curtidas[index]} curtidas",
                style: const TextStyle(color: Colors.white70),
              ),
            ],
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
        title: const Text(
          "Tunesick Início",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 91, 3, 109),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(18),
            child: Text(
              "Avaliações, opiniões e discussões musicais.",
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
                hintText: "Pesquisar artistas, álbuns...",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon:
                    const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: const Color.fromARGB(255, 102, 6, 80),
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
            0,
            "@6667masterofpuppies6667",
            "GEEK USA É A MELHOR MUSICA DO SMASHING PUMPKINS.",
          ),
          postCard(
            1,
            "@triplet67",
            "eu sou a reencarnação do billy corgan",
          ),
           postCard(
            2,
            "@judysheena",
            "Ramones eh mto poggers :D",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFFFF1493),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePostPage(),
            ),
          );
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "Novo Post",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        title: const Text(
          "Tunesick Avaliações",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 91, 3, 109),
      ),
      body: ListView(
        children: [
          reviewCard(
            "I Don't Wanna Grow Up - Descendents",
            "Definidor do início do punk!",
            "★★★★☆ 4.5/5",
          ),
          reviewCard(
            "Siamese Dream - The Smashing Pumpkins",
            "Rock alternativo profundo e essencial.",
            "★★★★★ 5/5",
          ),
          reviewCard(
            "Americana - The Offspring",
            "Boas críticas com um som envolvente e bem elaborado.",
            "★★★★☆ 4.5/5",
          ),
        ],
      ),
    );
  }
}

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Criar Post",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 91, 3, 109),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Título do post...",
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: const Color.fromARGB(255, 102, 6, 80),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 6,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Compartilhe sua opinião musical...",
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: const Color.fromARGB(255, 102, 6, 80),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF1493),
              ),
              onPressed: () {},
              child: const Text(
                "Publicar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}