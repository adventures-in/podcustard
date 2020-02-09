import 'package:meta/meta.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/track.dart';
import 'package:podcustard/models/user.dart';
import 'package:rss_dart/models/rss_feed.dart';

class Action {
  const Action(this.propsMap);
  Action.fromJson(Map<String, dynamic> json) : propsMap = json;
  final Map<String, dynamic> propsMap;
  Map<String, dynamic> toJson() => propsMap;

  factory Action.ObserveAuthState() => ObserveAuthState();
  factory Action.StoreUser({@required User user}) => StoreUser(user: user);
  factory Action.SigninWithGoogle() => SigninWithGoogle();
  factory Action.SigninWithApple() => SigninWithApple();
  factory Action.StoreAuthStep({@required int step}) =>
      StoreAuthStep(step: step);
  factory Action.ObserveAudioPlayer() => ObserveAudioPlayer();
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
  factory Action.StoreFeed({@required RssFeed feed}) => StoreFeed(feed: feed);
  factory Action.SelectPodcast({@required PodcastSummary podcast}) =>
      SelectPodcast(podcast: podcast);
  factory Action.ClearPodcastSelection() => ClearPodcastSelection();
  factory Action.BuildTrackFromEpisode(
          {@required String audioUrl, @required String episodeTitle}) =>
      BuildTrackFromEpisode(audioUrl: audioUrl, episodeTitle: episodeTitle);
  factory Action.PauseTrack() => PauseTrack();
  factory Action.RestartTrack() => RestartTrack();
  factory Action.StoreTrack({@required Track track}) =>
      StoreTrack(track: track);
  factory Action.StoreTrackDuration({@required double duration}) =>
      StoreTrackDuration(duration: duration);
  factory Action.StoreTrackPosition({@required double position}) =>
      StoreTrackPosition(position: position);
  factory Action.StoreTrackState({@required TrackStateEnum state}) =>
      StoreTrackState(state: state);
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

class SigninWithApple extends Action {
  SigninWithApple() : super(<String, Object>{});
}

class StoreAuthStep extends Action {
  StoreAuthStep({@required this.step}) : super(<String, Object>{'step': step});
  final int step;
}

class ObserveAudioPlayer extends Action {
  ObserveAudioPlayer() : super(<String, Object>{});
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

class StoreFeed extends Action {
  StoreFeed({@required this.feed}) : super(<String, Object>{'feed': feed});
  final RssFeed feed;
}

class SelectPodcast extends Action {
  SelectPodcast({@required this.podcast})
      : super(<String, Object>{'podcast': podcast});
  final PodcastSummary podcast;
}

class ClearPodcastSelection extends Action {
  ClearPodcastSelection() : super(<String, Object>{});
}

class BuildTrackFromEpisode extends Action {
  BuildTrackFromEpisode({@required this.audioUrl, @required this.episodeTitle})
      : super(<String, Object>{
          'audioUrl': audioUrl,
          'episodeTitle': episodeTitle
        });
  final String audioUrl;
  final String episodeTitle;
}

class PauseTrack extends Action {
  PauseTrack() : super(<String, Object>{});
}

class RestartTrack extends Action {
  RestartTrack() : super(<String, Object>{});
}

class StoreTrack extends Action {
  StoreTrack({@required this.track}) : super(<String, Object>{'track': track});
  final Track track;
}

class StoreTrackDuration extends Action {
  StoreTrackDuration({@required this.duration})
      : super(<String, Object>{'duration': duration});
  final double duration;
}

class StoreTrackPosition extends Action {
  StoreTrackPosition({@required this.position})
      : super(<String, Object>{'position': position});
  final double position;
}

class StoreTrackState extends Action {
  StoreTrackState({@required this.state})
      : super(<String, Object>{'state': state});
  final TrackStateEnum state;
}
