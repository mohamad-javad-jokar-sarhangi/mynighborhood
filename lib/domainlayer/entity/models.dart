import 'dart:convert';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.role,
  });

  // تبدیل از JSON به User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      role: json['role'],
    );
  }

  // تبدیل User به JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'role': role,
    };
  }
}

// مدل کلاس Villager
class Villager {
  final User user;

  Villager({required this.user});

  // تبدیل از JSON به Villager
  factory Villager.fromJson(Map<String, dynamic> json) {
    return Villager(
      user: User.fromJson(json['user']),
    );
  }

  // تبدیل Villager به JSON
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
    };
  }
}

// مدل کلاس Driver
class Driver {
  final User user;
  final String? licenseNumber;

  Driver({required this.user, this.licenseNumber});

  // تبدیل از JSON به Driver
  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      user: User.fromJson(json['user']),
      licenseNumber: json['license_number'],
    );
  }

  // تبدیل Driver به JSON
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'license_number': licenseNumber,
    };
  }
}

// مدل کلاس Leader
class Leader {
  final User user;
  final String? position;

  Leader({required this.user, this.position});

  // تبدیل از JSON به Leader
  factory Leader.fromJson(Map<String, dynamic> json) {
    return Leader(
      user: User.fromJson(json['user']),
      position: json['position'],
    );
  }

  // تبدیل Leader به JSON
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'position': position,
    };
  }
}

// مدل کلاس Seller
class Seller {
  final User user;
  final String? shopName;

  Seller({required this.user, this.shopName});

  // تبدیل از JSON به Seller
  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      user: User.fromJson(json['user']),
      shopName: json['shop_name'],
    );
  }

  // تبدیل Seller به JSON
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'shop_name': shopName,
    };
  }
}
