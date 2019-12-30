import 'package:built_collection/built_collection.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:test/test.dart';

void main() {
  ///
  /// -- Non-nullable
  ///
  /// -- nullable
  ///
  /// int artistId;
  /// int collectionId;
  /// int trackId;
  /// int trackCount;
  /// DateTime releaseDate;
  /// String artistName;
  /// String collectionName;
  /// String trackName;
  /// String artistViewUrl;
  /// String collectionViewUrl;
  /// String feedUrl;
  /// String trackViewUrl;
  /// String artworkUrl30;
  /// String artworkUrl60;
  /// String artworkUrl100;
  /// String artworkUrl600;
  /// String country;
  /// String primaryGenreName;
  /// BuiltList<String> genreIds;
  /// BuiltList<String> genres;

  group('PodcastSummary', () {
    test('deals with null for nullable members', () {
      final podcastSummary = PodcastSummary();

      expect(podcastSummary.artistId, null);
      expect(podcastSummary.collectionId, null);
      expect(podcastSummary.trackId, null);
      expect(podcastSummary.trackCount, null);
      expect(podcastSummary.releaseDate, null);
      expect(podcastSummary.artistName, null);
      expect(podcastSummary.collectionName, null);
      expect(podcastSummary.trackName, null);
      expect(podcastSummary.artistViewUrl, null);
      expect(podcastSummary.collectionViewUrl, null);
      expect(podcastSummary.feedUrl, null);
      expect(podcastSummary.trackViewUrl, null);
      expect(podcastSummary.artworkUrl30, null);
      expect(podcastSummary.artworkUrl60, null);
      expect(podcastSummary.artworkUrl100, null);
      expect(podcastSummary.artworkUrl600, null);
      expect(podcastSummary.country, null);
      expect(podcastSummary.primaryGenreName, null);
      expect(podcastSummary.genreIds, []);
      expect(podcastSummary.genres, []);
    });

    test('members take expected values', () {
      final nowTime = DateTime.now();
      final podcastSummary = PodcastSummary((b) => b
        ..artistId = 1
        ..collectionId = 2
        ..trackId = 3
        ..trackCount = 4
        ..releaseDate = nowTime
        ..artistName = 'a'
        ..collectionName = 'b'
        ..trackName = 'c'
        ..artistViewUrl = 'd'
        ..collectionViewUrl = 'e'
        ..feedUrl = 'f'
        ..trackViewUrl = 'g'
        ..artworkUrl30 = 'h'
        ..artworkUrl60 = 'i'
        ..artworkUrl100 = 'j'
        ..artworkUrl600 = 'k'
        ..country = 'l'
        ..primaryGenreName = 'm'
        ..genreIds = ListBuilder(<String>['n', 'o'])
        ..genres = ListBuilder(<String>['p', 'q']));

      expect(podcastSummary.artistId, 1);
      expect(podcastSummary.collectionId, 2);
      expect(podcastSummary.trackId, 3);
      expect(podcastSummary.trackCount, 4);
      expect(podcastSummary.releaseDate, nowTime);
      expect(podcastSummary.artistName, 'a');
      expect(podcastSummary.collectionName, 'b');
      expect(podcastSummary.trackName, 'c');
      expect(podcastSummary.artistViewUrl, 'd');
      expect(podcastSummary.collectionViewUrl, 'e');
      expect(podcastSummary.feedUrl, 'f');
      expect(podcastSummary.trackViewUrl, 'g');
      expect(podcastSummary.artworkUrl30, 'h');
      expect(podcastSummary.artworkUrl60, 'i');
      expect(podcastSummary.artworkUrl100, 'j');
      expect(podcastSummary.artworkUrl600, 'k');
      expect(podcastSummary.country, 'l');
      expect(podcastSummary.primaryGenreName, 'm');
      expect(podcastSummary.genreIds, ['n', 'o']);
      expect(podcastSummary.genres, ['p', 'q']);
    });
  });
}
