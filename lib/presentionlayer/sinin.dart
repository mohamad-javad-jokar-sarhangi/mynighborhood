import 'package:flutter/material.dart';
import 'package:mynighborhood/presentionlayer/profile.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>(); // کلید فرم
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String? role; // نقش کاربر

  final List<String> roles = ['Villager', 'Driver', 'Leader', 'Seller']; // نقش‌ها

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // انتقال به صفحه پروفایل و ارسال اطلاعات
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            role: role!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // فیلد نام
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                onSaved: (value) {
                  firstName = value!;
                },
              ),
              SizedBox(height: 16),
              // فیلد نام خانوادگی
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
                onSaved: (value) {
                  lastName = value!;
                },
              ),
              SizedBox(height: 16),
              // فیلد شماره تماس
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length < 10) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneNumber = value!;
                },
              ),
              SizedBox(height: 16),
              // منوی کشویی نقش
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Role'),
                items: roles.map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a role';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    role = value as String?;
                  });
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
