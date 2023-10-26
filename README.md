# flutter_all_test

A new Flutter project for unit, widget and integration test.

## [Integration test](https://perpet.io/blog/how-to-test-a-flutter-app-unit-ui-integration-and-bloc-tests/)

1. Create two folder in project root `integration_test` and `test_driver` and mark directory as "Source root"
2. Add the dependency (The integration_test package moved into the Flutter SDK (2.0).)
3. Create a main function `integration_test_driver.dart` and execute the integrationDriver function
4. Add the IntegrationTestWidgetsFlutterBinding and .ensureInitialized }
5. Create your test case
6. Execute the app.main() function
7. Wait until the app has settled
8. create finders for email, password and login §
9. Enter text for the email address
10. Enter text for the password
11. Tap on the login button and wait till it settled
