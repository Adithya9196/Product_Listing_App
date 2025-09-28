///Working code
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_bloc.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_event.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_state.dart';
// import 'package:product_listing_app/LoginPage/UIPage/Otp_Screen.dart';
//
// class LoginScreen extends StatelessWidget {
//   final TextEditingController phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is AuthUserExists) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => OtpScreen(phone: state.phone, exists: true),
//               ),
//             );
//           } else if (state is AuthUserNotExists) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => OtpScreen(phone: state.phone, exists: false),
//               ),
//             );
//           }
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//               SizedBox(height: 20),
//               TextField(
//                 controller: phoneController,
//                 decoration: InputDecoration(labelText: "Enter Phone"),
//                 keyboardType: TextInputType.phone,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   context.read<AuthBloc>().add(VerifyUserEvent(phoneController.text));
//                 },
//                 child: Text("Continue"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/LoginPage/Logic/auth_bloc.dart';
import 'package:product_listing_app/LoginPage/Logic/auth_event.dart';
import 'package:product_listing_app/LoginPage/Logic/auth_state.dart';
import 'package:product_listing_app/LoginPage/UIPage/Otp_Screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthUserExists) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OtpScreen(phone: state.phone, exists: true),
              ),
            );
          } else if (state is AuthUserNotExists) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OtpScreen(phone: state.phone, exists: false),
              ),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Let's Connect with Lorem Ipsum..!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: const Text(
                        "+91",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Enter Phone",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      final phone = phoneController.text.trim();
                      if (phone.isNotEmpty) {
                        context.read<AuthBloc>().add(VerifyUserEvent(phone));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6C63FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text.rich(
                      TextSpan(
                        text: "By Continuing you accepting the ",
                        children: [
                          TextSpan(
                            text: "Terms of Use",
                            style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                          ),
                          TextSpan(text: " & "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
