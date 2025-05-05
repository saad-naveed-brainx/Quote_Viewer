import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/view_constants.dart';
import '../../../config/theme/light.dart';
import 'package:dio/dio.dart';
import '../../models/quotes_model.dart';
import '../../../config/approuter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: LightTheme.backgroundColor,
        title: Text(
          ViewConstants.titleHomePage,
          style: TextStyle(
            color: Colors.black,
            fontSize: AppConstants.font24Px,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            iconSize: AppConstants.font24Px,
          ),
        ],
      ),
      body: HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});
  @override
  HomeScreenBodyState createState() => HomeScreenBodyState();
}

class HomeScreenBodyState extends State<HomeScreenBody> {
  List<QuotesModel> quotes = [];

  @override
  void initState() {
    super.initState();
    fetchMultipleQuotes();
  }

  Future<void> fetchMultipleQuotes() async {
    try {
      final responses = await Future.wait([
        getQuotes(),
        getQuotes(),
        getQuotes(),
        getQuotes(),
        getQuotes(),
        getQuotes(),
        getQuotes(),
        getQuotes(),
        getQuotes(),
        getQuotes(),
        getQuotes(),
        getQuotes(),
      ]);

      quotes =
          responses
              .expand((response) => response.data)
              .map(
                (quote) =>
                    QuotesModel(quote: quote['quote'], author: quote['author']),
              )
              .toList();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Future<Response> getQuotes() async {
    try {
      return await Dio().get(
        'https://api.api-ninjas.com/v1/quotes',
        options: Options(
          headers: {'X-Api-Key': 'Etpmr7hrwSSiZ/XT0NJeSA==veUsb3bqwdU21xXj'},
        ),
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              AppRouter.push(context, quotes[index]);
            },
            child: Card(
              color: LightTheme.cardColor,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppConstants.gap16Px,
                  bottom: AppConstants.gap16Px,
                  left: AppConstants.gap16Px,
                  right: AppConstants.gap16Px,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppConstants.gap12Px,
                    right: AppConstants.gap12Px,
                    top: AppConstants.gap24Px,
                    bottom: AppConstants.gap24Px,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.format_quote,
                            size: 32,
                            color: LightTheme.textColorCard,
                          ),
                        ],
                      ),
                      SizedBox(height: AppConstants.gap24Px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              quotes[index].quote,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: LightTheme.textColorCard,
                                fontSize: AppConstants.font24Px,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.more_rounded,
                            size: 24,
                            color: LightTheme.textColorCard,
                          ),
                        ],
                      ),
                      SizedBox(height: AppConstants.gap16Px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Text('5 min . 100 views')],
                      ),
                      SizedBox(height: AppConstants.gap16Px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: LightTheme.textColorCardAuthor,
                              borderRadius: BorderRadius.circular(
                                AppConstants.gap12Px,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: AppConstants.gap16Px,
                                right: AppConstants.gap16Px,
                                top: AppConstants.gap8Px,
                                bottom: AppConstants.gap8Px,
                              ),
                              child: Text(
                                quotes[index].author,
                                style: TextStyle(
                                  color: LightTheme.cardColor,
                                  fontSize: AppConstants.font16Px,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
