import 'package:flutter/material.dart';
import '../models/quotes_model.dart';
import '../widgets/detailView/detail_view.dart';

class AppRouter {
  static void push(BuildContext context, QuotesModel quote) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailView(quote: quote)),
    );
  }
}
