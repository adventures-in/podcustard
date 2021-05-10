import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/models/podcast_detail_view_model.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/track.dart';
import 'package:podcustard/models/user.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(IListConst([])) IList<Problem> problems,
    @Default(0) int authStep,
    @Default(0) int mainPageIndex,
    @Default(false) bool bottomSheetShown,
    @Default(2) int themeMode,
    User? user,
    PodcastDetailViewModel? detailVM,
    Track? track,
    @Default(IListConst([])) IList<PodcastSummary> podcastSummaries,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
