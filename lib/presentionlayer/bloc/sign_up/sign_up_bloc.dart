import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mynighborhood/domainlayer/entity/models.dart';
import 'package:mynighborhood/domainlayer/usecases/sign_up_user_usecase.dart';

// Define Events
part 'sign_up_event.dart';

// Define States
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUserUseCase signUpUserUseCase;

  SignUpBloc(this.signUpUserUseCase) : super(SignUpInitial()) {
    on<SignUpButtonPressedEvent>((event, emit) async {
      emit(SignUpLoading());
      try {
        final user = await signUpUserUseCase.execute(
          firstName: event.firstName,
          lastName: event.lastName,
          phoneNumber: event.phoneNumber,
          role: event.role,
        );
        emit(SignUpSuccess(user));
      } catch (error) {
        emit(SignUpFailure(error.toString()));
      }
    });
  }
}
