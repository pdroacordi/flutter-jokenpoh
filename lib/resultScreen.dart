import 'package:flutter/material.dart';
import 'main.dart';

class ResultScreen extends StatelessWidget {
  final String userChoice;
  final String appChoice;
  const ResultScreen({
    super.key,
    required this.userChoice,
    required this.appChoice,
  });

  String getResult(String user, String app) {
    if (user == app) return "empate";
    if ((user == "pedra" && app == "tesoura") ||
        (user == "papel" && app == "pedra") ||
        (user == "tesoura" && app == "papel")) {
      return "vencedor";
    }
    return "perdedor";
  }

  @override
  Widget build(BuildContext context) {
    final resultado = getResult(userChoice, appChoice);
    String resultText;
    switch (resultado) {
      case "vencedor":
        resultText = "Você venceu!";
        break;
      case "perdedor":
        resultText = "Você perdeu!";
        break;
      default:
        resultText = "Empate!";
    }
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
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    "images/$appChoice.png",
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Text(
                    "Escolha do App",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    "images/$userChoice.png",
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Text(
                    "Escolha do Jogador",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    "images/$resultado.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Text(
                    resultText,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MyHomePage(title: "Pedra, Papel e Tesoura"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(
                    "Jogar Novamente",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
