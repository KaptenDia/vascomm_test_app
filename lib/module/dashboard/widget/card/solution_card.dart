import 'package:flutter/material.dart';
import 'package:study_case_vascomm/shared/theme/theme_config.dart';
import 'package:study_case_vascomm/shared/widgets/button/button.dart';
import 'package:study_case_vascomm/state_util.dart';

class SolutionCard extends StatelessWidget {
  const SolutionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 250,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: Get.width,
              height: 180,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xffBDDAEB),
                    Colors.white,
                  ],
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: secondaryTextColor.withOpacity(0.3),
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Solusi, ",
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Kesehatan Anda",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Wrap(
                    children: [
                      Text(
                        "Update informasi seputar kesehatan",
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Semua bisa disini !",
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  QButton(
                    label: "Selengkapnya",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 10,
            child: CircleAvatar(
              radius: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  "https://img.freepik.com/free-vector/desk-calendar-with-marked-dates-3d-cartoon-style-icon-planning-time-meeting-scheduling-flat-vector-illustration-appointment-deadline-agenda-reminder-time-management-concept_74855-25964.jpg?w=826&t=st=1695231619~exp=1695232219~hmac=d0680a75e5dbb20aefd808be09fd93343a0568e9e7e5b33270d7ad90a2773579",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
