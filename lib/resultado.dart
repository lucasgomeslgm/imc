import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});

  String get fraseResultado {
    if (pontuacao < 6) {
      return 'Conservador';
    } else if (pontuacao < 10) {
      return 'Moderado';
    } else {
      return 'Agressivo';
    }
  }

    String get textoResultado {
    if (pontuacao < 10) {
      return 'Esse perfil de investidor, em geral, opta por investimentos com baixa oscilação, pois prefere menos risco e mais segurança. Prefere manter sua carteira operando em renda fixa e tesouro direto, por exemplo.';
    } else if (pontuacao < 20) {
      return 'Esse perfil de investidor é o meio entre o arrojado e o conservador. Mesmo que ele considere a segurança, é muito mais tolerante a se arriscar. O meio-termo é, em geral, uma boa pedida.';
    } else {
      return 'Esse perfil de investidor, em geral, possui conhecimento sobre o mercado financeiro e está em busca de lucratividade e rentabilidade. Lida melhor com exposições ao risco para poder obter ganhos maiores que na inflação a médio e longo prazo.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 38,
            ),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
       Center(
          child: Text(
            textoResultado,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
      ],
    );
  }
}
