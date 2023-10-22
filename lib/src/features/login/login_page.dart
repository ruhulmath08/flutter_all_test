import 'package:flutter/material.dart';
import 'package:flutter_all_test/src/core/routes/routing_constants.dart';
import 'package:flutter_all_test/src/features/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(loginPageTitle),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildEmailField(),
            const SizedBox(height: 15),
            _buildPasswordField(),
            const SizedBox(height: 20),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Email'),
          ),
          onChanged: (String email) => LoginBloc().add(
            ChangeEmailEvent(email: email),
          ),
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Password'),
          ),
          onChanged: (String password) => LoginBloc().add(
            ChangePasswordEvent(password: password),
          ),
        );
      },
    );
  }

  Widget _buildLoginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.loginStatus != current.loginStatus,
      builder: (context, state) {
        if (state.loginStatus == LoginStatus.loading) {
          return const CircularProgressIndicator.adaptive();
        } else {
          return ElevatedButton(
            onPressed: () => LoginBloc().add(SubmitLoginEvent()),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(120, 60),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text(loginPageTitle),
          );
        }
      },
    );
  }
}
