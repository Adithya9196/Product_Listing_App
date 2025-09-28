/// Working code
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_bloc.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_event.dart';
// import 'package:product_listing_app/LoginPage/Logic/auth_state.dart';
// import 'package:product_listing_app/LoginPage/UIPage/Name_Screen.dart';
//
// class OtpScreen extends StatelessWidget {
//   final String phone;
//   final bool exists;
//   final TextEditingController otpController = TextEditingController();
//
//   OtpScreen({required this.phone, required this.exists});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is AuthOtpVerified) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                   content: Text("Login Successful! Token: ${state.token}")),
//             );
//           } else if (state is AuthNeedsName) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => NameScreen(phone: state.phone),
//               ),
//             );
//           } else if (state is AuthFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message)),
//             );
//           }
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("OTP Verification"),
//               SizedBox(height: 20),
//               TextField(
//                 controller: otpController,
//                 decoration: InputDecoration(labelText: "Enter OTP"),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   context.read<AuthBloc>().add(
//                         SubmitOtpEvent(
//                           phone: phone,
//                           otp: otpController.text,
//                           exists: exists,
//                         ),
//                       );
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
import 'package:product_listing_app/LoginPage/Logic/auth_bloc.dart';
import 'package:product_listing_app/LoginPage/Logic/auth_event.dart';
import 'package:product_listing_app/LoginPage/Logic/auth_state.dart';
import 'package:product_listing_app/LoginPage/UIPage/Name_Screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  final bool exists;

  OtpScreen({required this.phone, required this.exists});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  int seconds = 120;
  late final _timer;

  @override
  void initState() {
    super.initState();
    _timer = Stream.periodic(Duration(seconds: 1), (count) => count)
        .listen((count) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    otpController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthOtpVerified) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login Successful! Token: ${state.token}"),
              ),
            );
          } else if (state is AuthNeedsName) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NameScreen(phone: state.phone),
              ),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,color: Colors.black45,),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "OTP VERIFICATION",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Enter the OTP sent to - ${widget.phone}",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 60,
                    fieldWidth: 60,
                    inactiveColor: Colors.grey.shade300,
                    selectedColor: Colors.deepPurpleAccent,
                    activeColor: Colors.grey.shade400,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                  ),
                  enableActiveFill: true,
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                Text(
                  "00:${seconds.toString().padLeft(2, '0')} Sec",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t receive code ? "),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          seconds = 120;
                        });
                      },
                      child: Text(
                        "Re-send",
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        SubmitOtpEvent(
                          phone: widget.phone,
                          otp: otpController.text,
                          exists: widget.exists,
                        ),
                      );
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
