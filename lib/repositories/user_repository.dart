import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user/user.dart';

class UserDummyRepository {
  // Simulate fetching a list of users from a backend
  Future<List<User>> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network delay

    return [
      User(
        id: 1,
        email: 'john.doe@example.com',
        firstName: 'John',
        lastName: 'Doe',
        avatar: 'https://i.pravatar.cc/150?img=1',
      ),
      User(
        id: 2,
        email: 'jane.smith@example.com',
        firstName: 'Jane',
        lastName: 'Smith',
        avatar: 'https://i.pravatar.cc/150?img=2',
      ),
      User(
        id: 3,
        email: 'alice.wang@example.com',
        firstName: 'Alice',
        lastName: 'Wang',
        avatar: 'https://i.pravatar.cc/150?img=3',
      ),
    ];
  }

  // Optional: fetch single user by ID
  Future<User> fetchUserById(int id) async {
    final users = await fetchUsers();
    return users.firstWhere((user) => user.id == id);
  }
}

class UserRepository {
  final String baseUrl = "https://reqres.in/api/users";

  Future<List<User>> fetchUsers({int page = 1, int perPage = 20}) async {
    final response = await http.get(
        Uri.parse('$baseUrl?page=$page&per_page=$perPage'),
        headers: {'x-api-key': 'reqres-free-v1'});

    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      final List<dynamic> data = body['data'];

      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }
}
