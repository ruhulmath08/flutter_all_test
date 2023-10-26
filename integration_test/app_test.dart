import 'package:flutter/cupertino.dart';
import 'package:flutter_all_test/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Full app test', (tester) async {
    app.main();
    //no animation is running, no entering of some data or anything
    await tester.pumpAndSettle();

    final emailField = find.byKey(const Key('login_email'));
    final emailPassword = find.byKey(const Key('login_password'));
    final loginButton = find.byKey(const Key('login_button'));

    await tester.enterText(emailField, 'ruhul@gmail.com');
    await tester.enterText(emailPassword, '123456');
    await tester.pumpAndSettle();

    await tester.tap(loginButton);
    await tester.pumpAndSettle();
  });
}
