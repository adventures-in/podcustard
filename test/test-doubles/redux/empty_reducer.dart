import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class EmptyReducer extends TypedReducer<AppState, Object> {
  EmptyReducer() : super((state, action) => state);
}
