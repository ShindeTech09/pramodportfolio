import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pramod_portfolio/constants/footer_widget.dart';
import 'package:pramod_portfolio/constants/form_text_box.dart';
import 'package:pramod_portfolio/constants/widget_values.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  void _submitForm() {
    FirebaseFirestore.instance
        .collection('contacts')
        .add({
          'name': _nameController.text,
          'phone': _phoneController.text,
          'email': _emailController.text,
          'description': _descController.text,
        })
        .then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Form submitted successfully!')),
          );
          _nameController.clear();
          _phoneController.clear();
          _emailController.clear();
          _descController.clear();
        })
        .catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to submit form: $error')),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: screenWidth > 1024 ? true : false,
      appBar: WidgetValues.appBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Flex(
            direction: Axis.vertical,
            children: [
              const Gap(180),
              SizedBox(
                width:
                    screenWidth > 1024
                        ? 900
                        : screenWidth > 768
                        ? 500
                        : 300,
                child: Text(
                  "Let’s turn your ideas into reality – connect with us today and let the magic begin! ✨",
                  softWrap: true,
                  style: TextStyle(
                    fontSize:
                        screenWidth > 1024
                            ? 40
                            : screenWidth > 768
                            ? 30
                            : 24, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Gap(30),
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth > 1024
                            ? 400
                            : screenWidth > 768
                            ? 200
                            : 20,
                    vertical:
                        screenWidth > 1024
                            ? 50
                            : screenWidth > 768
                            ? 30
                            : 20,
                  ),
                  child: Column(
                    children: [
                      FormTextBox(
                        controller: _nameController,
                        screenWidth: screenWidth,
                        labelText: 'Name',
                        hintText: 'Enter your name',
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter your name";
                          } else if (value.length < 3) {
                            return "Enter a valid name";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                      ),
                      const Gap(20),
                      FormTextBox(
                        controller: _phoneController,
                        screenWidth: screenWidth,
                        labelText: 'Phone Number',
                        hintText: 'Enter your number',
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter your phone number";
                          } else if (value.length < 10) {
                            return "Enter a valid phone number";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                      ),
                      const Gap(20),

                      FormTextBox(
                        controller: _emailController,
                        screenWidth: screenWidth,
                        labelText: 'Email',
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter your email ID";
                          } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          ).hasMatch(value)) {
                            return "Enter a valid email ID";
                          }
                          return null;
                        },
                        hintText: 'Enter your email ID',
                        keyboardType: TextInputType.emailAddress,
                      ),

                      const Gap(20),
                      FormTextBox(
                        controller: _descController,
                        screenWidth: screenWidth,
                        labelText: 'Description',
                        hintText: 'Enter your description',
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter your description";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                      ),
                      const Gap(20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle form submission
                            _submitForm();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                screenWidth > 1024
                                    ? 40
                                    : screenWidth > 768
                                    ? 30
                                    : 20,
                            vertical:
                                screenWidth > 1024
                                    ? 20
                                    : screenWidth > 768
                                    ? 15
                                    : 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize:
                                screenWidth > 1024
                                    ? 25
                                    : screenWidth > 768
                                    ? 22
                                    : 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(80),
              FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
