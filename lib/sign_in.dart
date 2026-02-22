import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';

import 'sign_in_model.dart';
import 'main_model.dart' show createModel;

final _logger = Logger('san3a.sign_in');

/// Sign In page
class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  static const String routeName = 'SignIn';
  static const String routePath = '/SignIn';

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  late SignInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignInModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
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
        backgroundColor: const Color(0xFFD9E2DD),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/1trlz_0.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    )
                    .ffAnimate()
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
                const SizedBox(height: 15),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    autofocus: true,
                    enabled: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText: 'Email',
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(
                        context,
                      ).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    enableInteractiveSelection: true,
                    validator: _model.textController1Validator.asValidator(
                      context,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    autofocus: false,
                    enabled: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText: 'Password',
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(
                        context,
                      ).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    enableInteractiveSelection: true,
                    validator: _model.textController2Validator.asValidator(
                      context,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child:
                      FFButtonWidget(
                        onPressed: () => _logger.info('SignIn pressed ...'),
                        text: 'Sign In',
                        options: FFButtonOptions(
                          height: 40,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            97,
                            0,
                            97,
                            0,
                          ),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0,
                            0,
                            0,
                            0,
                          ),
                          color: const Color(0xFF325D3A),
                          textStyle: FlutterFlowTheme.of(context).titleSmall
                              .override(
                                font: GoogleFonts.interTight(),
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                          elevation: 0,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ).ffAnimate().fade(
                        curve: Curves.easeInOut,
                        delay: 1000.0.ms,
                        duration: 2000.0.ms,
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
