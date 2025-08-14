import 'package:agropulse/presentation/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}


class _SignupPageState extends State<SignupPage> {
  Country? _selectedCountry;
  final TextEditingController phoneNumberController = TextEditingController();

  void _pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true, 
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        }
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up Page"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 60, 20, 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Enter your phone number",
              style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  GestureDetector(
                    onTap: _pickCountry,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFFAFE9E7)),
                        color: Colors.white
                      ),
                      child: Row(
                        children: [
                          Text(
                            _selectedCountry != null ?  _selectedCountry!.flagEmoji : "🌍",
                          ),
                          SizedBox(width: 4,),
                          Icon(
                            Icons.expand_more, 
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.black,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(0xFFAFE9E7))
                        ),
                        hintText: "Enter phone number",
                        prefixText: _selectedCountry != null ? '+${_selectedCountry!.phoneCode} ' : ' ',
                        prefixStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 18,),
              CustomButton(
                text: "Sign up", 
                onPressed: () {}
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1,),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('OR',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold 
                      ),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1,),
                  )
                ],
              ),
              SizedBox(height: 30,),
              ElevatedButton.icon(
                onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                icon: const FaIcon(FontAwesomeIcons.apple, size: 20),
                label: const Text("Sign in with Apple"),
              ),
              SizedBox(height: 18,),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.grey),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red, size: 20), 
                label: const Text("Sign in with Google"))
            ],
          ),
        ),
      )
    );
  }
}