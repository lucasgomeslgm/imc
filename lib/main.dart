import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [

    {
      'texto': 'Qual o seu principal objetivo ao investir seu dinheiro?',
      'respostas': [
        {'texto': 'Preservar meu patrimônio assumindo um menor risco', 'pontuacao': 1},
        {'texto': 'Uma combinação entre preservação do patrimônio e sua valorização', 'pontuacao': 2},
        {'texto': 'Maximizar os pontencias de ganho', 'pontuacao': 3},
      ],
    },
    {
      'texto': 'Em qual frequencia você pretende investir?',
      'respostas': [
        {'texto': 'Todo mês', 'pontuacao': 1},
        {'texto': 'Quando eu lembrar, ou quando estiver um dinheiro sobrando', 'pontuacao': 2},
        {'texto': 'Investir toda vez que aparecer uma oportunidade', 'pontuacao': 3},
      ],
    },
     {
      'texto': 'Por quanto tempo pretende deixar seu dinheiro investido?',
      'respostas': [
        {'texto': '1 ano ou menos', 'pontuacao': 3},
        {'texto': '1 a 10 anos', 'pontuacao': 2},
        {'texto': 'Para toda a vida', 'pontuacao': 1},
      
      ],
    },
    {
      'texto': 'Em um momento de queda geral no mercado?',
      'respostas': [
        {'texto': 'Venderia meus ativos', 'pontuacao': 1},
        {'texto': 'Analisaria o motivo da queda', 'pontuacao': 2},
        {'texto': 'Compraria mais ativos', 'pontuacao': 3},
      ],
    },
    
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Teste de perifl investidor'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
