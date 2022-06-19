import 'package:flutter/material.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';
import 'package:sj_member_app/core/Models/auth/login_credentials.dart';
import 'package:sj_member_app/core/Models/auth/login_error.dart';
import 'package:sj_member_app/core/Models/auth/login_success.dart';
import 'package:sj_member_app/core/Services/authentication_service.dart';
import 'package:sj_member_app/locator.dart';

// ignore: import_of_legacy_library_into_null_safe
import '../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  AuthenticationService authenticationService =
      locator<AuthenticationService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image(
                image: AssetImage(
                  "Assets/AFMS_Logo.png",
                ),
                width: 280,
                height: 210,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            hintText: "abc@xyz.com",
                            fillColor: Colors.grey[200],
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.0),
                        TextFormField(
                          controller: passwordController,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            fillColor: Colors.grey[200],
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.visibility,
                                color: Colors.grey[600],
                              ),
                              onPressed: toggle,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 1.0),
                        // TextButton(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         'FORGOT PASSWORD',
                        //         style: overlayStyle.copyWith(
                        //           color: primaryColor,
                        //           fontSize: 14.0,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        //   onPressed: () {},
                        // ),
                        SizedBox(height: 25.0),
                        _isLoading
                            ? Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xFF029247)),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.fromLTRB(30, 15, 30, 15)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(23.0),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'SIGN IN',
                                  style: overlayStyle,
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      LoginSuccess loginSuccess =
                                          await authenticationService.loginUser(
                                              LoginCredentials(
                                                  emailController.text.trim(),
                                                  passwordController.text));
                                      final snackBar = SnackBar(
                                          content: Text(
                                              'Welcome, ${loginSuccess.fullName}'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyApp()));
                                    } catch (e) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      LoginError loginError = e as LoginError;
                                      final snackBar = SnackBar(
                                          content: Text(loginError.message));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  } else {
                                    final snackBar = SnackBar(
                                      content: Text(
                                          "Email and password are required"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
