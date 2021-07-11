import 'package:kyu/src/_request.dart';
import 'package:kyu/src/qod/model.dart';

Future<QuoteOfTheDay> getQuoteOfTheDay() async {
  final r = await requestHandler(qodRest);

  return QuoteOfTheDay.fromJson(r);
}
