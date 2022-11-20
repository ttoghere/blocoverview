part of 'theme_bloc.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeBlocState extends Equatable {
  final AppTheme appTheme;
  ThemeBlocState({
    this.appTheme = AppTheme.light,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [appTheme];

  @override
  String toString() {
    return "AppThemeBlocState(appTheme: $appTheme)";
  }

  ThemeBlocState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeBlocState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  factory ThemeBlocState.initial() {
    return ThemeBlocState();
  }
}
