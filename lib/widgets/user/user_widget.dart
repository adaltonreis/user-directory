import 'package:flutter/material.dart';
import 'package:user_directory/routes/app_routes.dart';
import 'package:user_directory/screens/detail_sceren/detail_screen.dart';
import '../../models/user/user.dart';

class UserWidget extends StatelessWidget {
  final User user;
  final bool detailed; // true = show full details, false = compact

  const UserWidget({super.key, required this.user, this.detailed = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: detailed ? _buildDetailed(context) : _buildCompact(context),
      ),
    );
  }

  Widget _buildCompact(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
      title: Text(user.firstName),
      subtitle: Text(user.email),
      trailing: IconButton(
        icon: const Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.details,
            arguments: user,
          );
        },
      ),
    );
  }

  Widget _buildDetailed(BuildContext context) {
    // Example detailed view with the arrow button
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(user.avatar),
          radius: 30,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.firstName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(user.email),
              // Add more detailed fields if needed
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            //Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(user: user),
              ),
            );
          },
        ),
      ],
    );
  }
}
