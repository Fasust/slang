
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 6 (3.0 per locale)
 *
 * Built on 2020-07-26 at 00:00 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	de, // 'de'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	/// Hint for pre 4.x.x developers: You can access the raw string via LocaleSettings.useDeviceLocale().languageTag
	static AppLocale useDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			return setLocaleRaw(deviceLocale);
		} else {
			return setLocale(_baseLocale);
		}
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String localeRaw) {
		final selected = _selectLocale(localeRaw);
		return setLocale(selected ?? _baseLocale);
	}

	/// Gets current locale.
	/// Hint for pre 4.x.x developers: You can access the raw string via LocaleSettings.currentLocale.languageTag
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	/// Hint for pre 4.x.x developers: You can access the raw string via LocaleSettings.baseLocale.languageTag
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}

}

// context enums

// interfaces generated as mixins

mixin PageData {
	String get title;
	String? get content => null;
}

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _StringsEn._instance;
			case AppLocale.de: return _StringsDe._instance;
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.de: return 'de';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.de: return const Locale.fromSubtags(languageCode: 'de');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'de': return AppLocale.de;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

class _StringsEn {
	_StringsEn._(); // no constructor

	static final _StringsEn _instance = _StringsEn._();

	_StringsOnboardingEn get onboarding => _StringsOnboardingEn._instance;

	/// A flat map containing all translations.
	dynamic operator[](String key) {
		return _translationMap[AppLocale.en]![key];
	}
}

class _StringsOnboardingEn {
	_StringsOnboardingEn._(); // no constructor

	static final _StringsOnboardingEn _instance = _StringsOnboardingEn._();

	List<PageData> get pages => [
		_StringsOnboarding0i0En._instance,
		_StringsOnboarding0i1En._instance,
	];
}

class _StringsOnboarding0i0En with PageData {
	_StringsOnboarding0i0En._(); // no constructor

	static final _StringsOnboarding0i0En _instance = _StringsOnboarding0i0En._();

	@override String get title => 'First Page';
	@override String? get content => 'First Page Content';
}

class _StringsOnboarding0i1En with PageData {
	_StringsOnboarding0i1En._(); // no constructor

	static final _StringsOnboarding0i1En _instance = _StringsOnboarding0i1En._();

	@override String get title => 'Second Page';
}

class _StringsDe implements _StringsEn {
	_StringsDe._(); // no constructor

	static final _StringsDe _instance = _StringsDe._();

	@override _StringsOnboardingDe get onboarding => _StringsOnboardingDe._instance;

	/// A flat map containing all translations.
	@override
	dynamic operator[](String key) {
		return _translationMap[AppLocale.de]![key];
	}
}

class _StringsOnboardingDe implements _StringsOnboardingEn {
	_StringsOnboardingDe._(); // no constructor

	static final _StringsOnboardingDe _instance = _StringsOnboardingDe._();

	@override List<PageData> get pages => [
		_StringsOnboarding0i0De._instance,
		_StringsOnboarding0i1De._instance,
	];
}

class _StringsOnboarding0i0De with PageData implements _StringsOnboarding0i0En {
	_StringsOnboarding0i0De._(); // no constructor

	static final _StringsOnboarding0i0De _instance = _StringsOnboarding0i0De._();

	@override String get title => 'Erste Seite';
	@override String? get content => 'Erste Seiteninhalt';
}

class _StringsOnboarding0i1De with PageData implements _StringsOnboarding0i1En {
	_StringsOnboarding0i1De._(); // no constructor

	static final _StringsOnboarding0i1De _instance = _StringsOnboarding0i1De._();

	@override String get title => 'Zweite Seite';
}

/// A flat map containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
late Map<AppLocale, Map<String, dynamic>> _translationMap = {
	AppLocale.en: {
		'onboarding.pages.0.title': 'First Page',
		'onboarding.pages.0.content': 'First Page Content',
		'onboarding.pages.1.title': 'Second Page',
	},
	AppLocale.de: {
		'onboarding.pages.0.title': 'Erste Seite',
		'onboarding.pages.0.content': 'Erste Seiteninhalt',
		'onboarding.pages.1.title': 'Zweite Seite',
	},
};
