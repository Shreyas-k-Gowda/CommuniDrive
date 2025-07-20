import 'package:communidrive/src/detailspg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

String phoneNumber = '';

class PhoneNo extends StatefulWidget {
  const PhoneNo({super.key});

  @override
  State<PhoneNo> createState() => _PhoneNoState();
}

class _PhoneNoState extends State<PhoneNo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 125,
                  width: 200,
                  color: Colors.amberAccent,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3oo0tHTZ0hgXIfdUjC7TIeTOCXhUpvRBd3g&s",
                    width: 50,
                    height: 40,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: const Text(
                    "Hey!!! welcome to comunidrive experice the sharing"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 100),
                padding: const EdgeInsets.all(10),
                child: const PhoneNumberInput(),
              ),
              const SubmitButton(),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Login/Signup"),
        const SizedBox(height: 8),
        IntlPhoneField(
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            hintText: '1234567890',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 87, 52)),
            ),
          ),
          initialCountryCode: 'IN',
          onChanged: (phone) {
            phoneNumber = phone.completeNumber;
          },
        ),
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const OTPVerificationDialog();
            });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color.fromARGB(255, 255, 87, 52), // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Border radius
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 24, vertical: 12), // Button padding
      ),
      child: const Text(
        'Submit',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class OTPVerificationDialog extends StatelessWidget {
  const OTPVerificationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }

  contentBox(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.close, color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Verify OTP',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter the 4-digit OTP sent to your phone number-$phoneNumber',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              OtpTextField(
                numberOfFields: 4,
                borderColor: const Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  // Handle code changes
                },
                onSubmit: (String verificationCode) {
                  // Handle OTP verification
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Handle resend OTP
                },
                child: const Text('Resend OTP',
                    style: TextStyle(color: Colors.blue)),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserInputForm()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 255, 87, 52), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Border radius
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12), // Button padding
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
