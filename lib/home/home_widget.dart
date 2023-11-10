import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().searching = true;
        FFAppState().homeCategorie = '129,6,120,118,121';
        FFAppState().homeCategoriesExclude = '128';
      });
      _model.getSpecialArticlesResult = await GetArticlesCall.call(
        perPage: '5',
        categories: '128',
        categoriesExclude: '129,6,120,118,121',
        page: '1',
      );
      if ((_model.getSpecialArticlesResult?.succeeded ?? true)) {
        setState(() {
          FFAppState().specialArticles =
              (_model.getSpecialArticlesResult?.jsonBody ?? '');
        });
      }
      _model.getArticlesResult = await GetArticlesCall.call(
        perPage: '10',
        categoriesExclude: '128',
        categories: '129,6,120,118,121',
        page: '1',
      );
      if ((_model.getArticlesResult?.succeeded ?? true)) {
        setState(() {
          FFAppState().articles = (_model.getArticlesResult?.jsonBody ?? '');
          FFAppState().homeTotalPages =
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
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
                          context.pushNamed('exit');
                        },
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 170.0,
                          height: 25.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().favorites.length > 0) {
                              context.pushNamed('favorites');

                              return;
                            } else {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Você não tem nenhuma receita adicionada nos favoritos.',
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
                              return;
                            }
                          },
                          child: Image.asset(
                            'assets/images/like.png',
                            width: 22.0,
                            height: 22.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('search');
                        },
                        child: Image.asset(
                          'assets/images/search.png',
                          width: 22.0,
                          height: 22.0,
                          fit: BoxFit.contain,
                        ),
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
                              FFAppState().homeCategorie = '129,6,120,118,121';
                              FFAppState().homeCategoriesExclude = '128';
                            });
                            _model.getArticlesTodosResult =
                                await GetArticlesCall.call(
                              perPage: '10',
                              categories: '129,6,120,118,121',
                              categoriesExclude: '128',
                              page: '1',
                            );
                            if ((_model.getArticlesTodosResult?.succeeded ??
                                true)) {
                              setState(() {
                                FFAppState().articles =
                                    (_model.getArticlesTodosResult?.jsonBody ??
                                        '');
                                FFAppState().homeTotalPages = (_model
                                        .getArticlesTodosResult
                                        ?.getHeader('x-wp-totalpages') ??
                                    '');
                                FFAppState().homeCurrentPage = 1;
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
                              color: Color(0xFFFF0000),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/geral.png',
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 1.00),
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
                                if (FFAppState().homeCategorie !=
                                    '129,6,120,118,121')
                                  Container(
                                    width: 115.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x7BFFFFFF),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                              ],
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
                                FFAppState().homeCategorie = '118';
                                FFAppState().homeCategoriesExclude =
                                    '129,6,120,121,128';
                              });
                              _model.getArticlesSalgadosResult =
                                  await GetArticlesCall.call(
                                perPage: '10',
                                categories: '118',
                                page: '1',
                                categoriesExclude: '129,6,120,121,128',
                              );
                              if ((_model
                                      .getArticlesSalgadosResult?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().articles = (_model
                                          .getArticlesSalgadosResult
                                          ?.jsonBody ??
                                      '');
                                  FFAppState().homeTotalPages = (_model
                                          .getArticlesSalgadosResult
                                          ?.getHeader('x-wp-totalpages') ??
                                      '');
                                  FFAppState().homeCurrentPage = 1;
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
                                  if (FFAppState().homeCategorie != '118')
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
                                FFAppState().homeCategorie = '120';
                                FFAppState().homeCategoriesExclude =
                                    '129,6,118,121,128';
                              });
                              _model.getArticlesLanchesResult =
                                  await GetArticlesCall.call(
                                perPage: '10',
                                categories: '120',
                                page: '1',
                                categoriesExclude: '129,6,118,121,128',
                              );
                              if ((_model.getArticlesLanchesResult?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().articles = (_model
                                          .getArticlesLanchesResult?.jsonBody ??
                                      '');
                                  FFAppState().homeTotalPages = (_model
                                          .getArticlesLanchesResult
                                          ?.getHeader('x-wp-totalpages') ??
                                      '');
                                  FFAppState().homeCurrentPage = 1;
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
                                  if (FFAppState().homeCategorie != '120')
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
                                FFAppState().homeCategorie = '121';
                                FFAppState().homeCategoriesExclude =
                                    '129,6,120,118,128';
                              });
                              _model.getArticlesSaudaveisResult =
                                  await GetArticlesCall.call(
                                perPage: '10',
                                categories: '121',
                                page: '1',
                                categoriesExclude: '129,6,120,118,128',
                              );
                              if ((_model
                                      .getArticlesSaudaveisResult?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().articles = (_model
                                          .getArticlesSaudaveisResult
                                          ?.jsonBody ??
                                      '');
                                  FFAppState().homeTotalPages = (_model
                                          .getArticlesSaudaveisResult
                                          ?.getHeader('x-wp-totalpages') ??
                                      '');
                                  FFAppState().homeCurrentPage = 1;
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
                                  if (FFAppState().homeCategorie != '121')
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
                                FFAppState().homeCategorie = '6';
                                FFAppState().homeCategoriesExclude =
                                    '129,120,118,121,128';
                              });
                              _model.getArticlesDocesResult =
                                  await GetArticlesCall.call(
                                perPage: '10',
                                categories: '6',
                                page: '1',
                                categoriesExclude: '129,120,118,121,128',
                              );
                              if ((_model.getArticlesDocesResult?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().articles = (_model
                                          .getArticlesDocesResult?.jsonBody ??
                                      '');
                                  FFAppState().homeTotalPages = (_model
                                          .getArticlesDocesResult
                                          ?.getHeader('x-wp-totalpages') ??
                                      '');
                                  FFAppState().homeCurrentPage = 1;
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
                                  if (FFAppState().homeCategorie != '6')
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
                                FFAppState().homeCategorie = '129';
                                FFAppState().homeCategoriesExclude =
                                    '6,120,118,121,128';
                              });
                              _model.getArticlesBebidasResult =
                                  await GetArticlesCall.call(
                                perPage: '10',
                                categories: '129',
                                page: '1',
                                categoriesExclude: '6,120,118,121,128',
                              );
                              if ((_model.getArticlesBebidasResult?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().articles = (_model
                                          .getArticlesBebidasResult?.jsonBody ??
                                      '');
                                  FFAppState().homeTotalPages = (_model
                                          .getArticlesBebidasResult
                                          ?.getHeader('x-wp-totalpages') ??
                                      '');
                                  FFAppState().homeCurrentPage = 1;
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
                                  if (FFAppState().homeCategorie != '129')
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 100.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 0.0, 0.0),
                              child: Text(
                                'Destaques',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final lvSpecialArticles = getJsonField(
                                      FFAppState().specialArticles,
                                      r'''$''',
                                    ).toList();
                                    if (lvSpecialArticles.isEmpty) {
                                      return Image.asset(
                                        'assets/images/not-found.png',
                                        width: 200.0,
                                        height: 200.0,
                                      );
                                    }
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(
                                            lvSpecialArticles.length,
                                            (lvSpecialArticlesIndex) {
                                          final lvSpecialArticlesItem =
                                              lvSpecialArticles[
                                                  lvSpecialArticlesIndex];
                                          return Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Atenção'),
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
                                                    await launchURL(
                                                        getJsonField(
                                                      lvSpecialArticlesItem,
                                                      r'''$.link''',
                                                    ).toString());
                                                    return;
                                                  } else {
                                                    return;
                                                  }
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  height: 230.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:
                                                          CachedNetworkImageProvider(
                                                        functions.getImage(
                                                            getJsonField(
                                                          lvSpecialArticlesItem,
                                                          r'''$._embedded["wp:featuredmedia"][0].link''',
                                                        ).toString()),
                                                      ),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 1.00),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        50.0,
                                                                        0.0),
                                                            child: Container(
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Text(
                                                                    functions
                                                                        .formatTitle(
                                                                            getJsonField(
                                                                      lvSpecialArticlesItem,
                                                                      r'''$.title.rendered''',
                                                                    ).toString()),
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.00, 1.00),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        0.0,
                                                                        50.0),
                                                            child: Container(
                                                              height: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF27141),
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
                                                                  functions.getCategory(
                                                                      getJsonField(
                                                                        lvSpecialArticlesItem,
                                                                        r'''$.categories[0]''',
                                                                      ).toString(),
                                                                      FFAppState().nameCategories.toList(),
                                                                      FFAppState().idCategories.toList()),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            10.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 0.0, 0.0),
                              child: Text(
                                'Mais recentes',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
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
                                            context.pushNamed(
                                              'article',
                                              queryParameters: {
                                                'data': serializeParam(
                                                  lvArticlesItem,
                                                  ParamType.JSON,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .leftToRight,
                                                ),
                                              },
                                            );
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
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl: functions
                                                              .getImage(
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
                                                            color: Color(
                                                                0xFFF27141),
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
                                                    functions.formatTitle(
                                                        getJsonField(
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
                                  20.0, 20.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FFButtonWidget(
                                    onPressed: FFAppState().homeCurrentPage == 1
                                        ? null
                                        : () async {
                                            var _shouldSetState = false;
                                            setState(() {
                                              FFAppState().homeCurrentPage =
                                                  FFAppState().homeCurrentPage +
                                                      -1;
                                            });
                                            if (FFAppState().homeCurrentPage >=
                                                1) {
                                              setState(() {
                                                FFAppState().searching = true;
                                              });
                                              _model.getArticlesPreviousPage =
                                                  await GetArticlesCall.call(
                                                perPage: '10',
                                                categories:
                                                    FFAppState().homeCategorie,
                                                page: FFAppState()
                                                    .homeCurrentPage
                                                    .toString(),
                                                categoriesExclude: FFAppState()
                                                    .homeCategoriesExclude,
                                              );
                                              _shouldSetState = true;
                                              if ((_model
                                                      .getArticlesPreviousPage
                                                      ?.succeeded ??
                                                  true)) {
                                                setState(() {
                                                  FFAppState()
                                                      .articles = (_model
                                                          .getArticlesPreviousPage
                                                          ?.jsonBody ??
                                                      '');
                                                  FFAppState()
                                                      .homeTotalPages = (_model
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
                                                      style:
                                                          GoogleFonts.getFont(
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
                                                  FFAppState().homeCurrentPage =
                                                      FFAppState()
                                                              .homeCurrentPage +
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

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                    text: 'Página anterior',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
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
                                    'Página ${FFAppState().homeCurrentPage.toString()} / ${FFAppState().homeTotalPages}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: FFAppState().homeCurrentPage ==
                                            functions.convertStrToInt(
                                                FFAppState().homeTotalPages)
                                        ? null
                                        : () async {
                                            var _shouldSetState = false;
                                            setState(() {
                                              FFAppState().homeCurrentPage =
                                                  FFAppState().homeCurrentPage +
                                                      1;
                                            });
                                            if (FFAppState().homeCurrentPage <=
                                                functions.convertStrToInt(
                                                    FFAppState()
                                                        .homeTotalPages)) {
                                              setState(() {
                                                FFAppState().searching = true;
                                              });
                                              _model.getArticlesNextPage =
                                                  await GetArticlesCall.call(
                                                perPage: '10',
                                                categories:
                                                    FFAppState().homeCategorie,
                                                page: FFAppState()
                                                    .homeCurrentPage
                                                    .toString(),
                                                categoriesExclude: FFAppState()
                                                    .homeCategoriesExclude,
                                              );
                                              _shouldSetState = true;
                                              if ((_model.getArticlesNextPage
                                                      ?.succeeded ??
                                                  true)) {
                                                setState(() {
                                                  FFAppState()
                                                      .articles = (_model
                                                          .getArticlesNextPage
                                                          ?.jsonBody ??
                                                      '');
                                                  FFAppState()
                                                      .homeTotalPages = (_model
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
                                                      style:
                                                          GoogleFonts.getFont(
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
                                                  FFAppState().homeCurrentPage =
                                                      FFAppState()
                                                              .homeCurrentPage +
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

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                    text: 'Próxima página',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
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
