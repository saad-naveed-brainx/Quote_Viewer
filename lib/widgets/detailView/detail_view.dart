import 'package:flutter/material.dart';
import '../../../config/theme/light.dart';
import 'package:app/core/constants/app_constants.dart';

class DetailView extends StatelessWidget {
  final String quote;
  final String author;
  const DetailView({super.key, required this.quote, required this.author});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightTheme.backgroundColor,
      appBar: AppBar(
        title: Text('Detail View'),
        backgroundColor: LightTheme.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.gap20Px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello!',
                    style: TextStyle(
                      fontSize: AppConstants.font24Px * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Here is your quote of the day',
                    style: TextStyle(
                      fontSize: AppConstants.font12Px * 2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.gap20Px * 2),
              Center(
                child: Icon(
                  Icons.check_circle,
                  color: LightTheme.appBarColor,
                  size: AppConstants.font24Px * 2,
                ),
              ),
              const SizedBox(height: AppConstants.gap20Px),
              Card(
                color: LightTheme.detailCardColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppConstants.gap16Px * 2,
                    horizontal: AppConstants.gap16Px,
                  ),
                  child: Column(
                    children: [
                      Text(
                        quote,
                        style: TextStyle(
                          fontSize: AppConstants.font24Px,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppConstants.gap16Px * 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            author,
                            style: TextStyle(fontSize: AppConstants.font16Px),
                          ),
                          const SizedBox(width: AppConstants.gap16Px),
                          Icon(Icons.favorite_outline),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
