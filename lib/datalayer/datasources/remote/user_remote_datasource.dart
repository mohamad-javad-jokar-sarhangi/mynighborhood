import 'package:dio/dio.dart';
import 'package:mynighborhood/domainlayer/entity/models.dart';



abstract class UserRemoteDataSource {
  Future<User> signUpUser(Map<String, dynamic> userData);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<User> signUpUser(Map<String, dynamic> userData) async {
    try {
      final response = await dio.post(
        'https://your-api-url.com/api/users/signup/', // آدرس API ثبت‌نام
        data: userData,
      );

      // تبدیل JSON پاسخ به مدل User
      return User.fromJson(response.data);
    } catch (error) {
      throw Exception('Error signing up user: ${error.toString()}');
    }
  }
}
