import 'package:flutter/material.dart';
import 'package:study_case_vascomm/shared/theme/theme_config.dart';

class LayaananKhususCard extends StatelessWidget {
  const LayaananKhususCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Layanan Khusus",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Tes Covid 19, Cegah Corona\nSedini Mungkin",
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "Daftar Tes",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Image.network(
              "https://images.squarespace-cdn.com/content/v1/5d3661e199578e0001344e57/1616045349653-UV5S00GU4U9L2Z44LW0P/covid-vaccine_title-page.png?format=2500w",
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
