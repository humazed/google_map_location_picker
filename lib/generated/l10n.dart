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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static late S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Please check your connection`
  String get please_check_your_connection {
    return Intl.message(
      'Please check your connection',
      name: 'please_check_your_connection',
      desc: '',
      args: [],
    );
  }

  /// `Server error`
  String get server_error {
    return Intl.message(
      'Server error',
      name: 'server_error',
      desc: '',
      args: [],
    );
  }

  /// `Access to location denied`
  String get access_to_location_denied {
    return Intl.message(
      'Access to location denied',
      name: 'access_to_location_denied',
      desc: '',
      args: [],
    );
  }

  /// `Allow access to the location services.`
  String get allow_access_to_the_location_services {
    return Intl.message(
      'Allow access to the location services.',
      name: 'allow_access_to_the_location_services',
      desc: '',
      args: [],
    );
  }

  /// `Access to location permanently denied`
  String get access_to_location_permanently_denied {
    return Intl.message(
      'Access to location permanently denied',
      name: 'access_to_location_permanently_denied',
      desc: '',
      args: [],
    );
  }

  /// `Allow access to the location services for this App using the device settings.`
  String get allow_access_to_the_location_services_from_settings {
    return Intl.message(
      'Allow access to the location services for this App using the device settings.',
      name: 'allow_access_to_the_location_services_from_settings',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Can't get current location`
  String get cant_get_current_location {
    return Intl.message(
      'Can\'t get current location',
      name: 'cant_get_current_location',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure you enable GPS and try again`
  String get please_make_sure_you_enable_gps_and_try_again {
    return Intl.message(
      'Please make sure you enable GPS and try again',
      name: 'please_make_sure_you_enable_gps_and_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Search place`
  String get search_place {
    return Intl.message(
      'Search place',
      name: 'search_place',
      desc: '',
      args: [],
    );
  }

  /// `Finding place...`
  String get finding_place {
    return Intl.message(
      'Finding place...',
      name: 'finding_place',
      desc: '',
      args: [],
    );
  }

  /// `No result found`
  String get no_result_found {
    return Intl.message(
      'No result found',
      name: 'no_result_found',
      desc: '',
      args: [],
    );
  }

  /// `Unnamed place`
  String get unnamedPlace {
    return Intl.message(
      'Unnamed place',
      name: 'unnamedPlace',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'sr'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}