import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';
import 'package:podcustard/models/problem.dart';

part 'add_problem_action.freezed.dart';
part 'add_problem_action.g.dart';

@freezed
class AddProblemAction with _$AddProblemAction, ReduxAction {
  factory AddProblemAction(Problem problem) = _AddProblemAction;

  factory AddProblemAction.fromJson(Map<String, dynamic> json) =>
      _$AddProblemActionFromJson(json);
}
