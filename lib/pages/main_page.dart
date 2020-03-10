import 'package:flutter/material.dart';
import 'package:movie_news/repo/MyRepo.dart';
import 'package:movie_news/repo/model/Result.dart';
import 'package:movie_news/routes/route.gr.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie News App"),
        backgroundColor: Colors.deepOrange,
      ),
      body: StateBuilder(
        models: [Injector.getAsReactive<MyRepo>()],
        builder: (ctx, model) {
          return model.whenConnectionState(
            onIdle: () => onLoading(),
            onWaiting: () => onLoading(),
            onData: (state) => showCompleteUI(state),
            onError: (error) => onError(error),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: sendRequest),
    );
  }

  @override
  void initState() {
    //todo uncomment it latter
    //sendRequest();
    super.initState();
  }

  void sendRequest() {
    final reactiveModel = Injector.getAsReactive<MyRepo>();
    reactiveModel.setState(
      (store) => store.getMovies(),
      onError: (context, error) {
        if (error is Error) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Couldn't fetch weather. Is the device online?"),
            ),
          );
        }
      },
    );
  }

  Widget onLoading() {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 6.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 0.8,
              child: Text(
                "Data is loading from server...",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showCompleteUI(state) {
    print("Data types");
    print(state);

    if (state is MyRepo) {
      var movie = state.movies;
      return Container(
        child: ListView.builder(
            itemCount: movie.results.length,
            itemBuilder: (BuildContext context, int pos) {
              Result result = movie.results[pos];
              var link = "http://image.tmdb.org/t/p/w185";
              return InkWell(
                onTap: () {
                  goToNextPage(result);
                },
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 500,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(link + result.poster_path),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom: 10.0, left: 10.0, right: 10.0),
                            child: Text(
                              result.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 23.0, color: Colors.white),
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    }
    return Container(
      alignment: Alignment.center,
      child: Text(
        "!opps",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget onError(error) {
    print(error);
    return Container(
      child: Text("I got error"),
    );
  }

  void goToNextPage(Result result) {
    MyRoute.navigator.pushNamed(MyRoute.details, arguments: result);
  }
}
