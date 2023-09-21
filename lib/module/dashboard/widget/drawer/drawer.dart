import 'package:flutter/material.dart';
import 'package:study_case_vascomm/core.dart';
import 'package:study_case_vascomm/service/users_service/users_service.dart';

class DrawerDashboard extends StatelessWidget {
  const DrawerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.8,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120.0,
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    "https://i.ibb.co/QrTHd59/woman.jpg",
                  ),
                ),
                title: Text(
                  "Angga Praja",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text("Membership BBLK"),
              ),
              ListTile(
                onTap: () {
                  Get.to(const ProfileView());
                },
                title: Text(
                  "Profile Saya",
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: secondaryTextColor,
                  size: 16,
                ),
              ),
              ListTile(
                title: Text(
                  "Pengaturan",
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: secondaryTextColor,
                  size: 16,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              QButton(
                label: "Logout",
                onPressed: () async {
                  final logoutValue = await UsersService().logout();
                  if (logoutValue == true) {
                    Get.toReplacement(const LoginView());
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text(
                          'error with your token, have to login again',
                        ),
                      ),
                    );
                    Get.toReplacement(const LoginView());
                  }
                },
                color: Colors.red,
                radius: 100,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ikuti kami di",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  const Icon(Icons.facebook),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Image.network(
                    "https://cdn3.iconfinder.com/data/icons/glypho-free/64/logo-instagram-512.png",
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Image.network(
                    "https://w7.pngwing.com/pngs/515/1/png-transparent-twitter-logo-computer-icons-logo-twitter-icon-computer-wallpaper-monochrome-bird-thumbnail.png",
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FAQ",
                    style: TextStyle(color: secondaryTextColor),
                  ),
                  Text(
                    "Terms and Conditions",
                    style: TextStyle(color: secondaryTextColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
