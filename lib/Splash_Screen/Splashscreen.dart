//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:product_listing_app/HomePage/Homepage.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_bloc.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_event.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_state.dart';
// import 'package:product_listing_app/LoginPage/UIPage/Loginscreen.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//
//     // Trigger check for saved token
//     context.read<AuthBloc>().add(CheckAuthStatusEvent());
//
//     // Optional: Add delay for branding splash
//     Future.delayed(Duration(seconds: 2), () {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         if (state is Authenticated) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (_) => Homepage(token: state.token),
//             ),
//           );
//         } else if (state is Unauthenticated) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (_) => LoginScreen()),
//           );
//         }
//       },
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               FlutterLogo(size: 100),
//               SizedBox(height: 20),
//               Text(
//                 "MyApp",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               CircularProgressIndicator(),
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
import 'package:product_listing_app/LoginPage/UIPage/Loginscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(CheckAuthStatusEvent());
    Future.delayed(const Duration(seconds: 2), () {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
       if (state is Authenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => Homepage(token: state.token),
            ),
          );
        } else if (state is Unauthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
          );
        }
     },
      child: Scaffold(
        backgroundColor: Colors.white, // white background
        body: Center(
          child: GradientLogo()
        ),
      ),
    );
  }
}



class GradientLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.blue, Colors.purple, Colors.pink],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(bounds),
      child: Text(
        "Logo",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white, // required for gradient
        ),
      ),
    );
  }
}
