import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'questionText':
          'Qual é o sistema operacional mais utilizado em computadores pessoais?',
      'answers': [
        {'text': 'Windows', 'correct': true},
        {'text': 'iOS', 'correct': false},
        {'text': 'Linux', 'correct': false},
        {'text': 'Android', 'correct': false},
      ],
    },
    {
      'questionText':
          'Qual componente de hardware é responsável pelo processamento principal em um computador?',
      'answers': [
        {'text': 'Memória RAM', 'correct': false},
        {'text': 'Disco rígido', 'correct': false},
        {'text': 'Placa de vídeo', 'correct': false},
        {'text': 'CPU (Unidade Central de Processamento)', 'correct': true},
      ],
    },
    {
      'questionText': 'O que significa a sigla "URL"?',
      'answers': [
        {'text': 'Uniform Resource Locator', 'correct': true},
        {'text': 'Universal Registration Listing', 'correct': false},
        {'text': 'Unique Reference Link', 'correct': false},
        {'text': 'User-Related Location', 'correct': false},
      ],
    },
    {
      'questionText':
          'Qual linguagem de programação é amplamente usada para desenvolver aplicativos Android?',
      'answers': [
        {'text': 'Java', 'correct': true},
        {'text': 'C#', 'correct': false},
        {'text': 'Python', 'correct': false},
        {'text': 'Ruby', 'correct': false},
      ],
    },
    {
      'questionText': 'Qual protocolo de internet é usado para enviar e-mails?',
      'answers': [
        {'text': 'HTTP', 'correct': false},
        {'text': 'FTP', 'correct': false},
        {'text': 'SMTP', 'correct': true},
        {'text': 'TCP', 'correct': false},
      ],
    },
    {
      'questionText': 'O que é um firewall em relação à segurança da rede?',
      'answers': [
        {'text': 'Um software de edição de imagens', 'correct': false},
        {
          'text': 'Um dispositivo que impede o acesso não autorizado à rede',
          'correct': true
        },
        {'text': 'Um protocolo de criptografia', 'correct': false},
        {'text': 'Um navegador da web', 'correct': false},
      ],
    },
    {
      'questionText': 'Qual destes não é um tipo de armazenamento de dados?',
      'answers': [
        {'text': 'SSD', 'correct': false},
        {'text': 'GPU', 'correct': true},
        {'text': 'HDD', 'correct': false},
        {'text': 'USB', 'correct': false},
      ],
    },
    {
      'questionText':
          'Qual é a unidade básica de armazenamento em um computador?',
      'answers': [
        {'text': 'Byte', 'correct': true},
        {'text': 'Bit', 'correct': false},
        {'text': 'Gigabyte', 'correct': false},
        {'text': 'Kilobyte', 'correct': false},
      ],
    },
    {
      'questionText': 'Qual é a função principal de um sistema operacional?',
      'answers': [
        {'text': 'Gerenciar hardware e software', 'correct': true},
        {'text': 'Enviar e-mails', 'correct': false},
        {'text': 'Editar documentos', 'correct': false},
        {'text': 'Navegar na web', 'correct': false},
      ],
    },
    {
      'questionText': 'O que é um arquivo com a extensão ".pdf"?',
      'answers': [
        {'text': 'Uma planilha de dados', 'correct': false},
        {'text': 'Um arquivo de áudio', 'correct': false},
        {
          'text': 'Um documento portátil em formato de arquivo',
          'correct': true
        },
        {'text': 'Um arquivo de vídeo', 'correct': false},
      ],
    },
  ];

  void answerQuestion(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        score++;
      }
      questionIndex++;
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 153, 216),
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Color.fromARGB(255, 36, 124, 207),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: questionIndex < questions.length
          ? Quiz(
              questionIndex: questionIndex,
              questions: questions,
              answerQuestion: answerQuestion,
            )
          : Center(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 54, 143, 244), // Defina a cor de fundo para vermelho
                ),
                child: Result(score, resetQuiz, () {}),
              ),
            ),
    );
  }
}

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, dynamic>> questions;
  final Function answerQuestion;

  Quiz({
    required this.questionIndex,
    required this.questions,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Question(questions[questionIndex]['questionText'].toString()),
        ...(questions[questionIndex]['answers'] as List<Map<String, dynamic>>)
            .map((answer) {
          return Answer(
            answer['text'].toString(),
            () => answerQuestion(answer['correct']),
          );
        }).toList(),
      ],
    ));
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback selectHandler;

  Answer(this.answerText, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetHandler;
  final VoidCallback finishHandler;
  Result(this.score, this.resetHandler, this.finishHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Você acertou $score perguntas!',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetHandler,
            child: Text('Reiniciar o Quiz'),
          ),
          ElevatedButton(
              onPressed: finishHandler, child: Text('Finalizar o Quiz')),
        ],
      ),
    );
  }
}
