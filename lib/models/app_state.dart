import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/models/podcast_detail_view_model.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/models/track.dart';
import 'package:redfire/types.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState, RedFireState {
  factory AppState({
    /// RedFire AppState members
    required AuthState auth,
    required IList<PageData> pages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    ProfileData? profile,

    /// Additional AppState members
    required int mainPageIndex,
    required bool bottomSheetShown,
    required IList<PodcastSummary> podcastSummaries,
    PodcastDetailViewModel? detailVM,
    Track? track,
  }) = _AppState;

  factory AppState.init() => AppState(

      /// RedFire init code
      auth: AuthState.init(),
      pages: <PageData>[const InitialPageData()].lock,
      problems: IList(),
      settings: Settings.init(),

      /// Additional init code
      mainPageIndex: 0,
      bottomSheetShown: false,
      podcastSummaries: IList());

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}
