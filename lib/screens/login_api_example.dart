import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/login_api_provider.dart';
import 'package:provider_state_management/screens/home.dart';

class LoginRESTAPIwithProvider extends StatefulWidget {
  const LoginRESTAPIwithProvider({super.key});

  @override
  State<LoginRESTAPIwithProvider> createState() =>
      _LoginRESTAPIwithProviderState();
}

class _LoginRESTAPIwithProviderState extends State<LoginRESTAPIwithProvider> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginApiProvider = Provider.of<LoginApiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.deepPurple[400],
        title: const Text('Loign API', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                suffixIcon: IconButton(
                  onPressed: () {
                    loginApiProvider.toggle();
                  },
                  icon: Icon(
                    loginApiProvider.isObscure
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
              obscureText: loginApiProvider.isObscure,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                loginApiProvider.login(
                  emailController.text,
                  passwordController.text,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Login Successful'),
                    duration: Duration(milliseconds: 500),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: loginApiProvider.loading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
