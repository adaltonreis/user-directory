import 'package:flutter/material.dart';
import 'package:users_directory/models/user/user.dart';
import 'package:users_directory/screens/configuration/configuration.dart';
import 'package:users_directory/screens/detail_sceren/detail_screen.dart';
import 'package:users_directory/screens/login_screen/login_screen.dart';
import '../screens/directory_screen/directory_screen.dart';
import '../screens/home_screen/home_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/';
  static const String directory = '/directory';
  static const String details = '/details';
  static const String config = '/config';
  static const String scan = '/scan';
  static const String forgotPassword = '/forgotPassword';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case directory:
        return MaterialPageRoute(builder: (_) => const DirectoryScreen());
      case details:
        final user = settings.arguments as User;
        return MaterialPageRoute(builder: (_) => DetailScreen(user: user));
      case config:
        return MaterialPageRoute(builder: (_) => const ConfigurationScreen());
      //case forgotPassword:
      //  return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.redAccent,
                        size: 80,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Under Construction',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'This screen hasn\'t been created yet',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.directory,
                            (route) => false,
                          );
                        },
                        icon: const Icon(Icons.home),
                        label: const Text('Directoty Screen'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 24,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.blueAccent,
                          elevation: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
    }
  }
}
