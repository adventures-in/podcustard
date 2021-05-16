import 'package:podcustard/models/app_state.dart';
import 'package:redfire/problems/actions/add_problem_action.dart';
import 'package:redux/redux.dart';

class AddProblemReducer extends TypedReducer<AppState, AddProblemAction> {
  AddProblemReducer()
      : super(
          (state, action) => state.copyWith(
            problems: state.problems.add(action.info),
          ),
        );
}
