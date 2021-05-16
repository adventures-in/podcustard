import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:redfire/auth/actions/sign_in_with_google_action.dart';
import 'package:redux/redux.dart';

class SignInWithGoogleMiddleware
    extends TypedMiddleware<AppState, SignInWithGoogleAction> {
  SignInWithGoogleMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          // signin and listen to the stream and dispatch actions
          authService.googleSignInStream.listen(store.dispatch);
        });
}
