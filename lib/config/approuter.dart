import 'package:flutter/material.dart';
import '../models/quotesModel.dart';
import '../widgets/detailView/detail_view.dart';

class AppRouter {
  static void navigateToDetailView(BuildContext context, QuotesModel quote) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailView(quote: quote)),
    );
  }
}
