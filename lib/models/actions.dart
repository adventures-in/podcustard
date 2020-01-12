import 'package:meta/meta.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/user.dart';

class Action {
  const Action(this.propsMap);
  Action.fromJson(Map<String, dynamic> json) : propsMap = json;
  final Map<String, dynamic> propsMap;
  Map<String, dynamic> toJson() => propsMap;

  factory Action.ObserveAuthState() => ObserveAuthState();
  factory Action.StoreUser({@required User user}) => StoreUser(user: user);
  factory Action.SigninWithGoogle() => SigninWithGoogle();
  factory Action.StoreAuthStep({@required int step}) =>
      StoreAuthStep(step: step);
  factory Action.AddProblem({@required Problem problem}) =>
      AddProblem(problem: problem);
  factory Action.StoreMainPageIndex({@required int index}) =>
      StoreMainPageIndex(index: index);
  factory Action.RetrievePodcastSummaries({@required String query}) =>
      RetrievePodcastSummaries(query: query);
  factory Action.StorePodcastSummaries(
          {@required List<PodcastSummary> summaries}) =>
      StorePodcastSummaries(summaries: summaries);
  factory Action.StoreThemeMode({@required int themeMode}) =>
      StoreThemeMode(themeMode: themeMode);
}

class ObserveAuthState extends Action {
  const ObserveAuthState() : super(const <String, Object>{});
}

class StoreUser extends Action {
  StoreUser({@required this.user}) : super(<String, Object>{'user': user});
  final User user;
}

class SigninWithGoogle extends Action {
  SigninWithGoogle() : super(<String, Object>{});
}

class StoreAuthStep extends Action {
  StoreAuthStep({@required this.step}) : super(<String, Object>{'step': step});
  final int step;
}

class AddProblem extends Action {
  AddProblem({@required this.problem})
      : super(<String, Object>{'problem': problem});
  final Problem problem;
}

class StoreMainPageIndex extends Action {
  StoreMainPageIndex({@required this.index})
      : super(<String, Object>{'index': index});
  final int index;
}

class RetrievePodcastSummaries extends Action {
  RetrievePodcastSummaries({@required this.query})
      : super(<String, Object>{'query': query});
  final String query;
}

class StorePodcastSummaries extends Action {
  StorePodcastSummaries({@required this.summaries})
      : super(<String, Object>{'summaries': summaries});
  final List<PodcastSummary> summaries;
}

class StoreThemeMode extends Action {
  StoreThemeMode({@required this.themeMode})
      : super(<String, Object>{'themeMode': themeMode});
  final int themeMode;
}
