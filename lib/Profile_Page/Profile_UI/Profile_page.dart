import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/Profile_Page/Data/profile_api.dart';
import 'package:product_listing_app/Profile_Page/Logic/profile_bloc.dart';
import 'package:product_listing_app/Profile_Page/Logic/profile_state.dart';

import '../Logic/profile_event.dart';

class ProfilePage extends StatelessWidget {
  final String token;

  const ProfilePage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(ProfileRepository(token: token))
        ..add(FetchProfile()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'My Profile',
              style: TextStyle(color: Colors.black87),
            ),
            automaticallyImplyLeading: false,
          ),
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProfileLoaded) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name',
                          style:
                              TextStyle(color: Colors.black45, fontSize: 18,fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        state.profile.name,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Text('Phone',
                          style:
                              TextStyle(color: Colors.black45, fontSize: 18,fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('+91 ${state.profile.phoneNumber}',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              } else if (state is ProfileError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
