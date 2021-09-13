import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required final UserRepository userRepository,
    required final AuthenticationRepository authenticationRepository,
  })  : _userRepository = userRepository,
        _authenticationRepository = authenticationRepository,
        super(const ProfileInitial());

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  Future<void> getUserProfile() async {
    emit(const ProfileLoading());

    try {
      final uid =  _authenticationRepository.currentUser!.uid;

      final user = await _userRepository.getUser(uid);
      emit(ProfileLoaded(user));
    } on Exception {
      emit(const ProfileLoadFailure());
    }
  }
}
