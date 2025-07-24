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
      debugShowCheckedModeBanner: false,
      title: 'Matheus Baron Lauritzen - Portfólio',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          elevation: 0,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(color: Colors.white70, fontSize: 18),
          bodyMedium: TextStyle(color: Colors.white70, fontSize: 16),
          labelLarge: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white, width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              color: const Color(0xFF222222),
              child: isMobile
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Matheus Baron Lauritzen',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => _scrollToSection(_heroKey),
                          child: const Text(
                            'Início',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () => _scrollToSection(_aboutKey),
                          child: const Text(
                            'Sobre Mim',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () => _scrollToSection(_skillsKey),
                          child: const Text(
                            'Habilidades',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () => _scrollToSection(_contactKey),
                          child: const Text(
                            'Contato',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          drawer: isMobile
              ? Drawer(
                  child: Container(
                    color: const Color(0xFF222222),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          title: const Text(
                            'Início',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            _scrollToSection(_heroKey);
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Sobre Mim',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            _scrollToSection(_aboutKey);
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Habilidades',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            _scrollToSection(_skillsKey);
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Contato',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            _scrollToSection(_contactKey);
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : null,
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(key: _heroKey, child: _buildHeroSection(context)),
                Container(key: _aboutKey, child: _buildAboutSection(context)),
                Container(key: _skillsKey, child: _buildSkillsSection(context)),
                Container(
                  key: _contactKey,
                  child: _buildContactSection(context),
                ),
                _buildFooterSection(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;
        return Container(
          height: isMobile ? null : MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 50,
            vertical: isMobile ? 50 : 0,
          ),
          alignment: Alignment.center,
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: isMobile
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isMobile ? 0 : 3,
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.stretch
                      : CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Olá, eu sou Matheus Baron Lauritzen',
                      style: isMobile
                          ? Theme.of(context).textTheme.displayMedium
                          : Theme.of(context).textTheme.displayLarge,
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Desenvolvedor Full Stack apaixonado por criar experiências digitais incríveis.',
                      style: isMobile
                          ? Theme.of(context).textTheme.bodyMedium
                          : Theme.of(context).textTheme.bodyLarge,
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              isMobile ? const SizedBox(height: 30) : const SizedBox(width: 50),
              Expanded(
                flex: isMobile ? 0 : 2,
                child: isMobile
                    ? Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('assets/foto_perfil.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 500,
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage('assets/foto_perfil.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
            ),
          ],
        ));
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
          Text('Sobre Mim', style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                Text(
                  'Atualmente, estou cursando uma graduação em Ciência da Computação na Universidade do Vale do Itajaí (UNIVALI), após me formar em Análise e Desenvolvimento de Sistemas pelo SENAI em Brusque, Santa Catarina, Brasil. Sou um desenvolvedor full stack com experiência em diversas tecnologias como HTML, CSS, JavaScript, PHP, React, Java, .NET (C#), Kotlin, React Native, C++, Python, Assembly e Flutter. Tenho paixão por transformar ideias em interfaces de usuário bonitas e funcionais, e por construir sistemas robustos e escaláveis. Busco constantemente aprender novas tecnologias e aprimorar minhas habilidades para entregar soluções de alta qualidade.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context) {
    final List<String> skills = [
      'HTML',
      'CSS',
      'JavaScript',
      'PHP',
      'React',
      'Java',
      '.NET (C#)',
      'Kotlin',
      'React Native',
      'C++',
      'Python',
      'Assembly',
      'Flutter',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Habilidades', style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 30),
          Wrap(
            spacing: 15.0,
            runSpacing: 15.0,
            alignment: WrapAlignment.center,
            children: skills
                .map(
                  (skill) => Chip(
                    label: Text(skill),
                    backgroundColor: Colors.white,
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                )
                .toList(),
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
          Text('Contato', style: Theme.of(context).textTheme.displayMedium),
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
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => _launchURL(
                        'https://linkedin.com/in/matheus-baron-lauritzen-6b970a237',
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.github,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () =>
                          _launchURL('https://github.com/matheus-lauri'),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.envelope,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () =>
                          _launchURL('mailto:lauritzen.matheus@gmail.com'),
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
