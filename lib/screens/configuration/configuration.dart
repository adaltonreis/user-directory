// lib/screens/configuration_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_directory/themes/theme_bloc.dart';
import 'package:users_directory/widgets/custom_toogle.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  bool autoSyncEnabled = true;

  void toogleDarkMode(BuildContext ctx) {
    ctx.read<ThemeBloc>().add(ThemeEvent.toggle);
  }

  void toogleAutoSyncData(BuildContext ctx) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Auto sync Data toogled')));
  }

  void toogleNotificationEnabled(BuildContext ctx) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Notification toogled')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuration"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "General Settings",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Notifications toggle
          CustomToggle(
            title: "Enable Notifications",
            onChanged: (_) => toogleNotificationEnabled(context),
          ),
          const Divider(),

          // Dark mode toggle
          CustomToggle(
            title: "Dark Mode",
            onChanged: (_) => toogleDarkMode(context),
          ),
          const Divider(),

          // Auto sync toggle
          CustomToggle(
            title: "Auto Sync Data",
            onChanged: (_) => toogleAutoSyncData(context),
          ),

          const SizedBox(height: 40),
          const Text(
            "Account",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile Settings"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to Profile Settings screen
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to Change Password screen
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {
              // TODO: implement
            },
          ),
        ],
      ),
    );
  }
}
