import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'podcast_summary.freezed.dart';
part 'podcast_summary.g.dart';

@freezed
class PodcastSummary with _$PodcastSummary {
  factory PodcastSummary({
    int? artistId,
    int? collectionId,
    int? trackId,
    int? trackCount,
    DateTime? releaseDate,
    String? artistName,
    String? collectionName,
    String? trackName,
    String? artistViewUrl,
    String? collectionViewUrl,
    String? feedUrl,
    String? trackViewUrl,
    String? artworkUrl30,
    String? artworkUrl60,
    String? artworkUrl100,
    String? artworkUrl600,
    String? country,
    String? primaryGenreName,
    IList<String>? genreIds,
    IList<String>? genres,
  }) = _PodcastSummary;

  factory PodcastSummary.fromJson(Map<String, dynamic> json) =>
      _$PodcastSummaryFromJson(json);
}
