import 'package:aulaum/resultScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokenpoh',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const MyHomePage(title: 'Jokenpoh'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loading = false;

  void _onImageTap(String choice) async {
    setState(() {
      _loading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    String appChoice = (["pedra", "papel", "tesoura"]..shuffle()).first;

    setState(() {
      _loading = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultScreen(userChoice: choice, appChoice: appChoice),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Pedra, Papel e Tesoura",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _loading
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [CircularProgressIndicator(), Text("Calculando...")],
              ),
            )
          : Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset("images/padrao.png"),
                        Text(
                          "Escolha do App",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onImageTap("pedra"),
                            child: Image.asset(
                              "images/pedra.png",
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width * 0.13,
                              height: MediaQuery.of(context).size.height * 0.13,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onImageTap("papel"),
                            child: Image.asset(
                              "images/papel.png",
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width * 0.13,
                              height: MediaQuery.of(context).size.height * 0.13,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onImageTap("tesoura"),
                            child: Image.asset(
                              "images/tesoura.png",
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width * 0.13,
                              height: MediaQuery.of(context).size.height * 0.13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Escolha do Jogador",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
