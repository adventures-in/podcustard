import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/enums/auth_step_enum.dart';
import 'package:podcustard/models/auth/auth_user_data.dart';
import 'package:podcustard/models/podcast_detail_view_model.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/track.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    required IList<Problem> problems,
    required AuthStepEnum authStep,
    required int mainPageIndex,
    required bool bottomSheetShown,
    required int themeMode,
    required AuthUserData? authUserData,
    PodcastDetailViewModel? detailVM,
    Track? track,
    required IList<PodcastSummary> podcastSummaries,
  }) = _AppState;

  factory AppState.init() => AppState(
      problems: IList(),
      authStep: AuthStepEnum.waitingForInput,
      authUserData: null,
      mainPageIndex: 0,
      bottomSheetShown: false,
      themeMode: 2,
      podcastSummaries: IList());

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}
