import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required final UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(ProfileInitial());

  final UserRepository _userRepository;

  Future<void> getUserProfile() async {}
}
