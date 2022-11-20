part of 'color_bloc.dart';

class ColorBlocState extends Equatable {
  final Color color;
  ColorBlocState({
    required this.color,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [color];

  @override
  String toString() {
    return "ColorBlocState(color: $color)";
  }

  ColorBlocState copyWith({
    Color? color,
  }) {
    return ColorBlocState(
      color: color ?? this.color,
    );
  }

  factory ColorBlocState.initial() {
    return ColorBlocState(color: Colors.red);
  }
}
