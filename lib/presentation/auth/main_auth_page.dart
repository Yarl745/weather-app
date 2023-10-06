import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:weatherapp/base_widgets/scroll_widgets/custom_expanded_scroll_view.dart';
import 'package:weatherapp/presentation/auth/components/continue_with_service_button.dart';
import 'package:weatherapp/presentation/auth/components/main_auth_text.dart';
import 'package:weatherapp/presentation/auth/components/terms_and_policy_link.dart';

@RoutePage()
class MainAuthPage extends StatefulWidget {
  const MainAuthPage({Key? key}) : super(key: key);

  @override
  State<MainAuthPage> createState() => _MainAuthPageState();
}

class _MainAuthPageState extends State<MainAuthPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onContinueTap() {}

  void onContinueWithEmailTap() => context.router.pushNamed("/auth/create-account");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomExpandedScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            const MainAuthText(),
            const Spacer(flex: 2),
            TermsAndPolicyLink(
              onTap: () {},
            ),
            const SizedBox(height: 16),
            ContinueWithServiceButton(
              onContinueTap: onContinueTap,
              serviceName: "Google",
              serviceIconData: Bootstrap.google,
            ),
            const SizedBox(height: 16),
            ContinueWithServiceButton(
              onContinueTap: onContinueTap,
              serviceName: "Apple",
              serviceIconData: Bootstrap.apple,
            ),
            const SizedBox(height: 16),
            ContinueWithServiceButton(
              onContinueTap: onContinueWithEmailTap,
              serviceName: "Email",
              serviceIconData: Icons.email,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
