import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matheus Baron Lauritzen - Portfólio',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1A1A1A), // Dark background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          elevation: 0,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.white70, fontSize: 18),
          bodyMedium: TextStyle(color: Colors.white70, fontSize: 16),
          labelLarge: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white, width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildAboutSection(context),
            _buildSkillsSection(context),
            _buildContactSection(context),
            _buildFooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;
        return Container(
          height: isMobile ? null : MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 50, vertical: isMobile ? 50 : 0),
          alignment: Alignment.center,
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isMobile ? 0 : 3,
                child: Column(
                  crossAxisAlignment: isMobile ? CrossAxisAlignment.stretch : CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Olá, eu sou Matheus Baron Lauritzen',
                      style: isMobile ? Theme.of(context).textTheme.displayMedium : Theme.of(context).textTheme.displayLarge,
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Desenvolvedor Full Stack apaixonado por criar experiências digitais incríveis.',
                      style: isMobile ? Theme.of(context).textTheme.bodyMedium : Theme.of(context).textTheme.bodyLarge,
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => _launchURL('https://github.com/matheus-lauri'),
                            child: const Text('Meu Github'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _launchURL('mailto:lauritzen.matheus@gmail.com'),
                            child: const Text('Entrar em Contato'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              isMobile ? const SizedBox(height: 30) : const SizedBox(width: 50),
              Expanded(
                flex: isMobile ? 0 : 2,
                child: Container(
                  width: isMobile ? 200 : 300,
                  height: isMobile ? 200 : 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/minha_foto.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      color: const Color(0xFF222222), // Slightly lighter dark background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sobre Mim',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'Sou um desenvolvedor full stack com experiência em diversas tecnologias como HTML, CSS, JavaScript, PHP, React, Java, .NET (C#), Kotlin, React Native, C++, Python, Assembly e, atualmente, Flutter. Tenho paixão por transformar ideias em interfaces de usuário bonitas e funcionais, e por construir sistemas robustos e escaláveis. Busco constantemente aprender novas tecnologias e aprimorar minhas habilidades para entregar soluções de alta qualidade.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context) {
    final List<String> skills = [
      'HTML', 'CSS', 'JavaScript', 'PHP', 'React', 'Java', '.NET (C#)',
      'Kotlin', 'React Native', 'C++', 'Python', 'Assembly', 'Flutter'
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Habilidades',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 15.0,
            runSpacing: 15.0,
            alignment: WrapAlignment.center,
            children: skills.map((skill) => Chip(
              label: Text(skill),
              backgroundColor: Colors.white,
              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      color: const Color(0xFF222222),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contato',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                Text(
                  'Interessado em trabalhar comigo? Entre em contato!',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Seu Nome',
                    fillColor: Colors.grey[800],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Seu Email',
                    fillColor: Colors.grey[800],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Sua Mensagem',
                    fillColor: Colors.grey[800],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                  },
                  child: const Text('Enviar Mensagem'),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white, size: 30),
                      onPressed: () => _launchURL('https://linkedin.com/in/matheus-baron-lauritzen-6b970a237'),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white, size: 30),
                      onPressed: () => _launchURL('https://github.com/matheus-lauri'),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.envelope, color: Colors.white, size: 30),
                      onPressed: () => _launchURL('mailto:lauritzen.matheus@gmail.com'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      color: const Color(0xFF1A1A1A),
      child: const Center(
        child: Text(
          '© Matheus Baron Lauritzen. Todos os direitos reservados.',
          style: TextStyle(color: Colors.white70, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Não foi possível abrir $url';
    }
  }
}