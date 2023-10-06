import 'package:auto_route/auto_route.dart';
import 'package:weatherapp/features/user_session/cubits/onboarding_status_cubit/onboarding_status_cubit.dart';
import 'package:weatherapp/injection_container.dart';
import 'package:weatherapp/router/router.gr.dart';

class OnboardingGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await sl<OnboardingStatusCubit>().checkUserIsOnboarded()) {
      resolver.next(true);
    } else {
      resolver.redirect(const OnboardingRoute());
    }
  }
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (false) {
      resolver.next(true);
    } else {
      resolver.redirect(const MainAuthRoute());
    }
  }
}
