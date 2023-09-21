import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_case_vascomm/shared/theme/theme_config.dart';
import 'package:study_case_vascomm/shared/widgets/button/button.dart';
import 'package:study_case_vascomm/shared/widgets/textfield/text_field.dart';
import 'package:study_case_vascomm/state_util.dart';
import '../bloc/register_bloc.dart';
import '../state/register_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterBloc bloc = RegisterBloc();

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
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {},
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            final bloc = context.read<RegisterBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  buildView(
    BuildContext context,
    RegisterBloc bloc,
    RegisterState state,
  ) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: QTextField(
                        label: "Nama depan",
                        onChanged: (value) {},
                        title: "Nama Depan",
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: QTextField(
                        label: "Nama belakang",
                        onChanged: (value) {},
                        title: "Nama Belakang",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                QTextField(
                  label: "Masukkan No. KTP anda",
                  onChanged: (value) {},
                  title: "No. KTP",
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
                  title: "No. Telpon",
                ),
                const SizedBox(
                  height: 12.0,
                ),
                QTextField(
                  label: "Masukkan password anda",
                  onChanged: (value) {},
                  title: "Password",
                ),
                const SizedBox(
                  height: 12.0,
                ),
                QTextField(
                  label: "Masukkan kembali password anda",
                  onChanged: (value) {},
                  title: "Konfirmasi Password",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                QButton(
                  label: "Register",
                  prefixIcon: Icons.abc,
                  sufixIcon: Icons.arrow_forward,
                  spaceBetween: true,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Sudah punya akun ? ",
                      style: TextStyle(
                        fontSize: 16,
                        color: secondaryTextColor,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            },
                          text: "Login sekarang",
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
    );
  }
}
