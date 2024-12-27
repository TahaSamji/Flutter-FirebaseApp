import 'package:flutter/material.dart';
import 'package:myapp/auth/signupPage.dart';
import 'package:myapp/service/authService.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final AuthService authService = AuthService();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
              );
            },
            child: const Text(
              "SignUp",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    final String? response = await authService.login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                    print(response);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(response ?? 'An error occurred'),
                        backgroundColor:
                            response == "Success" ? Colors.green : Colors.red,
                      ),
                    );

                    if (response == "Success") {
                      Navigator.pushNamed(context, '/products');
                    }
                  }
                },
                child: const Text('login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
