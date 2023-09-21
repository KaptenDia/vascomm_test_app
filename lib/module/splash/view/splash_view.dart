import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/splash_bloc.dart';
import '../state/splash_state.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashBloc bloc = SplashBloc();

  @override
  void initState() {
    bloc.initState();
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
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {},
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            final bloc = context.read<SplashBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  buildView(
    BuildContext context,
    SplashBloc bloc,
    SplashState state,
  ) {
    return Scaffold(
      body: Center(
        child: Image.network(
          "https://media.licdn.com/dms/image/C510BAQGBcxTbKXao4A/company-logo_200_200/0/1586855442622?e=2147483647&v=beta&t=J4W5xXVdaJxrgjfTIdN8VdXhvart5z8BoYA0NDvXii4",
        ),
      ),
    );
  }
}
