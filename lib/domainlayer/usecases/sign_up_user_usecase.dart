
import 'package:mynighborhood/domainlayer/entity/models.dart';
import 'package:mynighborhood/domainlayer/repositories/user_repository.dart';

class SignUpUserUseCase {
  final UserRepository userRepository;

  SignUpUserUseCase({required this.userRepository});

  Future<User> execute({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String role,
  }) async {
    // تهیه داده‌های مورد نیاز از ورودی‌های Use Case
    final Map<String, dynamic> userData = {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'role': role,
    };

    // ارسال داده‌ها به Repository برای ثبت‌نام
    return await userRepository.signUp(userData);
  }
}
