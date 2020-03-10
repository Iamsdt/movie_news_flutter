import 'package:movie_news/repo/logger/Timber.dart';

main() {
  Timber.i("Hello");

  try {
    throw AssertionError();
  } catch (ext) {
    //Timber.log("Hey I got exception", error: ext);
    Timber.e("Hello", ext);
  }
}
