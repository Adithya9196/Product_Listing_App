//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:product_listing_app/HomePage/Homepage.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_bloc.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_event.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_state.dart';
//
// class NameScreen extends StatefulWidget {
//   final String phone;
//   const NameScreen({super.key, required this.phone});
//
//   @override
//   _NameScreenState createState() => _NameScreenState();
// }
//
// class _NameScreenState extends State<NameScreen> {
//   late TextEditingController nameController;
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is Authenticated) {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (_) => Homepage(token: state.token),
//                 ),
//               );
//           } else if (state is AuthFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message ?? "Registration Failed")),
//             );
//           }
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: "Enter Full Name"),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   final name = nameController.text.trim();
//                   if (name.isNotEmpty) {
//                     context.read<AuthBloc>().add(
//                       RegisterUserEvent(
//                         phone: widget.phone,
//                         name: name,
//                       ),
//                     );
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Please enter your name")),
//                     );
//                   }
//                 },
//                 child: Text("Submit"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/// Working code
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:product_listing_app/HomePage/Homepage.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_bloc.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_event.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_state.dart';
//
// class NameScreen extends StatefulWidget {
//   final String phone;
//   const NameScreen({super.key, required this.phone});
//
//   @override
//   _NameScreenState createState() => _NameScreenState();
// }
//
// class _NameScreenState extends State<NameScreen> {
//   late TextEditingController nameController;
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is Authenticated) {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (_) => Homepage(token: state.token),
//                 ),
//               );
//             });
//           } else if (state is AuthFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message ?? "Registration Failed")),
//             );
//           }
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: "Enter Full Name"),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   final name = nameController.text.trim();
//                   if (name.isNotEmpty) {
//                     context.read<AuthBloc>().add(
//                       RegisterUserEvent(
//                         phone: widget.phone,
//                         name: name,
//                       ),
//                     );
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Please enter your name")),
//                     );
//                   }
//                 },
//                 child: Text("Submit"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/HomePage/Homepage.dart';
import 'package:product_listing_app/LoginPage/Logic/auth_bloc.dart';
import 'package:product_listing_app/LoginPage/Logic/auth_event.dart';
import 'package:product_listing_app/LoginPage/Logic/auth_state.dart';

class NameScreen extends StatefulWidget {
  final String phone;

  const NameScreen({super.key, required this.phone});

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => Homepage(token: state.token),
                ),
              );
            });
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? "Registration Failed")),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black45,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Enter Full Name",
                        labelStyle: TextStyle(color: Colors.black54),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final name = nameController.text.trim();
                          if (name.isNotEmpty) {
                            context.read<AuthBloc>().add(
                                  RegisterUserEvent(
                                    phone: widget.phone,
                                    name: name,
                                  ),
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please enter your name")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6C63FF), // purple
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
