import 'dart:convert';

import 'package:kyu/src/_request.dart';
import 'package:kyu/src/qod/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<QuoteOfTheDay> getQuoteOfTheDay() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? data = prefs.getString("current_data");
  String? reqDate = prefs.getString("current_data_date");
  if (data != null) {
    // if saved data exists
    final r = jsonDecode(data);

    if (reqDate != null) {
      if (_isDataNow(reqDate)) {
        return QuoteOfTheDay.fromJson(r);
      }
    }
  }

  // request handler if not exists or data is not latest
  final d = await requestHandler(qodRest);

  // store responses (should use localStorage in the future)
  await prefs.setString("current_data", d);
  await prefs.setString("current_data_date", DateTime.now().toString());

  return QuoteOfTheDay.fromJson(jsonDecode(d));
}

// checks if date is now or not (TODO: needs improvement)
bool _isDataNow(String date) {
  final t = DateTime.parse(date);

  final now = DateTime.now();
  final current = DateTime(now.year, now.month, now.day);
  final compare = DateTime(t.year, t.month, t.day);

  if (current == compare) {
    return true;
  }

  return false;
}
