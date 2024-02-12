import 'package:evaz_test_project/bloc/auth_bloc.dart';
import 'package:evaz_test_project/utils/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controller_name = TextEditingController();
  TextEditingController controller_surname = TextEditingController();
  TextEditingController controller_parentName = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<AuthBloc>(context).add(CheckRegisterEvent());
    });
  }

  @override
  void dispose() {
    controller_name.dispose();
    controller_surname.dispose();
    controller_parentName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is FullRegisterState) {
        controller_name.text = state.user.name ?? "";
        controller_surname.text = state.user.surname ?? '';
        controller_parentName.text = state.user.parentName ?? '';
        setState(() {});
      }
    }, builder: (context, state) {
      return Container(
        child: Form(
          key: _formKey,
          child: Column(children: [
            24.height,
            Text(
              "Регистрация",
              style: TextStyle(fontSize: 24),
            ),
            16.height,
            TextFormField(
                validator: validator,
                controller: controller_name,
                decoration: inpDecor("Имя")),
            14.height,
            TextFormField(
                validator: validator,
                controller: controller_surname,
                decoration: inpDecor("Фамилия")),
            14.height,
            TextFormField(
                validator: validator,
                controller: controller_parentName,
                decoration: inpDecor("Отчество")),
            ElevatedButton(
                child: Text("Зарегистрироваться"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<AuthBloc>(context).add(AnonymRegisterEvent(
                        firstName: controller_name.text,
                        surname: controller_surname.text,
                        parentName: controller_parentName.text));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Вы успешно зарегистрировались!')));
                  }
                  
                })
          ]).paddingOnly(left: 16, right: 16, top: 16),
        ),
      );
    });
  }

  String? validator(String? text) {
    if (text == null || text.isEmpty) {
      return "Заполните поле";
    }
    return null;
  }
}
