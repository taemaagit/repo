
import 'package:app_redsag/SecondUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:app_redsag/saga.dart';

//-----------------reducer-------------------------
String addReducer(String state, dynamic action) {
  if (action is Add_Action) {
    return state +"\n"+ "question: "+action.ques+"\n"+"answer: "+action.ans;
  }
  return state;
}
//-------------------actions-------------------
class Add_Action {
  final String ques;
  final String ans;
  Add_Action(this.ques, this.ans);
}
class addq_aAction {}

//---------------------------------------------
void main() {
  var sagaMiddleware = createSagaMiddleware();

  // Create store and apply middleware
  final store = Store(
    addReducer,
    initialState: " ",
    middleware: [applyMiddleware(sagaMiddleware)],
  );

  sagaMiddleware.setStore(store);

  sagaMiddleware.run(addSaga);

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store store;

  MyApp({ this.store}) : super();


  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Redux Saga Example',
          theme: ThemeData(
            primarySwatch: Colors.blue,

          ),
          home: MyHomePage(title: 'Flutter Redux Saga'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({ this.title}) : super();

  final String title;

  @override
  Widget build(BuildContext context) {
    TextEditingController ques= new TextEditingController();
    TextEditingController ans= new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:Container(
      /*  decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bkg.jpg"),
            fit: BoxFit.cover,
          ),
        ),*/
        child: ListView(
            children: <Widget>[
            TextField(
              controller: ques,
            style: TextStyle(height: 1.0),
            decoration: InputDecoration(
                 hintText: "enter question",
            ),
                     ),
        TextField(
          controller: ans,
          style: TextStyle(height: 1.0),
          decoration: InputDecoration(
            hintText: "enter answer",
          ),
        ),

      RaisedButton(
        onPressed: () {
         StoreProvider.of(context).dispatch(Add_Action(ques.text,ans.text));
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(
              builder: (BuildContext context) {
                return new SecondUI();
              }));
        },
        child: Icon(Icons.add),
      ),
    ])
    )
      );
  }
}
