import 'package:flutter/material.dart';
import 'package:flutter_all_test/src/core/routes/routing_constants.dart';
import 'package:flutter_all_test/src/features/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
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
      ),
    );
  }

  Widget _buildEmailField() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('login_email'),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Email'),
            hintText: 'ruhul@gmail.com',
          ),
          onChanged: (String email) => context.read<LoginBloc>().add(
                ChangeEmailEvent(email: email),
              ),
          validator: (String? email) =>
              email!.isNotEmpty ? null : 'Email cannot be empty',
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          key: const Key('login_password'),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Password'),
            hintText: '123456',
          ),
          onChanged: (String password) => context.read<LoginBloc>().add(
                ChangePasswordEvent(password: password),
              ),
          validator: (String? password) =>
              password!.isNotEmpty ? null : 'Password cannot be empty',
        );
      },
    );
  }

  Widget _buildLoginButton() {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.loginStatus != current.loginStatus,
      listener: (BuildContext context, LoginState state) {
        if (state.loginStatus == LoginStatus.success) {
          Navigator.pushNamed(context, homePageRoute);
        } else if (state.loginStatus == LoginStatus.fail) {
          Fluttertoast.showToast(msg: state.errorMessage);
        }
      },
      buildWhen: (previous, current) =>
          previous.loginStatus != current.loginStatus,
      builder: (context, state) {
        if (state.loginStatus == LoginStatus.loading) {
          return const CircularProgressIndicator.adaptive();
        } else {
          return ElevatedButton(
            key: const Key('login_button'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(SubmitLoginEvent());
              }
            },
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
