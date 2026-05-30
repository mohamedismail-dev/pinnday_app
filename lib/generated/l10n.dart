// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Personalize Your Experience`
  String get setup_page_title {
    return Intl.message(
      'Personalize Your Experience',
      name: 'setup_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.`
  String get setup_page_bodytext {
    return Intl.message(
      'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
      name: 'setup_page_bodytext',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language_label {
    return Intl.message('Language', name: 'language_label', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Theme`
  String get theme_label {
    return Intl.message('Theme', name: 'theme_label', desc: '', args: []);
  }

  /// `Get Started`
  String get setup_button {
    return Intl.message(
      'Get Started',
      name: 'setup_button',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip_button {
    return Intl.message('Skip', name: 'skip_button', desc: '', args: []);
  }

  /// `Find Events That Inspire You`
  String get onboarding_title_1 {
    return Intl.message(
      'Find Events That Inspire You',
      name: 'onboarding_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Effortless Event Planning`
  String get onboarding_title_2 {
    return Intl.message(
      'Effortless Event Planning',
      name: 'onboarding_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Connect with Friends & Share Moments`
  String get onboarding_title_3 {
    return Intl.message(
      'Connect with Friends & Share Moments',
      name: 'onboarding_title_3',
      desc: '',
      args: [],
    );
  }

  /// `Dive into a wo rld of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.`
  String get onboarding_bodytext_1 {
    return Intl.message(
      'Dive into a wo rld of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
      name: 'onboarding_bodytext_1',
      desc: '',
      args: [],
    );
  }

  /// `Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.`
  String get onboarding_bodytext_2 {
    return Intl.message(
      'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
      name: 'onboarding_bodytext_2',
      desc: '',
      args: [],
    );
  }

  /// `Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.`
  String get onboarding_bodytext_3 {
    return Intl.message(
      'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
      name: 'onboarding_bodytext_3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get onboarding_button1 {
    return Intl.message('Next', name: 'onboarding_button1', desc: '', args: []);
  }

  /// `Let's Get Started`
  String get onboarding_button2 {
    return Intl.message(
      'Let\'s Get Started',
      name: 'onboarding_button2',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get Login_to_your_account {
    return Intl.message(
      'Login to your account',
      name: 'Login_to_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get Enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'Enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get Enter_your_password {
    return Intl.message(
      'Enter your password',
      name: 'Enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get Forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'Forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account ?`
  String get Dont_have_an_account {
    return Intl.message(
      'Don’t have an account ?',
      name: 'Dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get Already_have_an_account {
    return Intl.message(
      'Already have an account?',
      name: 'Already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  /// `Sign up`
  String get Signup {
    return Intl.message('Sign up', name: 'Signup', desc: '', args: []);
  }

  /// `Or`
  String get Or {
    return Intl.message('Or', name: 'Or', desc: '', args: []);
  }

  /// `Login with Google`
  String get Login_with_Google {
    return Intl.message(
      'Login with Google',
      name: 'Login_with_Google',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get Create_your_account {
    return Intl.message(
      'Create your account',
      name: 'Create_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get Enter_your_name {
    return Intl.message(
      'Enter your name',
      name: 'Enter_your_name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get Confirm_your_password {
    return Intl.message(
      'Confirm your password',
      name: 'Confirm_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with Google`
  String get Sign_up_with_Google {
    return Intl.message(
      'Sign up with Google',
      name: 'Sign_up_with_Google',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get Reset_password {
    return Intl.message(
      'Reset password',
      name: 'Reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get Forget_password2 {
    return Intl.message(
      'Forget password',
      name: 'Forget_password2',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get please_enter_your_email {
    return Intl.message(
      'Please enter your email',
      name: 'please_enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_your_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get password_must_be_at_least_6_characters {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'password_must_be_at_least_6_characters',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get enter_a_valid_email_address {
    return Intl.message(
      'Enter a valid email address',
      name: 'enter_a_valid_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Your Name Required`
  String get your_name_required {
    return Intl.message(
      'Your Name Required',
      name: 'your_name_required',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get email_is_required {
    return Intl.message(
      'Email is required',
      name: 'email_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get enter_valid_email {
    return Intl.message(
      'Enter a valid email',
      name: 'enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get password_is_required {
    return Intl.message(
      'Password is required',
      name: 'password_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters, contain one uppercase letter and one number`
  String get password_complexity {
    return Intl.message(
      'Password must be at least 8 characters, contain one uppercase letter and one number',
      name: 'password_complexity',
      desc: '',
      args: [],
    );
  }

  /// `The password does not match`
  String get password_does_not_match {
    return Intl.message(
      'The password does not match',
      name: 'password_does_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back ✨`
  String get Welcome_Back {
    return Intl.message(
      'Welcome Back ✨',
      name: 'Welcome_Back',
      desc: '',
      args: [],
    );
  }

  /// `EN`
  String get EN1 {
    return Intl.message('EN', name: 'EN1', desc: '', args: []);
  }

  /// `AR`
  String get AR1 {
    return Intl.message('AR', name: 'AR1', desc: '', args: []);
  }

  /// `All`
  String get All {
    return Intl.message('All', name: 'All', desc: '', args: []);
  }

  /// `Sport`
  String get Sport {
    return Intl.message('Sport', name: 'Sport', desc: '', args: []);
  }

  /// `Birthday`
  String get Birthday {
    return Intl.message('Birthday', name: 'Birthday', desc: '', args: []);
  }

  /// `Book Club`
  String get Book_Club {
    return Intl.message('Book Club', name: 'Book_Club', desc: '', args: []);
  }

  /// `Meeting`
  String get Meeting {
    return Intl.message('Meeting', name: 'Meeting', desc: '', args: []);
  }

  /// `Exhibition`
  String get Exhibition {
    return Intl.message('Exhibition', name: 'Exhibition', desc: '', args: []);
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `Favorite`
  String get Favorite {
    return Intl.message('Favorite', name: 'Favorite', desc: '', args: []);
  }

  /// `Profile`
  String get Profile {
    return Intl.message('Profile', name: 'Profile', desc: '', args: []);
  }

  /// `Title`
  String get Title {
    return Intl.message('Title', name: 'Title', desc: '', args: []);
  }

  /// `Event Title`
  String get Event_title {
    return Intl.message('Event Title', name: 'Event_title', desc: '', args: []);
  }

  /// `Description`
  String get Description {
    return Intl.message('Description', name: 'Description', desc: '', args: []);
  }

  /// `Event Description....`
  String get Event_Description {
    return Intl.message(
      'Event Description....',
      name: 'Event_Description',
      desc: '',
      args: [],
    );
  }

  /// `Event Date`
  String get Event_Date {
    return Intl.message('Event Date', name: 'Event_Date', desc: '', args: []);
  }

  /// `Event Time`
  String get Event_Time {
    return Intl.message('Event Time', name: 'Event_Time', desc: '', args: []);
  }

  /// `Choose date`
  String get Choose_Date {
    return Intl.message('Choose date', name: 'Choose_Date', desc: '', args: []);
  }

  /// `Choose time`
  String get Choose_Time {
    return Intl.message('Choose time', name: 'Choose_Time', desc: '', args: []);
  }

  /// `Add Event`
  String get Add_Event {
    return Intl.message('Add Event', name: 'Add_Event', desc: '', args: []);
  }

  /// `Search for event`
  String get Search_for_event {
    return Intl.message(
      'Search for event',
      name: 'Search_for_event',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get Dark_mode {
    return Intl.message('Dark mode', name: 'Dark_mode', desc: '', args: []);
  }

  /// `Language`
  String get Language {
    return Intl.message('Language', name: 'Language', desc: '', args: []);
  }

  /// `Logout`
  String get Logout {
    return Intl.message('Logout', name: 'Logout', desc: '', args: []);
  }

  /// `Enter title`
  String get Enter_title {
    return Intl.message('Enter title', name: 'Enter_title', desc: '', args: []);
  }

  /// `Enter description`
  String get Enter_description {
    return Intl.message(
      'Enter description',
      name: 'Enter_description',
      desc: '',
      args: [],
    );
  }

  /// `Enter date`
  String get Enter_date {
    return Intl.message('Enter date', name: 'Enter_date', desc: '', args: []);
  }

  /// `Enter time`
  String get Enter_time {
    return Intl.message('Enter time', name: 'Enter_time', desc: '', args: []);
  }

  /// `Event details`
  String get Event_details {
    return Intl.message(
      'Event details',
      name: 'Event_details',
      desc: '',
      args: [],
    );
  }

  /// `Update event`
  String get Update_event {
    return Intl.message(
      'Update event',
      name: 'Update_event',
      desc: '',
      args: [],
    );
  }

  /// `No favorites`
  String get No_favorites {
    return Intl.message(
      'No favorites',
      name: 'No_favorites',
      desc: '',
      args: [],
    );
  }

  /// `No Events!`
  String get No_Events {
    return Intl.message('No Events!', name: 'No_Events', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
