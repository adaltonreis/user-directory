import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_directory/blocs/user/user_bloc.dart';
import 'package:user_directory/blocs/user/user_state.dart';
import 'package:user_directory/routes/app_routes.dart';
import 'package:user_directory/themes/theme_bloc.dart';
import 'package:user_directory/widgets/custom_toogle.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void closeDrawer(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            final user = state.currentUser;
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.blueGrey[800] // dark theme: neutral background
                        : Theme.of(context)
                            .primaryColor, // light theme: keep primary
                  ),
                  accountName: Text(
                    "${user.firstName} ${user.lastName}",
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  accountEmail: Text(
                    user.email,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Colors.black54,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.directory);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.details,
                        arguments: user);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Configurations"),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.config);
                  },
                ),
                const Divider(),
                CustomToggle(
                  title: "Enable Notifications",
                  initialValue: true,
                  onChanged: (val) {
                    // handle state change
                    debugPrint("Notifications toggled: $val");
                  },
                ),
                CustomToggle(
                  title: "Dark Mode",
                  initialValue: false,
                  onChanged: (val) {
                    context.read<ThemeBloc>().add(ThemeEvent.toggle);
                    debugPrint("Dark mode: $val");
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      closeDrawer(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "App self-closing is not supported by Apple. Swipe up instead."),
                      ));
                    }
                  },
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
