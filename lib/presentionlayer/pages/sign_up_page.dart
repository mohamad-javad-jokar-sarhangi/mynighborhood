import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynighborhood/dependency_injection.dart';
import 'package:mynighborhood/presentionlayer/bloc/sign_up/sign_up_bloc.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('User Registered: ${state.user.firstName}')),
              );
            } else if (state is SignUpFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          child: BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              if (state is SignUpLoading) {
                return Center(child: CircularProgressIndicator());
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                    ),
                    TextField(
                      controller: _lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                    ),
                    TextField(
                      controller: _phoneNumberController,
                      decoration: InputDecoration(labelText: 'Phone Number'),
                    ),
                    DropdownButtonFormField<String>(
                      items: [
                        DropdownMenuItem(value: 'Villager', child: Text('Villager')),
                        DropdownMenuItem(value: 'Driver', child: Text('Driver')),
                        DropdownMenuItem(value: 'Leader', child: Text('Leader')),
                        DropdownMenuItem(value: 'Seller', child: Text('Seller')),
                      ],
                      decoration: InputDecoration(labelText: 'Role'),
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<SignUpBloc>(context).add(
                          SignUpButtonPressedEvent(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            phoneNumber: _phoneNumberController.text,
                            role: 'Villager', // Set selected role here
                          ),
                        );
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
