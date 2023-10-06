import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp/features/user_session/domain/repositories/user_session_repository.dart';

part 'onboarding_status_state.dart';

class OnboardingStatusCubit extends Cubit<OnboardingStatusState> {
  OnboardingStatusCubit({required this.userSessionRepository}) : super(OnboardingStatusInitial());

  final UserSessionRepository userSessionRepository;

  Future<bool> checkUserIsOnboarded() async {
    final isUserOnboarded = (await userSessionRepository.checkUserIsOnboarded()).fold(
      (failure) => null,
      (isOnboarded) => isOnboarded,
    );
    return isUserOnboarded!;
  }

  Future<void> setUserIsOnboarded(bool isOnboarded) async {
    await userSessionRepository.setUserIsOnboarded(isOnboarded);
  }
}
