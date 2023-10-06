part of 'onboarding_status_cubit.dart';

abstract class OnboardingStatusState extends Equatable {
  const OnboardingStatusState();

  @override
  List<Object> get props => [];
}

class OnboardingStatusInitial extends OnboardingStatusState {}

class OnboardedUserState extends OnboardingStatusState {}

class NotOnboardedUserState extends OnboardingStatusState {}
