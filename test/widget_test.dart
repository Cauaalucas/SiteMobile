import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('Verifica se os botões de navegação estão na HomeScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    expect(find.text('Cadastrar Cliente'), findsOneWidget);
    expect(find.text('Cadastrar Serviço'), findsOneWidget);
  });
}
