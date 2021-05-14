import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/models/rss/rss_feed.dart';

part 'podcast_detail_view_model.freezed.dart';
part 'podcast_detail_view_model.g.dart';

@freezed
class PodcastDetailViewModel with _$PodcastDetailViewModel {
  factory PodcastDetailViewModel({
    required PodcastSummary summary,
    RssFeed? feed,
  }) = _PodcastDetailViewModel;

  factory PodcastDetailViewModel.fromJson(Map<String, Object?> json) =>
      _$PodcastDetailViewModelFromJson(json);
}
