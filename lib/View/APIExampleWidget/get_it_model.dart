class User {
  final String name;
  final int age;

  User(this.name, this.age);
}

class UserRepository {
  Future<User> fetchUser() async {
    // 模擬獲取用戶數據的過程
    await Future.delayed(Duration(seconds: 2));
    return User("John Doe", 25);
  }
}

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  Future<User> getUser() async {
    return await _userRepository.fetchUser();
  }
}
