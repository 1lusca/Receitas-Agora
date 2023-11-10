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
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().searching = true;
        FFAppState().searchCategories = '129,6,120,118,121,128';
        FFAppState().searchCategoriesExclude = '999';
      });
      _model.getArticlesResult = await GetArticlesCall.call(
        perPage: '10',
        categories: '129,6,120,118,121,128',
        categoriesExclude: '999',
        page: '1',
      );
      if ((_model.getArticlesResult?.succeeded ?? true)) {
        setState(() {
          FFAppState().articles = (_model.getArticlesResult?.jsonBody ?? '');
          FFAppState().searchTotalPages =
              (_model.getArticlesResult?.getHeader('x-wp-totalpages') ?? '');
        });
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Houve um erro ao buscar as receitas, por favor, tente novamente.',
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
      }

      setState(() {
        FFAppState().searching = false;
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 0.0),
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
                          setState(() {
                            FFAppState().searching = false;
                          });
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onFieldSubmitted: (_) async {
                              setState(() {
                                FFAppState().searching = true;
                                FFAppState().searchText =
                                    _model.textController.text;
                                FFAppState().searchCategories =
                                    '129,6,120,118,121,128';
                                FFAppState().searchCategoriesExclude = '999';
                              });
                              _model.getArticlesSearchResult =
                                  await GetArticlesCall.call(
                                perPage: '10',
                                categories: '129,6,120,118,121,128',
                                search: _model.textController.text,
                                categoriesExclude: '999',
                                page: '1',
                              );
                              if ((_model.getArticlesSearchResult?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().articles = (_model
                                          .getArticlesSearchResult?.jsonBody ??
                                      '');
                                  FFAppState().searchCurrentPages = 1;
                                  FFAppState().searchTotalPages = (_model
                                          .getArticlesSearchResult
                                          ?.getHeader('x-wp-totalpages') ??
                                      '');
                                });
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Houve um erro ao buscar as receitas, por favor, tente novamente.',
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
                              }

                              setState(() {
                                FFAppState().searching = false;
                              });

                              setState(() {});
                            },
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Riss',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF666666),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF666666),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF666666),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/search.png',
                        width: 22.0,
                        height: 22.0,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              FFAppState().searching = true;
                              FFAppState().searchCategories =
                                  '129,6,120,118,121,128';
                              FFAppState().searchCategoriesExclude = '999';
                              FFAppState().searchText =
                                  _model.textController.text;
                            });
                            _model.getArticlesTodosResult =
                                await GetArticlesCall.call(
                              perPage: '10',
                              categories: '129,6,120,118,121,128',
                              search: _model.textController.text,
                              categoriesExclude: '999',
                              page: '1',
                            );
                            if ((_model.getArticlesTodosResult?.succeeded ??
                                true)) {
                              setState(() {
                                FFAppState().articles =
                                    (_model.getArticlesTodosResult?.jsonBody ??
                                        '');
                                FFAppState().searchCurrentPages = 1;
                                FFAppState().searchTotalPages = (_model
                                        .getArticlesTodosResult
                                        ?.getHeader('x-wp-totalpages') ??
                                    '');
                              });
                            } else {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Houve um erro ao buscar as receitas, por favor, tente novamente.',
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
                            }

                            setState(() {
                              FFAppState().searching = false;
                            });

                            setState(() {});
                          },
                          child: Container(
                            width: 115.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/geral.png',
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0x0000000E),
                              ),
                            ),
                            child: Container(
                              width: 115.0,
                              height: 70.0,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Text(
                                        'Geral',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().searchCategories !=
                                      '129,6,120,118,121,128')
                                    Container(
                                      width: 115.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x7BFFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().searching = true;
                                FFAppState().searchText =
                                    _model.textController.text;
                                FFAppState().searchCategories = '118';
                                FFAppState().searchCategoriesExclude = '999';
                              });
                              _model.getArticlesSalgadosResult =
                                  await GetArticlesCall.call(
                                perPage: '10',
                                categories: '118',
                                search: _model.textController.text,
                                categoriesExclude: '999',
                                page: '1',
                              );
                              if ((_model
                                      .getArticlesSalgadosResult?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().articles = (_model
                                          .getArticlesSalgadosResult
                                          ?.jsonBody ??
                                      '');
                                  FFAppState().searchCurrentPages = 1;
                                  FFAppState().searchTotalPages = (_model
                                          .getArticlesSalgadosResult
                                          ?.getHeader('x-wp-totalpages') ??
                                      '');
                                });
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Houve um erro ao buscar as receitas, por favor, tente novamente.',
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
                              }

                              setState(() {
                                FFAppState().searching = false;
                              });

                              setState(() {});
                            },
                            child: Container(
                              width: 115.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/pratos-salgados.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Text(
                                        'Pratos\nSalgados',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().searchCategories != '118')
                                    Container(
                                      width: 115.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x7BFFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().searching = true;
                                FFAppState().searchText =
                                    _model.textController.text;
                                FFAppState().searchCategories = '120';
                                FFAppState().searchCategoriesExclude = '999';
                              });
                              _model.getArticlesLanchesResult =
                                  await GetArticlesCall.call(
                                perPage: '10',
                                categories: '120',
                                search: _model.textController.text,
                                categoriesExclude: '999',
                                page: '1',
                              );
                              if ((_model.getArticlesLanchesResult?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().articles = (_model
                                          .getArticlesLanchesResult?.jsonBody ??
                                      '');
                                  FFAppState().searchTotalPages = (_model
                                          .getArticlesLanchesResult
                                          ?.getHeader('x-wp-totalpages') ??
                                      '');
                                  FFAppState().searchCurrentPages = 1;
                                });
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Houve um erro ao buscar as receitas, por favor, tente novamente.',
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
                              }

                              setState(() {
                                FFAppState().searching = false;
                              });

                              setState(() {});
                            },
                            child: Container(
                              width: 115.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/lanches.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Text(
                                        'Lanches',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().searchCategories != '120')
                                    Container(
                                      width: 115.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x7BFFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().searching = true;
                                FFAppState().searchText =
                                    _model.textController.text;
                                FFAppState().searchCategories = '121';
                                FFAppState().searchCategoriesExclude = '999';
                              });
                              _model.getArticlesSaudaveisResult =
                                  await GetArticlesCall.call(
                                perPage: '10',
                                categories: '121',
                                search: _model.textController.text,
                                categoriesExclude: '999',
                                page: '1',
                              );
                              if ((_model
                                      .getArticlesSaudaveisResult?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().articles = (_model
                                          .getArticlesSaudaveisResult
                                          ?.jsonBody ??
                                      '');
                                  FFAppState().searchCurrentPages = 1;
                                  FFAppState().searchTotalPages = (_model
                                          .getArticlesSaudaveisResult
                                          ?.getHeader('X-WP-TotalPages') ??
                                      '');
                                });
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Houve um erro ao buscar as receitas, por favor, tente novamente.',
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
                              }

                              setState(() {
                                FFAppState().searching = false;
                              });

                              setState(() {});
                            },
                            child: Container(
                              width: 115.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/saudaveis.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Text(
                                        'Saudáveis',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().searchCategories != '121')
                                    Container(
                                      width: 115.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x7BFFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().searching = true;
                                FFAppState().searchText =
                                    _model.textController.text;
                                FFAppState().searchCategories = '6';
                                FFAppState().searchCategoriesExclude = '999';
                              });
                              _model.getArticlesDocesResult =
                                  await GetArticlesCall.call(
                                perPage: '10',
                                categories: '6',
                                search: _model.textController.text,
                                categoriesExclude: '999',
                                page: '1',
                              );
                              if ((_model.getArticlesDocesResult?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().articles = (_model
                                          .getArticlesDocesResult?.jsonBody ??
                                      '');
                                  FFAppState().searchCurrentPages = 1;
                                  FFAppState().searchTotalPages = (_model
                                          .getArticlesDocesResult
                                          ?.getHeader('X-WP-TotalPages') ??
                                      '');
                                });
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Houve um erro ao buscar as receitas, por favor, tente novamente.',
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
                              }

                              setState(() {
                                FFAppState().searching = false;
                              });

                              setState(() {});
                            },
                            child: Container(
                              width: 115.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/doces-sobremesas.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Text(
                                        'Doces &\nSobremesas',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().searchCategories != '6')
                                    Container(
                                      width: 115.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x7BFFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().searching = true;
                                FFAppState().searchCategories = '129';
                                FFAppState().searchCategoriesExclude = '999';
                                FFAppState().searchText =
                                    _model.textController.text;
                              });
                              _model.getArticlesBebidasResult =
                                  await GetArticlesCall.call(
                                perPage: '10',
                                categories: '129',
                                search: _model.textController.text,
                                categoriesExclude: '999',
                                page: '1',
                              );
                              if ((_model.getArticlesBebidasResult?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().articles = (_model
                                          .getArticlesBebidasResult?.jsonBody ??
                                      '');
                                  FFAppState().searchCurrentPages = 1;
                                  FFAppState().searchTotalPages = (_model
                                          .getArticlesBebidasResult
                                          ?.getHeader('X-WP-TotalPages') ??
                                      '');
                                });
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Houve um erro ao buscar as receitas, por favor, tente novamente.',
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
                              }

                              setState(() {
                                FFAppState().searching = false;
                              });

                              setState(() {});
                            },
                            child: Container(
                              width: 115.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/bebidas.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Text(
                                        'Bebidas',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().searchCategories != '129')
                                    Container(
                                      width: 115.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x7BFFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().searching = true;
                                FFAppState().searchText =
                                    _model.textController.text;
                                FFAppState().searchCategoriesExclude = '999';
                                FFAppState().searchCategories = '128';
                              });
                              _model.getArticlesEspeciaisResult =
                                  await GetArticlesCall.call(
                                perPage: '10',
                                categories: '128',
                                search: _model.textController.text,
                                categoriesExclude: '999',
                                page: '1',
                              );
                              if ((_model
                                      .getArticlesEspeciaisResult?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().articles = (_model
                                          .getArticlesEspeciaisResult
                                          ?.jsonBody ??
                                      '');
                                  FFAppState().searchCurrentPages = 1;
                                  FFAppState().searchTotalPages = (_model
                                          .getArticlesEspeciaisResult
                                          ?.getHeader('X-WP-TotalPages') ??
                                      '');
                                });
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Houve um erro ao buscar as receitas, por favor, tente novamente.',
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
                              }

                              setState(() {
                                FFAppState().searching = false;
                              });

                              setState(() {});
                            },
                            child: Container(
                              width: 115.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/especiais.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Text(
                                        'Especiais',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().searchCategories != '128')
                                    Container(
                                      width: 115.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x7BFFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                Stack(
                  children: [
                    if (FFAppState().searching == true)
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 100.0, 20.0, 0.0),
                          child: Lottie.asset(
                            'assets/lottie_animations/loading.json',
                            width: 150.0,
                            height: 130.0,
                            fit: BoxFit.cover,
                            animate: true,
                          ),
                        ),
                      ),
                    if (FFAppState().searching == false)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final lvArticles = getJsonField(
                                  FFAppState().articles,
                                  r'''$''',
                                ).toList();
                                if (lvArticles.isEmpty) {
                                  return Center(
                                    child: Image.asset(
                                      'assets/images/not-found.png',
                                      width: 200.0,
                                      height: 200.0,
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: lvArticles.length,
                                  itemBuilder: (context, lvArticlesIndex) {
                                    final lvArticlesItem =
                                        lvArticles[lvArticlesIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (functions.getCategory(
                                                  getJsonField(
                                                    lvArticlesItem,
                                                    r'''$.categories[0]''',
                                                  ).toString(),
                                                  FFAppState()
                                                      .nameCategories
                                                      .toList(),
                                                  FFAppState()
                                                      .idCategories
                                                      .toList()) ==
                                              'Especiais') {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title:
                                                              Text('Atenção'),
                                                          content: Text(
                                                              'Esta é uma Super Receita! A visualização de receitas especiais precisa ser feita no nosso blog. Vamos te redirecionar para ele, deseja continuar?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Não, ficar no app'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Sim, ler a Super Receita'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              await launchURL(getJsonField(
                                                lvArticlesItem,
                                                r'''$.link''',
                                              ).toString());
                                              return;
                                            } else {
                                              return;
                                            }
                                          } else {
                                            context.pushNamed(
                                              'article',
                                              queryParameters: {
                                                'data': serializeParam(
                                                  lvArticlesItem,
                                                  ParamType.JSON,
                                                ),
                                              }.withoutNulls,
                                            );

                                            return;
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 1.0),
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl:
                                                            functions.getImage(
                                                                getJsonField(
                                                          lvArticlesItem,
                                                          r'''$._embedded["wp:featuredmedia"][0].link''',
                                                        ).toString()),
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 230.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  14.0,
                                                                  14.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF27141),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Text(
                                                            functions
                                                                .getCategory(
                                                                    getJsonField(
                                                                      lvArticlesItem,
                                                                      r'''$.categories[0]''',
                                                                    )
                                                                        .toString(),
                                                                    FFAppState()
                                                                        .nameCategories
                                                                        .toList(),
                                                                    FFAppState()
                                                                        .idCategories
                                                                        .toList()),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  functions
                                                      .formatTitle(getJsonField(
                                                    lvArticlesItem,
                                                    r'''$.title.rendered''',
                                                  ).toString()),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  functions.formatResume(
                                                      getJsonField(
                                                    lvArticlesItem,
                                                    r'''$.excerpt.rendered''',
                                                  ).toString()),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xFF666666),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ],
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 100.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FFButtonWidget(
                                  onPressed: FFAppState().searchCurrentPages ==
                                          1
                                      ? null
                                      : () async {
                                          var _shouldSetState = false;
                                          setState(() {
                                            FFAppState().searchCurrentPages =
                                                FFAppState()
                                                        .searchCurrentPages +
                                                    -1;
                                          });
                                          if (FFAppState().searchCurrentPages >=
                                              1) {
                                            setState(() {
                                              FFAppState().searching = true;
                                            });
                                            _model.getArticlesPreviousPage =
                                                await GetArticlesCall.call(
                                              perPage: '10',
                                              categories:
                                                  FFAppState().searchCategories,
                                              page: FFAppState()
                                                  .searchCurrentPages
                                                  .toString(),
                                              categoriesExclude: FFAppState()
                                                  .searchCategoriesExclude,
                                              search: FFAppState().searchText,
                                            );
                                            _shouldSetState = true;
                                            if ((_model.getArticlesPreviousPage
                                                    ?.succeeded ??
                                                true)) {
                                              setState(() {
                                                FFAppState().articles = (_model
                                                        .getArticlesPreviousPage
                                                        ?.jsonBody ??
                                                    '');
                                                FFAppState()
                                                    .searchTotalPages = (_model
                                                        .getArticlesPreviousPage
                                                        ?.getHeader(
                                                            'x-wp-totalpages') ??
                                                    '');
                                              });
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Houve um erro ao buscar as receitas, por favor, tente novamente.',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xFFCF000F),
                                                ),
                                              );
                                              setState(() {
                                                FFAppState()
                                                        .searchCurrentPages =
                                                    FFAppState()
                                                            .searchCurrentPages +
                                                        1;
                                              });
                                            }

                                            setState(() {
                                              FFAppState().searching = false;
                                            });
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          if (_shouldSetState) setState(() {});
                                        },
                                  text: 'Página anterior',
                                  options: FFButtonOptions(
                                    height: 40.0,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                    disabledColor: Color(0xFF848484),
                                    disabledTextColor: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Página ${FFAppState().searchCurrentPages.toString()} / ${FFAppState().searchTotalPages}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                FFButtonWidget(
                                  onPressed: FFAppState().searchCurrentPages ==
                                          functions.convertStrToInt(
                                              FFAppState().searchTotalPages)
                                      ? null
                                      : () async {
                                          var _shouldSetState = false;
                                          setState(() {
                                            FFAppState().searchCurrentPages =
                                                FFAppState()
                                                        .searchCurrentPages +
                                                    1;
                                          });
                                          if (FFAppState().searchCurrentPages <=
                                              functions.convertStrToInt(
                                                  FFAppState()
                                                      .searchTotalPages)) {
                                            setState(() {
                                              FFAppState().searching = true;
                                            });
                                            _model.getArticlesNextPage =
                                                await GetArticlesCall.call(
                                              perPage: '10',
                                              categories:
                                                  FFAppState().searchCategories,
                                              page: FFAppState()
                                                  .searchCurrentPages
                                                  .toString(),
                                              categoriesExclude: FFAppState()
                                                  .searchCategoriesExclude,
                                              search: FFAppState().searchText,
                                            );
                                            _shouldSetState = true;
                                            if ((_model.getArticlesNextPage
                                                    ?.succeeded ??
                                                true)) {
                                              setState(() {
                                                FFAppState().articles = (_model
                                                        .getArticlesNextPage
                                                        ?.jsonBody ??
                                                    '');
                                                FFAppState()
                                                    .searchTotalPages = (_model
                                                        .getArticlesNextPage
                                                        ?.getHeader(
                                                            'x-wp-totalpages') ??
                                                    '');
                                              });
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Houve um erro ao buscar as receitas, por favor, tente novamente.',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xFFCF000F),
                                                ),
                                              );
                                              setState(() {
                                                FFAppState()
                                                        .searchCurrentPages =
                                                    FFAppState()
                                                            .searchCurrentPages +
                                                        -1;
                                              });
                                            }

                                            setState(() {
                                              FFAppState().searching = false;
                                            });
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          if (_shouldSetState) setState(() {});
                                        },
                                  text: 'Próxima página',
                                  options: FFButtonOptions(
                                    height: 40.0,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                    disabledColor: Color(0xFF848484),
                                    disabledTextColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
