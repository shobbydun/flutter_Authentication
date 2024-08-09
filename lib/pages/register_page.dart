import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/components/my_button.dart';
import 'package:flutter_authentication/components/my_textfield.dart';
import 'package:flutter_authentication/components/square_tile.dart';
import 'package:flutter_authentication/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // TextEditingController instances for username and password
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Loading state
  bool isLoading = false;

  // Method to handle sign-up action
  void signUserUp() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Confirm if both passwords are equal
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // Optionally navigate to another page or show a success message
      } else {
        // Show error message
        showErrorMessage("Passwords don't match❌");
      }
    } on FirebaseAuthException catch (e) {
      // Show error message
      showErrorMessage(e.message ?? 'An error occurred');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Error on email and password popup
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 247, 112, 112),
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          SingleChildScrollView(
            // To make the column scrollable when keyboard appears
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 70),

                  // Logo
                  const Icon(
                    Icons.person,
                    size: 100,
                  ),

                  const SizedBox(height: 20),

                  // Welcome back text
                  Text(
                    "Let's get Started💪",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),

                  const SizedBox(height: 15),

                  // Email TextField
                  MyTextfield(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // Password TextField
                  MyTextfield(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // Confirm Password
                  MyTextfield(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  // Sign up button
                  MyButton(
                    text: "Sign up",
                    onTap: signUserUp,
                  ),

                  const SizedBox(height: 50),

                  // Or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or continue with, ",
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Google or Apple sign-in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google button
                      SquareTile(
                        imagePath: 'lib/images/google.png',
                        onTap: () => AuthService().signInWithGoogle(),
                      ),

                      const SizedBox(width: 25),

                      // Apple button
                      SquareTile(
                        imagePath: 'lib/images/apple.png',
                        onTap: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // Already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Login now",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
