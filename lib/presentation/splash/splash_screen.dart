import 'package:agropulse/presentation/auth/role_selection.dart';
import 'package:agropulse/presentation/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void switchScreen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const RoleSelectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, 
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/images/agropulse_logo.jpg',
                        fit: BoxFit.contain, // keeps full logo visible
                      ),
                    ),

                  const SizedBox(height: 30),

                  Text(
                    'Connecting Farmers, Vets & Buyers',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Description
                  Text(
                    'A safe, trusted way to buy and sell healthy livestock, '
                    'powered by community, care, and convenience.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Button
                  CustomButton(
                    text: 'Get Started',
                    onPressed: () => switchScreen(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
