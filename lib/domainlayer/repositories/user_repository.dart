import 'package:mynighborhood/domainlayer/entity/models.dart';

abstract class UserRepository {
  Future<User> signUp(Map<String, dynamic> userData);
}
