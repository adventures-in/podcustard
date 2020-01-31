import 'package:redux/redux.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/actions.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddProblem>(_addProblem),
  TypedReducer<AppState, StoreUser>(_storeUser),
  TypedReducer<AppState, StoreAuthStep>(_storeAuthStep),
  TypedReducer<AppState, StoreMainPageIndex>(_storeMainPageIndex),
  TypedReducer<AppState, StorePodcastSummaries>(_storePodcastSummaries),
  TypedReducer<AppState, StoreThemeMode>(_storeThemeMode),
  TypedReducer<AppState, SelectPodcast>(_storePodcastSummary),
  TypedReducer<AppState, StoreFeed>(_storeFeed),
  TypedReducer<AppState, ClearPodcastSelection>(_clearPodcastSelection),
  TypedReducer<AppState, StoreTrack>(_storeTrack),
  TypedReducer<AppState, StoreTrackState>(_storeTrackState),
  // ...userReducers,
]);

AppState _addProblem(AppState state, AddProblem action) {
  return state.rebuild((b) => b..problems.add(action.problem));
}

AppState _storeUser(AppState state, StoreUser action) {
  // we need to be able to set user to null for when no user signed in
  // but replace won't take null
  // TODO: determine if there is a more elegant way to do this
  // see: https://github.com/google/built_value.dart/issues/238
  return (action.user == null)
      ? state.rebuild((b) => b..user = null)
      : state.rebuild((b) => b..user.replace(action.user));
}

AppState _storeAuthStep(AppState state, StoreAuthStep action) {
  return state.rebuild((b) => b..authStep = action.step);
}

AppState _storeMainPageIndex(AppState state, StoreMainPageIndex action) {
  return state.rebuild((b) => b..mainPageIndex = action.index);
}

AppState _storePodcastSummaries(AppState state, StorePodcastSummaries action) {
  return state.rebuild((b) => b.podcastSummaries.replace(action.summaries));
}

AppState _storeThemeMode(AppState state, StoreThemeMode action) {
  return state.rebuild((b) => b.themeMode = action.themeMode);
}

AppState _storePodcastSummary(AppState state, SelectPodcast action) {
  return state.rebuild((b) => b..detailVM.summary = action.podcast.toBuilder());
}

AppState _storeFeed(AppState state, StoreFeed action) {
  return state.rebuild((b) => b..detailVM.feed = action.feed.toBuilder());
}

AppState _clearPodcastSelection(AppState state, ClearPodcastSelection action) {
  return state.rebuild((b) => b..detailVM = null);
}

AppState _storeTrack(AppState state, StoreTrack action) {
  return state.rebuild((b) => b..track.replace(action.track));
}

AppState _storeTrackState(AppState state, StoreTrackState action) {
  return state.rebuild((b) => b..track.state = action.state);
}
