import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fumigation_app/screens/authentication/signin.dart';
import 'package:fumigation_app/utils/colors.dart';
import 'package:fumigation_app/utils/spacer.dart';
import 'package:fumigation_app/utils/typography.dart';
import 'package:fumigation_app/widgets/components/buttons/primary_button.dart';
import 'package:fumigation_app/widgets/components/inputfield/custom_input_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  // --- Controllers ---
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final secondnameController = TextEditingController();
  final cityController = TextEditingController();
  final phonenumberController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstnameController.dispose();
    secondnameController.dispose();
    cityController.dispose();
    phonenumberController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPack.white,
     
      appBar: AppBar(
        title: Text(
          "SignUp",
          style: tTextStyleBold.copyWith(
            color: ColorPack.black,
            fontSize: size.width * 0.045,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- First Name ---
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                        ),
                        child: CustomInputField(
                          controller: firstnameController,
                          label: 'First Name',
                          labelColor: ColorPack.black,
                          placeholder: 'Enter your first name',
                          obscureText: false,
                          readOnly: false,
                          validator:
                              (value) =>
                                  (value == null || value.trim().isEmpty)
                                      ? 'First name is required'
                                      : null,
                        ),
                      ),
                      twelveVerticalSpace,

                      // --- Second Name ---
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                        ),
                        child: CustomInputField(
                          controller: secondnameController,
                          label: 'Second Name',
                          labelColor: ColorPack.black,
                          placeholder: 'Enter your second name',
                          obscureText: false,
                          readOnly: false,
                          validator:
                              (value) =>
                                  (value == null || value.trim().isEmpty)
                                      ? 'Second name is required'
                                      : null,
                        ),
                      ),
                      twelveVerticalSpace,

                      // --- Email ---
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                        ),
                        child: CustomInputField(
                          controller: emailController,
                          label: 'Email',
                          labelColor: ColorPack.black,
                          placeholder: 'Enter your valid email',
                          obscureText: false,
                          readOnly: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty)
                              return 'Email is required';
                            if (!RegExp(
                              r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                            ).hasMatch(value))
                              return 'Please enter a valid email';
                            return null;
                          },
                        ),
                      ),
                      twelveVerticalSpace,

                      // --- Password ---
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                        ),
                        child: CustomInputField(
                          controller: passwordController,
                          label: 'Password',
                          labelColor: ColorPack.black,
                          placeholder: 'Enter your password',
                          obscureText: _obscureText,
                          readOnly: false,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? FontAwesomeIcons.eyeSlash
                                  : FontAwesomeIcons.eye,
                              size: 20,
                              color: ColorPack.black,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Password is required';
                            if (value.length < 6)
                              return 'Password must be at least 6 characters';
                            return null;
                          },
                        ),
                      ),

                      twelveVerticalSpace,

                      // --- Phone Number ---
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                        ),
                        child: CustomInputField(
                          controller: phonenumberController,
                          label: 'Phone Number',
                          labelColor: ColorPack.black,
                          placeholder: 'Enter your phone number',
                          obscureText: false,
                          readOnly: false,
                          keyboardType: TextInputType.phone,
                          validator:
                              (value) =>
                                  (value == null || value.trim().isEmpty)
                                      ? 'Phone number is required'
                                      : null,
                        ),
                      ),

                      fiftySpacerHorizontal,

                      // --- Submit Button ---
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.15,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            PrimaryButton(
                              onTap: () {},
                              buttonTitle: 'Register',
                              titleColor: ColorPack.white,
                              height: 60,
                              width: 270,
                              buttonColor: ColorPack.iconOrange,
                            ),
                          ],
                        ),
                      ),

                      // --- Login Link ---
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.02,
                          bottom: size.height * 0.10,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Already have an account?",
                                style: tTextStyle600.copyWith(
                                  color: ColorPack.black,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 5),
                              GestureDetector(
                                onTap:
                                    () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignIn(),
                                      ),
                                    ),
                                child: Text(
                                  "Login",
                                  style: tTextStyle600.copyWith(
                                    color: ColorPack.black,
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ColorPack.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
