import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @welcomePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Afrodance Corner'**
  String get welcomePageTitle;

  /// No description provided for @welcomePageJoinusText.
  ///
  /// In en, this message translates to:
  /// **'Join our passionate community of African dance lovers and discover the captivating rhythms, vibrant movements, and contagious energy that make each of our workshops an unforgettable experience.'**
  String get welcomePageJoinusText;

  /// No description provided for @welcomePageSubscribeButton.
  ///
  /// In en, this message translates to:
  /// **'Register for our next session'**
  String get welcomePageSubscribeButton;

  /// No description provided for @aboutusPageTitle.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutusPageTitle;

  /// No description provided for @aboutusPageADCText.
  ///
  /// In en, this message translates to:
  /// **'Afrodance Corner is much more than just a dance space — it’s a vibrant community that celebrates Afro-urban dances, their energy, diversity, and history. We create spaces where everyone can express themselves through dance, learn, push their limits, and above all, share their passion for Afro culture.\n\nOur workshops bring together dancers of all levels. Whether you’re a beginner or experienced, you’ll find your rhythm here!\n\nEach workshop is led by passionate coaches and talented DJ hosts. We would like to thank our partners who accompany and support us. And of course, a big thank you to our amazing community of dancers who make every session unforgettable.'**
  String get aboutusPageADCText;

  /// No description provided for @aboutusPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Our Workshops'**
  String get aboutusPageSubtitle;

  /// No description provided for @aboutusPageWorkshopText.
  ///
  /// In en, this message translates to:
  /// **'Above all, it’s an energetic afternoon where participants learn new choreographies to mainly Afro sounds. Guided by their coach, they are taken step-by-step through every movement with passion and energy.\n\nThe session is divided into three main parts: warm-up, a trending mini-choreography (often inspired by viral TikTok dances), and a main choreography prepared by the coach. We invite all participants to come motivated, on time, and ready to have fun on the dance floor!\n\nAfrodance Corner is also a place of exchange, meeting, and sharing among dance enthusiasts in a friendly and vibrant atmosphere.'**
  String get aboutusPageWorkshopText;

  /// No description provided for @aboutusPageSuscribeButton.
  ///
  /// In en, this message translates to:
  /// **'Register for our next workshop'**
  String get aboutusPageSuscribeButton;

  /// No description provided for @aboutusPageMissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get aboutusPageMissionTitle;

  /// No description provided for @aboutusPageMissionText.
  ///
  /// In en, this message translates to:
  /// **'To create an artistic and cultural space where every dance enthusiast can find their place.'**
  String get aboutusPageMissionText;

  /// No description provided for @aboutusPageVisionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get aboutusPageVisionTitle;

  /// No description provided for @aboutusPageVisionText.
  ///
  /// In en, this message translates to:
  /// **'To create an artistic and cultural space where every dance enthusiast can find their place.'**
  String get aboutusPageVisionText;

  /// No description provided for @aboutusPageValuesTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Values'**
  String get aboutusPageValuesTitle;

  /// No description provided for @aboutusPageValuesText.
  ///
  /// In en, this message translates to:
  /// **'Respect, inclusion, passion, and authenticity — the pillars that inspire every session and every smile.'**
  String get aboutusPageValuesText;

  /// No description provided for @contactPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactPageSubtitle;

  /// No description provided for @contactPageInfoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Our Contact Details'**
  String get contactPageInfoSubtitle;

  /// No description provided for @contactPageAdress.
  ///
  /// In en, this message translates to:
  /// **'Paul-Ehrlich-Str. 28, Kaiserslautern, Germany'**
  String get contactPageAdress;

  /// No description provided for @contactPageTelefon.
  ///
  /// In en, this message translates to:
  /// **'+49 15773617625'**
  String get contactPageTelefon;

  /// No description provided for @contactPageEmail.
  ///
  /// In en, this message translates to:
  /// **'afrodancecorner@gmail.com'**
  String get contactPageEmail;

  /// No description provided for @contactPageTiktok.
  ///
  /// In en, this message translates to:
  /// **'Afrodance Corner'**
  String get contactPageTiktok;

  /// No description provided for @contactPageSendButton.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get contactPageSendButton;

  /// No description provided for @contactPageSnackbarSucessMessage.
  ///
  /// In en, this message translates to:
  /// **'Message sent successfully'**
  String get contactPageSnackbarSucessMessage;

  /// No description provided for @labelTextPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get labelTextPassword;

  /// No description provided for @labelTextMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get labelTextMessage;

  /// No description provided for @labelTextEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get labelTextEmail;

  /// No description provided for @labelTextName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get labelTextName;

  /// No description provided for @validatorCheckEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get validatorCheckEmail;

  /// No description provided for @validatorCheckInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get validatorCheckInvalidEmail;

  /// No description provided for @validatorCheckName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get validatorCheckName;

  /// No description provided for @validatorCheckMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter a message'**
  String get validatorCheckMessage;

  /// No description provided for @validatorCheckPassword.
  ///
  /// In en, this message translates to:
  /// **'At least 6 characters'**
  String get validatorCheckPassword;

  /// No description provided for @workshopPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Workshops'**
  String get workshopPageTitle;

  /// No description provided for @workshopPageAboutusSubtitle.
  ///
  /// In en, this message translates to:
  /// **'What are our dance workshops about?'**
  String get workshopPageAboutusSubtitle;

  /// No description provided for @workshopPageCardTheme.
  ///
  /// In en, this message translates to:
  /// **'Christmas in Afro Style'**
  String get workshopPageCardTheme;

  /// No description provided for @workshopPageCardDate.
  ///
  /// In en, this message translates to:
  /// **'Saturday, December 13, 2025'**
  String get workshopPageCardDate;

  /// No description provided for @workshopPageCardTime.
  ///
  /// In en, this message translates to:
  /// **'1:00 PM - 6:00 PM'**
  String get workshopPageCardTime;

  /// No description provided for @workshopPageCardPlace.
  ///
  /// In en, this message translates to:
  /// **'TU Kaiserslautern - Germany'**
  String get workshopPageCardPlace;

  /// No description provided for @workshopPageCardDateline.
  ///
  /// In en, this message translates to:
  /// **'Registration deadline: November 30, 2025'**
  String get workshopPageCardDateline;

  /// No description provided for @workshopCardAgreementText.
  ///
  /// In en, this message translates to:
  /// **'By participating in this workshop, I authorize Afrodance Corner to use the photos and videos taken during the event for communication and promotional purposes on our posters, social media, and website.'**
  String get workshopCardAgreementText;

  /// No description provided for @workshopCardBasicCriteria1.
  ///
  /// In en, this message translates to:
  /// **'Workshop access'**
  String get workshopCardBasicCriteria1;

  /// No description provided for @workshopCardBasicCriteria2.
  ///
  /// In en, this message translates to:
  /// **'Water + snacks'**
  String get workshopCardBasicCriteria2;

  /// No description provided for @workshopCardStandardCriteria1.
  ///
  /// In en, this message translates to:
  /// **'Basic'**
  String get workshopCardStandardCriteria1;

  /// No description provided for @workshopCardStandardCriteria2.
  ///
  /// In en, this message translates to:
  /// **'Photos + videos'**
  String get workshopCardStandardCriteria2;

  /// No description provided for @workshopCardPremiumCriteria1.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get workshopCardPremiumCriteria1;

  /// No description provided for @workshopCardPremiumCriteria2.
  ///
  /// In en, this message translates to:
  /// **'Special gift'**
  String get workshopCardPremiumCriteria2;

  /// No description provided for @footerCopyright.
  ///
  /// In en, this message translates to:
  /// **'© 2025 Afrodance Corner - All rights reserved'**
  String get footerCopyright;

  /// No description provided for @headerMenuHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get headerMenuHome;

  /// No description provided for @headerMenuLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get headerMenuLogin;

  /// No description provided for @headerMenuWorkshop.
  ///
  /// In en, this message translates to:
  /// **'Workshop'**
  String get headerMenuWorkshop;

  /// No description provided for @headerMenuAboutus.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get headerMenuAboutus;

  /// No description provided for @headerMenuContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get headerMenuContact;

  /// No description provided for @headerLanguageFrench.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get headerLanguageFrench;

  /// No description provided for @headerLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get headerLanguageEnglish;

  /// No description provided for @headerLanguageGerman.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get headerLanguageGerman;

  /// No description provided for @loginFormSucessSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Login successful'**
  String get loginFormSucessSnackbar;

  /// No description provided for @loginFormErrorSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Login error'**
  String get loginFormErrorSnackbar;

  /// No description provided for @loginFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginFormTitle;

  /// No description provided for @loginFormSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginFormSubmitButton;

  /// No description provided for @loginPageCreateAccountTextButton.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account? Create one'**
  String get loginPageCreateAccountTextButton;

  /// No description provided for @loginPageLoginTextButton.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get loginPageLoginTextButton;

  /// No description provided for @registerFormUserExistNotification.
  ///
  /// In en, this message translates to:
  /// **'This user already exists. Please log in.'**
  String get registerFormUserExistNotification;

  /// No description provided for @registerFormInvalidEmailNotification.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address.'**
  String get registerFormInvalidEmailNotification;

  /// No description provided for @registerFormUnknownErrorNotification.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred:'**
  String get registerFormUnknownErrorNotification;

  /// No description provided for @registerFormErrorNotification.
  ///
  /// In en, this message translates to:
  /// **'Error while creating the account:'**
  String get registerFormErrorNotification;

  /// No description provided for @registerFormCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Create an Account'**
  String get registerFormCardTitle;

  /// No description provided for @registerFormSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerFormSubmitButton;

  /// No description provided for @suscribeButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get suscribeButtonTitle;

  /// No description provided for @suscribeButtonPaypalException.
  ///
  /// In en, this message translates to:
  /// **'Unable to open PayPal'**
  String get suscribeButtonPaypalException;

  /// No description provided for @suscribeButtonAlertDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Consent Required'**
  String get suscribeButtonAlertDialogTitle;

  /// No description provided for @suscribeButtonAlertDialogText.
  ///
  /// In en, this message translates to:
  /// **'Please accept the participation terms before proceeding. Check the box confirming your consent to the use of photos and videos.'**
  String get suscribeButtonAlertDialogText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
