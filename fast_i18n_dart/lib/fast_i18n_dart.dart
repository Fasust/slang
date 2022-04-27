class BaseAppLocale {
  final String languageCode;
  final String? scriptCode;
  final String? countryCode;

  const BaseAppLocale({
    required this.languageCode,
    this.scriptCode,
    this.countryCode,
  });

  String get languageTag => [languageCode, scriptCode, countryCode].where((element) => element != null).join('-');

  @override
  String toString() => '$runtimeType{languageCode: $languageCode, scriptCode: $scriptCode, countryCode: $countryCode}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseAppLocale &&
          runtimeType == other.runtimeType &&
          languageCode == other.languageCode &&
          scriptCode == other.scriptCode &&
          countryCode == other.countryCode;

  @override
  int get hashCode => languageCode.hashCode ^ scriptCode.hashCode ^ countryCode.hashCode;
}

// This locale is *shared* among all packages of an app.
BaseAppLocale? _currLocale;

class BaseLocaleSettings<T extends BaseAppLocale> {
  final T baseLocale;
  final List<T> localeValues;

  BaseLocaleSettings({required this.baseLocale, required this.localeValues});

  /// Sets locale, *but* do not change potential TranslationProvider's state
  /// Useful when you are in a pure Dart environment (without Flutter)
  BaseAppLocale setLocaleExceptProvider(T locale) {
    _currLocale = locale;
    return currentLocale;
  }

  /// Gets current locale.
  BaseAppLocale get currentLocale => _currLocale ?? baseLocale;

  /// Gets supported locales in string format.
  List<String> get supportedLocalesRaw {
    return localeValues.map((locale) => locale.languageTag).toList();
  }
}

/// Provides utility functions without any side effects.
class AppLocaleUtils<T extends BaseAppLocale> {
  final List<T> localeValues;

  AppLocaleUtils(this.localeValues);

  /// Returns the enum type of the raw locale.
  /// Fallbacks to base locale.
  T? parse(String rawLocale) {
    return selectLocale(rawLocale);
  }

  static final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');

  T? selectLocale(String localeRaw) {
    final match = _localeRegex.firstMatch(localeRaw);
    T? selected;
    if (match != null) {
      final language = match.group(1);
      final country = match.group(5);

      // match exactly
      selected = localeValues
          .cast<T?>()
          .firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

      if (selected == null && language != null) {
        // match language
        selected = localeValues
            .cast<T?>()
            .firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
      }

      if (selected == null && country != null) {
        // match country
        selected = localeValues
            .cast<T?>()
            .firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
      }
    }
    return selected;
  }
}
