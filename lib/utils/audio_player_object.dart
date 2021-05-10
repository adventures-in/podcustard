import 'package:audiofileplayer/audiofileplayer.dart';

/// A class to wrap the static [loadFromRemoteUrl] function of the
/// [audiofileplayer]'s [Audio] class
///
/// The only reason we do this is to allow for a mock to be injected
/// during testing
class AudioPlayerObject {
  AudioPlayerObject();

  /// Creates an Audio object using a remote URL.
  ///
  /// --- From [Audio.loadFromRemoteUrl] ----
  /// Returns null if url is invalid.
  /// Note that it returns an Audio sync'ly, though loading occurs async'ly.
  /// Note that onError will fire if remote loading fails (due to connectivity,
  /// invalid url, etc); this usually is fairly quick on iOS, but waits for
  /// a longer timeout on Android.
  /// -------------------------------------
  ///
  Audio? loadFromRemoteUrl(String url,
      {void Function(String?)? onError,
      void Function()? onComplete,
      void Function(double)? onDuration,
      void Function(double)? onPosition}) {
    return Audio.loadFromRemoteUrl(
      url,
      onError: onError,
      onComplete: onComplete,
      onDuration: onDuration,
      onPosition: onPosition,
    );
  }
}
