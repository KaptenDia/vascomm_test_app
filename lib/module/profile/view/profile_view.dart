import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_case_vascomm/core.dart';
import 'package:study_case_vascomm/module/profile/widget/card/profile_card.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  ProfileBloc bloc = ProfileBloc();
  late TabController tabController;

  @override
  void initState() {
    bloc.initState();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => bloc,
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            final bloc = context.read<ProfileBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  buildView(
    BuildContext context,
    ProfileBloc bloc,
    ProfileState state,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xffF0FEFF),
      drawer: const DrawerDashboard(),
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: TabBar(
                    padding: const EdgeInsets.all(8),
                    unselectedLabelColor: primaryColor,
                    labelColor: Colors.black,
                    indicatorColor: Colors.white,
                    indicatorWeight: 2,
                    indicator: BoxDecoration(
                      color: const Color(0xff01FFE1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    controller: tabController,
                    tabs: const [
                      Tab(
                        text: 'Profile Saya',
                      ),
                      Tab(
                        text: 'Pengaturan',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const ProfileCard(),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pilih data yang ingin ditampilkan",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: const Color(0xff01FFE1),
                            child: Center(
                              child: Icon(
                                Icons.location_history_sharp,
                                color: primaryColor,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Data Diri",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Data diri anda sesuai KTP",
                                style: TextStyle(
                                  color: secondaryTextColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey[300],
                            child: Center(
                              child: Icon(
                                Icons.location_on,
                                color: secondaryTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      QTextField(
                        label: "Nama depan",
                        onChanged: (value) {},
                        title: "Nama Depan",
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      QTextField(
                        label: "Nama belakang",
                        onChanged: (value) {},
                        title: "Nama Belakang",
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      QTextField(
                        label: "Masukkan email anda",
                        onChanged: (value) {},
                        title: "Email",
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      QTextField(
                        label: "Masukkan no telepon anda",
                        onChanged: (value) {},
                        title: "No Telepon",
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      QTextField(
                        label: "Masukkan no KTP anda",
                        onChanged: (value) {},
                        title: "No KTP",
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text(
                              "Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya",
                              maxLines: 2,
                              style: TextStyle(
                                color: secondaryTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      QButton(
                        label: "Simpan Profile",
                        spaceBetween: true,
                        sufixIcon: Icons.save_outlined,
                        prefixIcon: Icons.abc,
                        onPressed: () {
                          Get.back();
                        },
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
