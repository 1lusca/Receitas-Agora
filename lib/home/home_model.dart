import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_widget.dart' show HomeWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getArticles)] action in home widget.
  ApiCallResponse? getSpecialArticlesResult;
  // Stores action output result for [Backend Call - API (getArticles)] action in home widget.
  ApiCallResponse? getArticlesResult;
  // Stores action output result for [Backend Call - API (getArticles)] action in Container widget.
  ApiCallResponse? getArticlesTodosResult;
  // Stores action output result for [Backend Call - API (getArticles)] action in Container widget.
  ApiCallResponse? getArticlesSalgadosResult;
  // Stores action output result for [Backend Call - API (getArticles)] action in Container widget.
  ApiCallResponse? getArticlesLanchesResult;
  // Stores action output result for [Backend Call - API (getArticles)] action in Container widget.
  ApiCallResponse? getArticlesSaudaveisResult;
  // Stores action output result for [Backend Call - API (getArticles)] action in Container widget.
  ApiCallResponse? getArticlesDocesResult;
  // Stores action output result for [Backend Call - API (getArticles)] action in Container widget.
  ApiCallResponse? getArticlesBebidasResult;
  // Stores action output result for [Backend Call - API (getArticles)] action in Button widget.
  ApiCallResponse? getArticlesPreviousPage;
  // Stores action output result for [Backend Call - API (getArticles)] action in Button widget.
  ApiCallResponse? getArticlesNextPage;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
