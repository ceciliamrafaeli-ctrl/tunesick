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
        ListTile(
          leading: const Icon(Icons.person, color: Colors.white70),
          title: const Text(
            "Perfil",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
        ),
        ListTile(
  leading: const Icon(Icons.bar_chart, color: Colors.white70),
  title: const Text(
    "Estatísticas",
    style: TextStyle(color: Colors.white),
  ),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StatsPage(),
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
  List<int> curtidas = [420, 67, 42, 666];
  List<bool> curtiu = [false, false, false, false];

  Widget postCard(
    int index,
    String usuario,
    String conteudo,
  ) {
   return TweenAnimationBuilder<double>(
  tween: Tween(begin: 0.9, end: 1.0),
  duration: const Duration(milliseconds: 900),
  curve: Curves.easeOutBack,
  builder: (context, scale, child) {
    return Transform.scale(
      scale: scale,
      child: child,
    );
  },
  child: Container(
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
      body: TweenAnimationBuilder<double>(
  tween: Tween(begin: 0.0, end: 1.0),
  duration: const Duration(milliseconds: 1700),
  curve: Curves.easeOut,
  builder: (context, value, child) {
    return Opacity(
      opacity: value,
      child: Transform.translate(
        offset: Offset(0, 40 * (1 - value)),
        child: child,
      ),
    );
  },
  child: ListView(
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
          postCard(
            3,
            "@cannibalangel",
            "I DO A CROOKED LITTLE DANCE WITH MY FUNNY LITTLE MONKEY",
          ),
               ],
      ),
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

  Widget reviewCard(String album, String review, double nota) {
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
            "Nota: $nota/5",
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

    List<Map<String, dynamic>> albuns = [
      {
        "nome": "I Don't Wanna Grow Up - Descendents",
        "review": "Definidor do início do punk!",
        "nota": 4.5,
      },
      {
        "nome": "Siamese Dream - The Smashing Pumpkins",
        "review": "Rock alternativo profundo e essencial.",
        "nota": 5.0,
      },
      {
        "nome": "Americana - The Offspring",
        "review": "Boas críticas com um som envolvente e bem elaborado.",
        "nota": 4.5,
      },
    ];

    // PROCESSAMENTO
    double somaNotas = 0;

    for (var album in albuns) {
      somaNotas += album["nota"];
    }

    double mediaNotas = somaNotas / albuns.length;

    double maiorNota = albuns[0]["nota"];
    String melhorAlbum = albuns[0]["nome"];

    for (var album in albuns) {
      if (album["nota"] > maiorNota) {
        maiorNota = album["nota"];
        melhorAlbum = album["nome"];
      }
    }

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
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 102, 6, 80),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                Text(
                  "Média das notas do site: ${mediaNotas.toStringAsFixed(1)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Melhor avaliado:",
                  style: const TextStyle(color: Colors.white70),
                ),
                Text(
                  melhorAlbum,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFFF4DB8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Total de avaliações: ${albuns.length}",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          ...albuns.map(
            (album) => reviewCard(
              album["nome"],
              album["review"],
              album["nota"],
            ),
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
            TweenAnimationBuilder<double>(
  tween: Tween(begin: 0.8, end: 1.0),
  duration: const Duration(milliseconds: 700),
  curve: Curves.easeOutBack,
  builder: (context, scale, child) {
    return Transform.scale(
      scale: scale,
      child: child,
    );
  },
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFF1493),
    ),
    onPressed: () {},
    child: const Text(
      "Publicar",
      style: TextStyle(color: Colors.white),
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menuDrawer(context),
      appBar: AppBar(
        title: const Text(
          "Meu Perfil",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 91, 3, 109),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Color.fromARGB(255, 102, 6, 80),
            child: Icon(
              Icons.person,
              size: 70,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "@cannibalangel",
              style: TextStyle(
                color: Color(0xFFFF4DB8),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 80, 21, 80),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Banda favorita: Legião Urbana",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Gênero favorito: punk-rock",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Posts publicados: 4",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Curtidas recebidas: 1195",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> curtidas = [420, 67, 42, 666];

    int totalCurtidas = 0;

    for (int curtida in curtidas) {
      totalCurtidas += curtida;
    }

    double mediaCurtidas = totalCurtidas / curtidas.length;

    return Scaffold(
      drawer: menuDrawer(context),
      appBar: AppBar(
        title: const Text(
          "Estatísticas",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 91, 3, 109),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 80, 21, 80),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Text(
                    "Total de curtidas: $totalCurtidas",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Média de curtidas: ${mediaCurtidas.toStringAsFixed(1)}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Quantidade de posts: 4",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}