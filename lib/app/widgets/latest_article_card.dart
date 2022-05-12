import 'package:flutter/material.dart';

class LatestArticleCard extends StatelessWidget {
  final String imageURL;
  final String author;
  final String title;
  final String bodyText;
  const LatestArticleCard({
    Key? key,
    required this.imageURL,
    required this.author,
    required this.title,
    required this.bodyText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: 450,
        width: 330,
        color: Colors.grey[100],
        child: Column(
          children: [
            Image.asset(imageURL),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('by $author\n'),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    bodyText,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
