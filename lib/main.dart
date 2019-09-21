
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


enum CounterEvent {
  increment,
  decrement
}

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Bloc Counter',
      home: BlocProvider<CounterBloc>(
        builder: (context) => CounterBloc(),
        child: CounterPage(),
      )

    );
  }
}

class CounterBloc extends Bloc<CounterEvent, int> {

  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    // TODO: implement mapEventToState
    switch(event) {
      case CounterEvent.decrement:
        yield currentState - 1;
        break;
      case CounterEvent.increment:
        yield currentState + 1;
        break;
    }
  }

}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter'),
      ),

      body: BlocBuilder<CounterBloc, int>(

        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,

        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                counterBloc.dispatch(CounterEvent.increment);
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                counterBloc.dispatch(CounterEvent.decrement);
              },
            ),
          )
        ],
      ),
    );
  }
}
