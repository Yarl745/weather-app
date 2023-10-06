import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/base_widgets/app_bars/static_back_app_bar_with_button.dart';
import 'package:flutter_clean_arch/base_widgets/buttons/primary_button.dart';
import 'package:flutter_clean_arch/base_widgets/scroll_widgets/custom_expanded_scroll_view.dart';
import 'package:flutter_clean_arch/base_widgets/text_fields/auth_input_field.dart';
import 'package:flutter_clean_arch/core/style/paddings.dart';
import 'package:flutter_clean_arch/core/translations/local_keys.g.dart';
import 'package:flutter_clean_arch/presentation/auth/components/terms_and_policy_link.dart';

@RoutePage()
class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late final FocusNode nameFocusNode;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void onGetStartedTap() {}

  void onLogInTap() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StaticBackAppBarWithButton(
        titleText: LocaleKeys.createAnAccount.tr(),
        buttonText: LocaleKeys.logIn.tr(),
        onRightButtonTap: onLogInTap,
      ),
      body: CustomExpandedScrollView(
        child: Padding(
          padding: CPaddings.horizontal12,
          child: FocusScope(
            child: FocusTraversalGroup(
              policy: OrderedTraversalPolicy(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 32),
                  AuthInputField(
                    autofocus: true,
                    focusNode: nameFocusNode,
                    hintText: LocaleKeys.name.tr(),
                    iconData: Icons.account_circle,
                    onTextInput: (text) {},
                    onSubmitted: (_) => FocusScope.of(context).requestFocus(emailFocusNode),
                  ),
                  const SizedBox(height: 18),
                  AuthInputField(
                    focusNode: emailFocusNode,
                    hintText: LocaleKeys.email.tr(),
                    iconData: Icons.email_outlined,
                    onTextInput: (text) {},
                    onSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocusNode),
                  ),
                  const SizedBox(height: 18),
                  AuthInputField(
                    focusNode: passwordFocusNode,
                    hintText: LocaleKeys.password8Characters.tr(),
                    iconData: Icons.lock,
                    isPassword: true,
                    onTextInput: (text) {},
                    onSubmitted: (_) => onGetStartedTap(),
                  ),
                  const SizedBox(height: 18),
                  PrimaryButton(
                    buttonText: LocaleKeys.getStarted.tr(),
                    isActive: true,
                    onTap: onGetStartedTap,
                  ),
                  const SizedBox(height: 24),
                  TermsAndPolicyLink(
                    onTap: () {},
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
