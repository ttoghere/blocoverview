part of 'color_cubit.dart';

class ColorState extends Equatable {
  final Color color;
  ColorState({
    required this.color,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [color];

  @override
  String toString() {
    return "ColorState(color: $color)";
  }

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }

  factory ColorState.initial() {
    return ColorState(color: Colors.red);
  }
}
