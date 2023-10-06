// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "and": "and",
  "booksIn15Minutes": "Books in 15 minutes",
  "byContinuingYouAgreeTo": "By continuing, you agree to our",
  "continueLabel": "Continue",
  "continueWith": "Continue with",
  "createAnAccount": "Create an account",
  "easy": "easy",
  "email": "Email",
  "fun": "fun",
  "getStarted": "Get started",
  "logIn": "Log in",
  "logInToPersonalizeYourExperience": "Log in to personalize your experience and track your progress",
  "name": "Name",
  "password8Characters": "Password (8+ characters)",
  "personalReadingPlan": "Personal reading plan",
  "privacyPolicy": "Privacy Policy",
  "readListenAndWatch": "Read, listen and watch anywhere",
  "readingBecomes": "Reading becomes",
  "setYourReadingGoalsAndAccept": "Set your reading goals and accept a personalized challenge",
  "termsConditions": "Terms & Conditions",
  "weReadTheBestBooksHighlight": "We read the best books, highlight key ideas and insights, create summaries and visual narratives for you",
  "youCanReadListenAndWatchSameTime": "You can read, listen and watch at the same time without the Internet connection"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
