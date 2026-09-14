import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/constants/test_users.dart';
import 'package:keeptrack/src/features/user/domain/user.dart';

class FakeUsersRepository {
  final List<User> _users = testUsers;

  List<User> getUsersList() {
    return _users;
  }

  User getUserById(String userId) {
    final user = _users.firstWhere((user) => user.id == userId);

    return user;
  }

  void addUserPerformance(String userId){

  }
}

final fakeUsersRepositoryProvider = Provider<FakeUsersRepository>((ref) {
  return FakeUsersRepository();
});
