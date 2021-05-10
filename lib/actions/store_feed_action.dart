import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';
import 'package:podcustard/models/rss/rss_feed.dart';

part 'store_feed_action.freezed.dart';
part 'store_feed_action.g.dart';

@freezed
class StoreFeedAction with _$StoreFeedAction, ReduxAction {
  factory StoreFeedAction(RssFeed feed) = _StoreFeedAction;

  factory StoreFeedAction.fromJson(Map<String, dynamic> json) =>
      _$StoreFeedActionFromJson(json);
}
