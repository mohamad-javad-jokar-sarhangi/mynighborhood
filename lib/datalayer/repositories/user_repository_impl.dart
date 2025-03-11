import 'package:mynighborhood/datalayer/datasources/remote/user_remote_datasource.dart';
import 'package:mynighborhood/domainlayer/entity/models.dart';
import 'package:mynighborhood/domainlayer/repositories/user_repository.dart';


class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> signUp(Map<String, dynamic> userData) async {
    try {
      // ارسال داده‌ها به Remote Data Source و دریافت جواب
      return await remoteDataSource.signUpUser(userData);
    } catch (error) {
      throw Exception('Error in UserRepository: ${error.toString()}');
    }
  }
}
