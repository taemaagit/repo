import 'package:app_redsag/main.dart';
import 'package:redux_saga/redux_saga.dart';

addq_a({action}) sync* {
  yield Put(Add_Action("",""));
}

addSaga() sync* {
    yield TakeEvery(addq_a, pattern: addq_aAction);
}