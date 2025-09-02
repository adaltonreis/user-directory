import 'package:flutter/material.dart';
import 'package:users_directory/routes/app_routes.dart';
import 'package:users_directory/widgets/custom_bottom_bar.dart';
import '../../models/user/user.dart';

class DetailScreen extends StatelessWidget {
  final User user;

  const DetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${user.firstName}'s Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue.shade100,
              backgroundImage: NetworkImage(user.avatar),
              // child: Text(
              //   '${user.firstName.substring(0, 1).toUpperCase()} ${user.lastName.substring(0, 1).toUpperCase()}',
              //   style: TextStyle(
              //     fontSize: 50,
              //     fontWeight: FontWeight.bold,
              //     color: Theme.of(context).brightness == Brightness.dark
              //         ? Colors.white
              //         : Colors.black,
              //   ),
              // ),
            ),
            const SizedBox(height: 30),

            // Name
            Text(
              "${user.firstName} ${user.lastName}",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            const SizedBox(height: 10),

            // Email
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.email, size: 22, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Info Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildInfoCard(Icons.person, "ID", user.id.toString()),
                  _buildInfoCard(Icons.settings, "Role", "N/A"),
                  _buildInfoCard(Icons.phone, "Phone", "N/A"),
                  _buildInfoCard(Icons.location_on, "Location", "N/A"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        onLeftPressed: () => Navigator.pushNamed(context, AppRoutes.directory),
        onCenterPressed: () => Navigator.pushNamed(context, AppRoutes.scan),
        onRightPressed: () =>
            Navigator.pushNamed(context, AppRoutes.config, arguments: user),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.blueAccent),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
