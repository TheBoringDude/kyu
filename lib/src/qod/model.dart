// Quote of the Day wrapper

// rest api url for the API (Quote of the day)
final qodRest = 'https://quotes.rest/qod';

class QuoteOfTheDay {
  QuoteSuccess success;
  QuoteContents contents;
  String baseurl;
  QuoteCopyright copyright;

  QuoteOfTheDay({
    required this.success,
    required this.contents,
    required this.baseurl,
    required this.copyright,
  });

  factory QuoteOfTheDay.fromJson(Map<String, dynamic> data) {
    return QuoteOfTheDay(
        success: QuoteSuccess.fromJson(data['success']),
        contents: QuoteContents.fromJson(data['contents']),
        baseurl: data['baseurl'],
        copyright: QuoteCopyright.fromJson(data['copyright']));
  }
}

class QuoteContents {
  List<Quote> quotes;

  QuoteContents({
    required this.quotes,
  });

  factory QuoteContents.fromJson(Map<String, dynamic> data) {
    Iterable _q = data['quotes'];

    return QuoteContents(quotes: List<Quote>.from(_q.map((e) => Quote.fromJson(e))));
  }
}

class Quote {
  String quote;
  String length;
  String author;
  Map<String, dynamic> tags;
  String category;
  String language;
  String date;
  String permalink;
  String id;
  String background;
  String title;

  Quote({
    required this.quote,
    required this.length,
    required this.author,
    required this.tags,
    required this.category,
    required this.language,
    required this.date,
    required this.permalink,
    required this.id,
    required this.background,
    required this.title,
  });

  factory Quote.fromJson(Map<String, dynamic> data) {
    return Quote(
        quote: data['quote'],
        length: data['length'],
        author: data['author'],
        tags: data['tags'],
        category: data['category'],
        language: data['language'],
        date: data['date'],
        permalink: data['permalink'],
        id: data['id'],
        background: data['background'],
        title: data['title']);
  }
}

class QuoteCopyright {
  int year;
  String url;

  QuoteCopyright({
    required this.year,
    required this.url,
  });

  factory QuoteCopyright.fromJson(Map<String, dynamic> data) {
    return QuoteCopyright(year: data['year'], url: data['url']);
  }
}

class QuoteSuccess {
  int total;

  QuoteSuccess({
    required this.total,
  });

  factory QuoteSuccess.fromJson(Map<String, dynamic> data) {
    return QuoteSuccess(total: data['total']);
  }
}
