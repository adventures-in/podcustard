import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem.freezed.dart';
part 'problem.g.dart';

@freezed
class Problem with _$Problem {
  factory Problem(
      {required String message,
      String? trace,
      @Default([]) IMap<String, dynamic> info}) = _Problem;

  factory Problem.fromJson(Map<String, dynamic> json) =>
      _$ProblemFromJson(json);
}
