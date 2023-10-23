import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetHandler;

  Result(this.score, this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Você acertou $score perguntas!'),
          ElevatedButton(
            onPressed: resetHandler,
            child: Text('Reiniciar'),
          ),
        ],
      ),
    );
  }
}
