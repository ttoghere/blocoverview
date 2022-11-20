part of 'theme_cubit.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeCubitState extends Equatable {
  final AppTheme appTheme;
  ThemeCubitState({
    this.appTheme = AppTheme.light,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [appTheme];

  @override
  String toString() {
    return "AppThemeCubitState(appTheme: $appTheme)";
  }

  ThemeCubitState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeCubitState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  factory ThemeCubitState.initial() {
    return ThemeCubitState();
  }
}
