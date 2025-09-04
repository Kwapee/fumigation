import 'package:flutter/material.dart';
import 'package:fumigation_app/screens/authenticateduser/homepage.dart';
import 'package:fumigation_app/screens/authentication/signup.dart';
import 'package:fumigation_app/utils/colors.dart';
import 'package:fumigation_app/utils/spacer.dart';
import 'package:fumigation_app/utils/typography.dart';
import 'package:fumigation_app/widgets/components/buttons/primary_button.dart';
import 'package:fumigation_app/widgets/components/inputfield/custom_input_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPack.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorPack.white,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorPack.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.03),
              Text(
                "Login to your account",
                style: tTextStyleBold.copyWith(
                  color: ColorPack.black,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: size.height * 0.05),

              // Email Field
              CustomInputField(
                controller: emailController,
                label: 'Email',
                labelColor: ColorPack.black,
                placeholder: 'Enter your valid email',
                keyboardType: TextInputType.emailAddress, // Use email keyboard
              ),
              twelveVerticalSpace,

              // Password Field
              CustomInputField(
                controller: passwordController,
                label: 'Password',
                labelColor: ColorPack.black,
                placeholder: 'Enter your password',
                obscureText: _obscureText,
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
              ),

              // Forgotten Password Link
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: GestureDetector(
                    onTap: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ForgottenPassword()),
                      );*/
                    },
                    child: Text(
                      "Forgotten Password?",
                      style: tTextStyle600.copyWith(
                        color: ColorPack.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),

              // Login Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PrimaryButton(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                      },
                      buttonTitle: _isLoading ? '' : 'Log in',
                      titleColor: ColorPack.white,
                      height: 60,
                      width: 270,
                      buttonColor: ColorPack.iconOrange,
                    ),
                    if (_isLoading)
                      const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),

              // Signup Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet? ",
                    style: tTextStyle600.copyWith(
                      color: ColorPack.black,
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: Text(
                      "Signup",
                      style: tTextStyle600.copyWith(
                        color: ColorPack.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
