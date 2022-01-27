import 'package:cashback_mobx/navigation.dart';
import 'package:cashback_mobx/stores/login_store.dart';
import 'package:cashback_mobx/style/app_theme.dart';
import 'package:cashback_mobx/style/my_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? _passwordVisible = false, _check = false;
  late ThemeData themeData;
  LoginStore _loginStore = LoginStore();
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ClipPath(
            clipper: _MyCustomClipper(context),
            child: Container(
              alignment: Alignment.center,
              color: themeData.colorScheme.background,
            )),
        Positioned(
          left: 30,
          right: 30,
          top: MediaQuery.of(context).size.height * 0.2,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Card(
                child: Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 24, top: 8),
                        child: Text(
                          "DINIZ IMPORTS",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline6,
                              fontWeight: 600),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  letterSpacing: 0.1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Usuário ou email",
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    letterSpacing: 0.1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500),
                                prefixIcon: const Icon(MdiIcons.emailOutline),
                              ),
                              onChanged: _loginStore.setUsername,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              child: TextFormField(
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    letterSpacing: 0.1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500),
                                decoration: InputDecoration(
                                  hintText: "Senha",
                                  hintStyle: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      letterSpacing: 0.1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500),
                                  prefixIcon: const Icon(MdiIcons.lockOutline),
                                  suffixIcon: IconButton(
                                    icon: Icon(_loginStore.visiblePassword
                                        ? MdiIcons.eyeOutline
                                        : MdiIcons.eyeOffOutline),
                                    onPressed: _loginStore.changeVisiblePassword,
                                    
                                  ),
                                ),
                                onChanged: _loginStore.setPassword,
                                obscureText: _passwordVisible!,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              alignment: Alignment.centerRight,
                              child: Text("Esqueceu a senha?",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 500)),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    activeColor: themeData.colorScheme.primary,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _check = value;
                                      });
                                    },
                                    value: _check,
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  Text(
                                    "Lembrar de mim",
                                    style: themeData.textTheme.bodyText2!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground)),
                                  )
                                ],
                              ),
                            ),
                            Observer(
                              builder: (_) => Container(
                                margin: const EdgeInsets.only(top: 16),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: themeData.colorScheme.primary
                                          .withAlpha(18),
                                      blurRadius: 3,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            Spacing.xy(16, 0))),
                                    onPressed: _loginStore.enableLogin() ? () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Navigation()));
                                    } : null,
                                    
                                    child: Text("LOGIN",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.button,
                                            fontWeight: 600,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            letterSpacing: 0.5))),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 24,
          left: 12,
          child: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: themeData.colorScheme.onBackground,
          ),
        )
      ],
    ));
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
