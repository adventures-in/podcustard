import 'package:meta/meta.dart';
import 'package:podcustard/models/problem.dart';

class Action {
  const Action(this.propsMap);
  Action.fromJson(Map<String, dynamic> json) : propsMap = json;
  final Map<String, dynamic> propsMap;
  Map<String, dynamic> toJson() => propsMap;

  factory Action.ObserveAuthState() => ObserveAuthState();
  factory Action.StoreAuthState({@required String userId}) =>
      StoreAuthState(userId: userId);
  factory Action.AddProblem({@required Problem problem}) =>
      AddProblem(problem: problem);
}

class ObserveAuthState extends Action {
  const ObserveAuthState() : super(const <String, Object>{});
}

class StoreAuthState extends Action {
  StoreAuthState({@required this.userId})
      : super(<String, Object>{'userId': userId});
  final String userId;
}

class AddProblem extends Action {
  AddProblem({@required this.problem})
      : super(<String, Object>{'problem': problem});
  final Problem problem;
}
