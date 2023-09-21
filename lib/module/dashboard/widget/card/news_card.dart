import 'package:flutter/material.dart';
import 'package:study_case_vascomm/shared/theme/theme_config.dart';

class NewsCard extends StatelessWidget {
  final String? title;
  final String? image;
  final String? author;
  const NewsCard(
      {super.key,
      required this.title,
      required this.image,
      required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "Title not available",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text(author ?? "No Author"),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.maps_home_work,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      const Text("United States"),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "US",
                        style: TextStyle(
                          color: secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Container(
            height: 186,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                  image ??
                      "https://mayapadahospital.com/images/news/Mayapada%20Hospital%20Surabaya.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
