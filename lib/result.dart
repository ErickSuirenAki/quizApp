import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetHandler;
  final VoidCallback finishHandler;

  Result(this.score, this.resetHandler, this.finishHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      // ... (o resto do seu código para este arquivo)
    );
  }
}
