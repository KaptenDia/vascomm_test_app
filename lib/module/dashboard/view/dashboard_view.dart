import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_case_vascomm/core.dart';
import 'package:study_case_vascomm/model/users/users_model.dart';

class DashboardView extends StatefulWidget {
  final UserModel? user;
  const DashboardView({Key? key, this.user}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  DashboardBloc bloc = DashboardBloc();
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
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => bloc,
      child: BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {},
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            final bloc = context.read<DashboardBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  buildView(
    BuildContext context,
    DashboardBloc bloc,
    DashboardState state,
  ) {
    return Scaffold(
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
              const SolutionCard(),
              const SizedBox(
                height: 20.0,
              ),
              const LayaananKhususCard(),
              const SizedBox(
                height: 20.0,
              ),
              const TrackPemeriksaanCard(),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.tune,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Search',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  itemCount: state.buttonList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            backgroundColor: state.tapIndex == index
                                ? primaryColor
                                : Colors.white),
                        onPressed: () => setState(() => state.tapIndex = index),
                        child: Text(
                          state.buttonList[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: state.tapIndex == index
                                ? Colors.white
                                : primaryColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: const ProductCard());
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Pilih Tipe Layanan Kesehatan Anda",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: TabBar(
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
                        text: 'Satuan',
                      ),
                      Tab(
                        text: 'Paket Pemeriksaan',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              ListView.builder(
                itemCount: state.news.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                clipBehavior: Clip.none,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var newsItem = state.news[index].articles?[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: NewsCard(
                      title: newsItem?.title,
                      image: newsItem?.urlToImage,
                      author: newsItem?.author,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
