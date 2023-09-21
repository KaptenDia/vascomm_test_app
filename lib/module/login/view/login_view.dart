import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_case_vascomm/core.dart';
import 'package:study_case_vascomm/data/user/user_data.dart';
import 'package:study_case_vascomm/model/users/users_model.dart';
import 'package:study_case_vascomm/service/users_service/users_service.dart';
import 'package:study_case_vascomm/shared/util/validator/validator.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginBloc bloc = LoginBloc();
  final ILogin _loginService = UsersService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {},
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final bloc = context.read<LoginBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  buildView(
    BuildContext context,
    LoginBloc bloc,
    LoginState state,
  ) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Hai, ",
                      style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Selamat Datang",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Silahkan login untuk melanjutkan",
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Image.network(
                      "https://img.freepik.com/free-vector/videocalling-with-therapist_23-2148512091.jpg?w=1380&t=st=1695226359~exp=1695226959~hmac=2b245d933340ee5f92e98b0f1cc5a35ea84ee75bf2bd1dd3c9825d446d6f15b2",
                      height: 250,
                    ),
                  ),
                  QTextField(
                    title: "Email",
                    label: "Masukkan email anda",
                    validator: Validator.email,
                    onChanged: (value) {
                      _emailController.text = value;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  QTextField(
                    title: "Password",
                    label: "Masukkan password anda",
                    titleRow: true,
                    isPassword: true,
                    obscure: true,
                    validator: Validator.required,
                    onChanged: (value) {
                      _passwordController.text = value;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  QButton(
                    label: "Login",
                    prefixIcon: Icons.abc,
                    sufixIcon: Icons.arrow_forward,
                    spaceBetween: true,
                    onPressed: () async {
                      bool isValid = formKey.currentState!.validate();
                      if (!isValid) {
                        // early return
                        return;
                      }
                      UserModel? user = await _loginService.login(
                          _emailController.text, _passwordController.text);
                      if (user != null) {
                        Get.to(const DashboardView());
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: primaryColor,
                            duration: const Duration(seconds: 3),
                            content: const Center(
                              child: Text(
                                'Email atau Password salah',
                              ),
                            ),
                          ),
                        );
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Belum punya akun ? ",
                        style: TextStyle(
                          fontSize: 16,
                          color: secondaryTextColor,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(const RegisterView());
                              },
                            text: "Daftar sekarang",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.copyright,
                        color: secondaryTextColor,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "SILK. all right reserved.",
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
        ),
      ),
    );
  }
}
