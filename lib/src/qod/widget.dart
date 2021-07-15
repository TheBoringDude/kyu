import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kyu/src/qod/model.dart';
import 'package:kyu/src/qod/qod.dart';

class QODWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QODWidgetState();
}

class _QODWidgetState extends State<QODWidget> {
  late Future<QuoteOfTheDay> qod;

  @override
  void initState() {
    super.initState();
    qod = getQuoteOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuoteOfTheDay>(
        future: qod,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return showQuote(snapshot.data);
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('${snapshot.error}');
          }

          return CircularProgressIndicator();
        });
  }

  Widget showQuote(QuoteOfTheDay? q) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Image.network("${q?.contents.quotes[0].background}", height: 150),
          ),
          Text(
            '"${q?.contents.quotes[0].quote}"',
            style: TextStyle(
                fontSize: 20,
                letterSpacing: 0.9,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "- ${q?.contents.quotes[0].author}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Divider(height: 30),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('They Said So®'), Text('\u00a9 ${q?.copyright.year}')],
            ),
          )
        ],
      ),
    );
  }
}
