import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/style/colors/colors.dart';
import 'package:flutter_clean_arch/core/translations/local_keys.g.dart';
import 'package:flutter_clean_arch/core/util/image_cacher.dart';
import 'package:flutter_clean_arch/features/user_session/cubits/onboarding_status_cubit/onboarding_status_cubit.dart';
import 'package:flutter_clean_arch/injection_container.dart';
import 'package:flutter_clean_arch/presentation/onboarding/components/continue_button.dart';
import 'package:flutter_clean_arch/presentation/onboarding/components/overview_image.dart';
import 'package:flutter_clean_arch/presentation/onboarding/components/overview_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController sliderController;

  final List<String> sliderImages = [
    // Images.firstSlide,
    // Images.secondSlide,
    // Images.thirdSlide,
  ];

  final List<String> sliderTitleText = [
    LocaleKeys.booksIn15Minutes,
    LocaleKeys.readListenAndWatch,
    LocaleKeys.personalReadingPlan,
  ];

  final List<String> sliderDescriptionText = [
    LocaleKeys.weReadTheBestBooksHighlight,
    LocaleKeys.youCanReadListenAndWatchSameTime,
    LocaleKeys.setYourReadingGoalsAndAccept,
  ];

  @override
  void initState() {
    super.initState();
    sliderController = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ImageCacher.preloadImages(sliderImages, context);
  }

  @override
  void dispose() {
    sliderController.dispose();
    super.dispose();
  }

  void onContinueTap() async {
    sliderController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    if (sliderController.page == sliderTitleText.length - 1) {
      await sl<OnboardingStatusCubit>().setUserIsOnboarded(true);
      context.router.pushNamed("/auth");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: sliderTitleText.length,
              controller: sliderController,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Center(child: OverviewImage()),
                    ),
                    const SizedBox(height: 16),
                    OverviewText(
                      title: sliderTitleText[index].tr(),
                      description: sliderDescriptionText[index].tr(),
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: sliderController,
            count: sliderTitleText.length,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              spacing: 8,
              dotColor: Clr.of(context).gray,
              activeDotColor: Clr.of(context).mainBlue,
            ),
          ),
          const SizedBox(height: 16),
          ContinueButton(
            onContinueTap: onContinueTap,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}