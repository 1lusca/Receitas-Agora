import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'super_article_model.dart';
export 'super_article_model.dart';

class SuperArticleWidget extends StatefulWidget {
  const SuperArticleWidget({
    Key? key,
    this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  _SuperArticleWidgetState createState() => _SuperArticleWidgetState();
}

class _SuperArticleWidgetState extends State<SuperArticleWidget> {
  late SuperArticleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuperArticleModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().linkUrlDicasLeitor = functions
            .getArticleLinksUrlDicaLeitor(getJsonField(
              widget.data,
              r'''$.content.rendered''',
            ).toString().toString())
            .toList()
            .cast<String>();
        FFAppState().linkTextDicasLeitor = functions
            .getArticleLinksTextDicaLeitor(getJsonField(
              widget.data,
              r'''$.content.rendered''',
            ).toString().toString())
            .toList()
            .cast<String>();
        FFAppState().utensiliosText = functions
            .getArticleUtensiliosText(getJsonField(
              widget.data,
              r'''$.content.rendered''',
            ).toString().toString())
            .toList()
            .cast<String>();
        FFAppState().utensiliosUrl = functions
            .getArticleUtensiliosUrl(getJsonField(
              widget.data,
              r'''$.content.rendered''',
            ).toString().toString())
            .toList()
            .cast<String>();
        FFAppState().outrasReceitasUrl = functions
            .getArticleOutrasReceitasUrl(getJsonField(
              widget.data,
              r'''$.content.rendered''',
            ).toString().toString())
            .toList()
            .cast<String>();
        FFAppState().outrasReceitasText = functions
            .getArticleOutrasReceitasText(getJsonField(
              widget.data,
              r'''$.content.rendered''',
            ).toString().toString())
            .toList()
            .cast<String>();
      });
    });

    _model.nomeController ??= TextEditingController();
    _model.nomeFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.comentarioController ??= TextEditingController();
    _model.comentarioFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  children: [
                    CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 500),
                      fadeOutDuration: Duration(milliseconds: 500),
                      imageUrl: functions.getImage(getJsonField(
                        widget.data,
                        r'''$._embedded["wp:featuredmedia"][0].link''',
                      ).toString()),
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pop();
                            },
                            child: Container(
                              width: 75.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF27141),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(4.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: FaIcon(
                                FontAwesomeIcons.arrowLeft,
                                color: Colors.white,
                                size: 22.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: Stack(
                              children: [
                                if (functions.isFavorite(
                                        FFAppState().favorites.toList(),
                                        getJsonField(
                                          widget.data,
                                          r'''$.id''',
                                        ).toString()) ==
                                    true)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        FFAppState()
                                            .removeFromFavorites(getJsonField(
                                          widget.data,
                                          r'''$.id''',
                                        ).toString());
                                      });
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Receita removida dos favoritos.',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFFCF000F),
                                        ),
                                      );
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.solidHeart,
                                      color: Color(0xFFF27141),
                                      size: 22.0,
                                    ),
                                  ),
                                if (functions.isFavorite(
                                        FFAppState().favorites.toList(),
                                        getJsonField(
                                          widget.data,
                                          r'''$.id''',
                                        ).toString()) ==
                                    false)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().addToFavorites(
                                            functions.addFavorite(getJsonField(
                                          widget.data,
                                          r'''$.id''',
                                        ).toString()));
                                      });
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Receita adicionada aos favoritos.',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFF00A676),
                                        ),
                                      );
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.heart,
                                      color: Color(0xFFF27141),
                                      size: 22.0,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        functions.getCategory(
                            getJsonField(
                              widget.data,
                              r'''$.categories[0]''',
                            ).toString(),
                            FFAppState().nameCategories.toList(),
                            FFAppState().idCategories.toList()),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Color(0xFFF27141),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'Por: ${getJsonField(
                          widget.data,
                          r'''$._embedded.author[0].name''',
                        ).toString()}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Color(0xFFF27141),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                  child: Text(
                    functions.formatTitle(getJsonField(
                      widget.data,
                      r'''$.title.rendered''',
                    ).toString()),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Color(0xFF1E1E1E),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 30.0),
                  child: Text(
                    functions.getSuperArticleText(getJsonField(
                      widget.data,
                      r'''$.content.rendered''',
                    ).toString()),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Color(0xFF666666),
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                if (functions.containsDicaLeitor(getJsonField(
                      widget.data,
                      r'''$.content.rendered''',
                    ).toString()) ==
                    true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Text(
                      'Dica para o leitor',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: Color(0xFF1E1E1E),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                if (functions.containsDicaLeitor(getJsonField(
                      widget.data,
                      r'''$.content.rendered''',
                    ).toString()) ==
                    true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                    child: Text(
                      functions.getArticleDicaLeitor(getJsonField(
                        widget.data,
                        r'''$.content.rendered''',
                      ).toString()),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: Color(0xFF666666),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                if (functions.containsDicaLeitor(getJsonField(
                      widget.data,
                      r'''$.content.rendered''',
                    ).toString()) ==
                    true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Text(
                      'Links indicados',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: Color(0xFF1E1E1E),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                if (functions.containsDicaLeitor(getJsonField(
                      widget.data,
                      r'''$.content.rendered''',
                    ).toString()) ==
                    true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final lvLinksDicasLeitor =
                            FFAppState().linkUrlDicasLeitor.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: lvLinksDicasLeitor.length,
                          itemBuilder: (context, lvLinksDicasLeitorIndex) {
                            final lvLinksDicasLeitorItem =
                                lvLinksDicasLeitor[lvLinksDicasLeitorIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Atencão!'),
                                                content: Text(
                                                    'A página indicada será aberta no navegador do seu celular. Continuar?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('Cancelar'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('Sim'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    await launchURL(lvLinksDicasLeitorItem);
                                    return;
                                  } else {
                                    Navigator.pop(context);
                                    return;
                                  }
                                },
                                child: Text(
                                  FFAppState().linkTextDicasLeitor[
                                      lvLinksDicasLeitorIndex],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFFF27141),
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (functions.containsUtensilios(getJsonField(
                      widget.data,
                      r'''$.content.rendered''',
                    ).toString()) ==
                    true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Text(
                      'Utensílios que vão te auxíliar',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: Color(0xFF1E1E1E),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                if (functions.containsUtensilios(getJsonField(
                      widget.data,
                      r'''$.content.rendered''',
                    ).toString()) ==
                    true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final lvUtensilios =
                            FFAppState().utensiliosText.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: lvUtensilios.length,
                          itemBuilder: (context, lvUtensiliosIndex) {
                            final lvUtensiliosItem =
                                lvUtensilios[lvUtensiliosIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Atencão!'),
                                                content: Text(
                                                    'A página indicada será aberta no navegador do seu celular. Continuar?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('Cancelar'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('Sim'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    await launchURL(FFAppState()
                                        .utensiliosUrl[lvUtensiliosIndex]);
                                    return;
                                  } else {
                                    Navigator.pop(context);
                                    return;
                                  }
                                },
                                child: Text(
                                  lvUtensiliosItem,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFF27141),
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (functions.containsOutrasReceitas(getJsonField(
                      widget.data,
                      r'''$.content.rendered''',
                    ).toString()) ==
                    true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Text(
                      'Confira mais receitas',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: Color(0xFF1E1E1E),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                if (functions.containsOutrasReceitas(getJsonField(
                      widget.data,
                      r'''$.content.rendered''',
                    ).toString()) ==
                    true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final lvOutrasReceitas =
                            FFAppState().outrasReceitasText.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: lvOutrasReceitas.length,
                          itemBuilder: (context, lvOutrasReceitasIndex) {
                            final lvOutrasReceitasItem =
                                lvOutrasReceitas[lvOutrasReceitasIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Atencão!'),
                                                content: Text(
                                                    'A página indicada será aberta no navegador do seu celular. Continuar?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('Cancelar'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('Sim'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    await launchURL(
                                        FFAppState().outrasReceitasUrl[
                                            lvOutrasReceitasIndex]);
                                    return;
                                  } else {
                                    Navigator.pop(context);
                                    return;
                                  }
                                },
                                child: Text(
                                  lvOutrasReceitasItem,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFFF27141),
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Share.share(
                              getJsonField(
                                widget.data,
                                r'''$.link''',
                              ).toString(),
                              sharePositionOrigin:
                                  getWidgetBoundingBox(context),
                            );
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF00A859),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: FaIcon(
                                FontAwesomeIcons.whatsapp,
                                color: Colors.white,
                                size: 22.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Share.share(
                              getJsonField(
                                widget.data,
                                r'''$.link''',
                              ).toString(),
                              sharePositionOrigin:
                                  getWidgetBoundingBox(context),
                            );
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF295396),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: FaIcon(
                                FontAwesomeIcons.facebookF,
                                color: Colors.white,
                                size: 22.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Share.share(
                              getJsonField(
                                widget.data,
                                r'''$.link''',
                              ).toString(),
                              sharePositionOrigin:
                                  getWidgetBoundingBox(context),
                            );
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF50ABF1),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: FaIcon(
                                FontAwesomeIcons.twitter,
                                color: Colors.white,
                                size: 22.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Share.share(
                              getJsonField(
                                widget.data,
                                r'''$.link''',
                              ).toString(),
                              sharePositionOrigin:
                                  getWidgetBoundingBox(context),
                            );
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF039BE5),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: FaIcon(
                                FontAwesomeIcons.telegramPlane,
                                color: Colors.white,
                                size: 22.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            await Share.share(
                              getJsonField(
                                widget.data,
                                r'''$.link''',
                              ).toString(),
                              sharePositionOrigin:
                                  getWidgetBoundingBox(context),
                            );
                          },
                          text: 'Compartilhar',
                          icon: Icon(
                            Icons.share_sharp,
                            color: Colors.white,
                            size: 22.0,
                          ),
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFF27141),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Comentários',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF666666),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              getJsonField(
                                        widget.data,
                                        r'''$._embedded.replies[0]''',
                                      ) !=
                                      null
                                  ? functions.getNumberComments((getJsonField(
                                      widget.data,
                                      r'''$._embedded.replies[0]''',
                                      true,
                                    ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()!)
                                  : '0',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (getJsonField(
                      widget.data,
                      r'''$._embedded.replies[0]''',
                    ) !=
                    null)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Builder(
                      builder: (context) {
                        final replies = getJsonField(
                          widget.data,
                          r'''$._embedded.replies[0]''',
                        ).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: replies.length,
                          itemBuilder: (context, repliesIndex) {
                            final repliesItem = replies[repliesIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image.network(
                                        getJsonField(
                                          repliesItem,
                                          r'''$.author_avatar_urls.24''',
                                        ),
                                        width: 20.0,
                                        height: 20.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          getJsonField(
                                            repliesItem,
                                            r'''$.author_name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Colors.black,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      functions.formatText(
                                          getJsonField(
                                            repliesItem,
                                            r'''$.content.rendered''',
                                          ).toString(),
                                          0),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF666666),
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                  child: Text(
                    'Deixe um comentário',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Color(0xFF1E1E1E),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 100.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.nomeController,
                                    focusNode: _model.nomeFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Nome*',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF666666),
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText: 'John Doe',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF666666),
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFC6C6C6),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFC6C6C6),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFC6C6C6),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF666666),
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    validator: _model.nomeControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.emailController,
                                    focusNode: _model.emailFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Email*',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF666666),
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText: 'johndoe@gmail.com',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF666666),
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFC6C6C6),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFC6C6C6),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFC6C6C6),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF666666),
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: _model.emailControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: TextFormField(
                                controller: _model.comentarioController,
                                focusNode: _model.comentarioFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Comentário*',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF666666),
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText:
                                      'Essas informações me ajudaram muito!',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF666666),
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFC6C6C6),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFC6C6C6),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFC6C6C6),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF666666),
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                maxLines: null,
                                minLines: 5,
                                validator: _model.comentarioControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                _model.postCommentResult =
                                    await PostCommentCall.call();
                                _shouldSetState = true;
                                if ((_model.postCommentResult?.succeeded ??
                                    true)) {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Comentário enviado com sucesso.',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFF00A676),
                                    ),
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Erro ao enviar comentário.',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFFCF000F),
                                    ),
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              text: 'Publicar comentário',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFF27141),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
