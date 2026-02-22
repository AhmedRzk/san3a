import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sign_in.dart';
import 'sign_up.dart';

import 'main_model.dart' show MainModel, createModel;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainWidget.routePath,
      routes: {
        MainWidget.routePath: (_) => const MainWidget(),
        SignInWidget.routePath: (_) => const SignInWidget(),
        SignUpWidget.routePath: (_) => const SignUpWidget(),
      },
    );
  }
}

/// Starting Page
class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  static const String routeName = 'main';
  static const String routePath = '/main';

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  late MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        // Consider moving this color to your theme for consistency.
        backgroundColor: const Color(0xFFD9E2DD),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/1trlz_0.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                )
                    .animate()
                    .move(
                      curve: Curves.easeInOut,
                      duration: 2000.0.ms,
                      begin: const Offset(0.0, 100.0),
                      end: const Offset(0.0, 0.0),
                    )
                    .fade(
                      curve: Curves.easeInOut,
                      delay: 300.0.ms,
                      duration: 350.0.ms,
                      begin: 0.3,
                      end: 1.0,
                    ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await context.pushNamed(
                        SignInWidget.routePath,
                        extra: <String, dynamic>{
                          '__transition_info__': const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade),
                        },
                      );
                    },
                    text: 'Sign In',
                    options: FFButtonOptions(
                      height: 40,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(100, 0, 100, 0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      // Consider moving this color to your theme.
                      color: const Color(0xFF325D3A),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.interTight(),
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ).animate().fade(
                        delay: 1000.ms,
                        duration: 2000.ms,
                        begin: 0.0,
                        end: 1.0,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await context.pushNamed(
                        SignUpWidget.routePath,
                        extra: <String, dynamic>{
                          '__transition_info__': const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
                      );
                    },
                    text: 'Sign Up',
                    options: FFButtonOptions(
                      height: 40,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(97, 0, 97, 0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      // Consider moving this color to your theme.
                      color: const Color(0xFF325D3A),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.interTight(),
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ).animate().fade(
                        delay: 1000.ms,
                        duration: 2000.ms,
                        begin: 0.0,
                        end: 1.0,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
