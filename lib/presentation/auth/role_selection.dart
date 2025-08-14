import 'package:agropulse/presentation/auth/signup_page.dart';
import 'package:agropulse/presentation/consumer/consumer_page.dart';
// import 'package:agropulse/presentation/farmer/farmer_page.dart';
import 'package:agropulse/presentation/vet/vet_page.dart';
import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? _selectedRole;

  final List<Map<String, dynamic>> roles = [
    {"label": "Farmer", "icon": Icons.agriculture, "page": SignupPage()},
    {"label": "Consumer", "icon": Icons.shopping_cart, "page": ConsumerPage()},
    {"label": "Vet", "icon": Icons.medical_services, "page": VetPage()},
  ];

  void _selectRole(Map<String, dynamic> role) {
    setState(() {
      _selectedRole = role["label"];
    });

    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => role["page"]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Select Your Role'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("How do you intend to use this platform?",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
              ...roles.map((role) {
                final isSelected = _selectedRole == role["label"];
                return GestureDetector(
                  onTap: () => _selectRole(role),
                  child: AnimatedScale(
                    scale: isSelected ? 1.05 : 1.0,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? Colors.teal : Colors.grey,
                          width: isSelected ? 2 : 1
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.transparent,
                            blurRadius: 6,
                            offset: const Offset(0, 3)
                          )
                        ]
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              role["label"],
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 32,
                            color: isSelected ? Colors.teal : Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          )
        ),
    );
  }
}
