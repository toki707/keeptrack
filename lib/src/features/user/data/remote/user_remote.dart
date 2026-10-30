import 'dart:convert';
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/features/user/domain/user.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class UserService {
  static const url = 'http://127.0.0.1:3000';
  final users = <User>[];

  Future<List<User>> fetchUserList() async {
    try {
      final parsedUrl = Uri.parse('$url/api/users');
      final response = await http.get(parsedUrl);
      final statusCode = response.statusCode;
      if (statusCode != 200) {
        final message = 'Erreur survenue';
        throw Exception(message);
      }
      final data = jsonDecode(response.body) as List;
      users.clear();
      for (final v in data) {
        users.add(User.fromJson(v as Map<String, dynamic>));
      }
      return users;
    } catch (e) {
      rethrow;
    }
  }

  User fetchUserById(String userId) {
    return users.firstWhere((user) => user.id == userId);
  }
}

final usersRepositoryProvider = Provider<UserService>((ref) {
  return UserService();
});

final usersListFutureProvider = FutureProvider<List<User>>((ref) {
  final userRepository = ref.watch(usersRepositoryProvider);

  return userRepository.fetchUserList();
});