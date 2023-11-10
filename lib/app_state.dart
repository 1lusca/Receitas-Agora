import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _idCategories = prefs.getStringList('ff_idCategories') ?? _idCategories;
    });
    _safeInit(() {
      _nameCategories =
          prefs.getStringList('ff_nameCategories') ?? _nameCategories;
    });
    _safeInit(() {
      _favorites = prefs.getStringList('ff_favorites') ?? _favorites;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _idCategories = ['6', '120', '118', '121', '129', '128'];
  List<String> get idCategories => _idCategories;
  set idCategories(List<String> _value) {
    _idCategories = _value;
    prefs.setStringList('ff_idCategories', _value);
  }

  void addToIdCategories(String _value) {
    _idCategories.add(_value);
    prefs.setStringList('ff_idCategories', _idCategories);
  }

  void removeFromIdCategories(String _value) {
    _idCategories.remove(_value);
    prefs.setStringList('ff_idCategories', _idCategories);
  }

  void removeAtIndexFromIdCategories(int _index) {
    _idCategories.removeAt(_index);
    prefs.setStringList('ff_idCategories', _idCategories);
  }

  void updateIdCategoriesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _idCategories[_index] = updateFn(_idCategories[_index]);
    prefs.setStringList('ff_idCategories', _idCategories);
  }

  void insertAtIndexInIdCategories(int _index, String _value) {
    _idCategories.insert(_index, _value);
    prefs.setStringList('ff_idCategories', _idCategories);
  }

  List<String> _nameCategories = [
    'Doces e sobremesas',
    'Lanches',
    'Pratos Salgados',
    'Saudáveis',
    'Bebidas',
    'Especiais'
  ];
  List<String> get nameCategories => _nameCategories;
  set nameCategories(List<String> _value) {
    _nameCategories = _value;
    prefs.setStringList('ff_nameCategories', _value);
  }

  void addToNameCategories(String _value) {
    _nameCategories.add(_value);
    prefs.setStringList('ff_nameCategories', _nameCategories);
  }

  void removeFromNameCategories(String _value) {
    _nameCategories.remove(_value);
    prefs.setStringList('ff_nameCategories', _nameCategories);
  }

  void removeAtIndexFromNameCategories(int _index) {
    _nameCategories.removeAt(_index);
    prefs.setStringList('ff_nameCategories', _nameCategories);
  }

  void updateNameCategoriesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nameCategories[_index] = updateFn(_nameCategories[_index]);
    prefs.setStringList('ff_nameCategories', _nameCategories);
  }

  void insertAtIndexInNameCategories(int _index, String _value) {
    _nameCategories.insert(_index, _value);
    prefs.setStringList('ff_nameCategories', _nameCategories);
  }

  bool _searching = true;
  bool get searching => _searching;
  set searching(bool _value) {
    _searching = _value;
  }

  dynamic _articles;
  dynamic get articles => _articles;
  set articles(dynamic _value) {
    _articles = _value;
  }

  dynamic _specialArticles;
  dynamic get specialArticles => _specialArticles;
  set specialArticles(dynamic _value) {
    _specialArticles = _value;
  }

  List<String> _favorites = [];
  List<String> get favorites => _favorites;
  set favorites(List<String> _value) {
    _favorites = _value;
    prefs.setStringList('ff_favorites', _value);
  }

  void addToFavorites(String _value) {
    _favorites.add(_value);
    prefs.setStringList('ff_favorites', _favorites);
  }

  void removeFromFavorites(String _value) {
    _favorites.remove(_value);
    prefs.setStringList('ff_favorites', _favorites);
  }

  void removeAtIndexFromFavorites(int _index) {
    _favorites.removeAt(_index);
    prefs.setStringList('ff_favorites', _favorites);
  }

  void updateFavoritesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _favorites[_index] = updateFn(_favorites[_index]);
    prefs.setStringList('ff_favorites', _favorites);
  }

  void insertAtIndexInFavorites(int _index, String _value) {
    _favorites.insert(_index, _value);
    prefs.setStringList('ff_favorites', _favorites);
  }

  List<String> _linksUrl = [];
  List<String> get linksUrl => _linksUrl;
  set linksUrl(List<String> _value) {
    _linksUrl = _value;
  }

  void addToLinksUrl(String _value) {
    _linksUrl.add(_value);
  }

  void removeFromLinksUrl(String _value) {
    _linksUrl.remove(_value);
  }

  void removeAtIndexFromLinksUrl(int _index) {
    _linksUrl.removeAt(_index);
  }

  void updateLinksUrlAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _linksUrl[_index] = updateFn(_linksUrl[_index]);
  }

  void insertAtIndexInLinksUrl(int _index, String _value) {
    _linksUrl.insert(_index, _value);
  }

  List<String> _linksText = [];
  List<String> get linksText => _linksText;
  set linksText(List<String> _value) {
    _linksText = _value;
  }

  void addToLinksText(String _value) {
    _linksText.add(_value);
  }

  void removeFromLinksText(String _value) {
    _linksText.remove(_value);
  }

  void removeAtIndexFromLinksText(int _index) {
    _linksText.removeAt(_index);
  }

  void updateLinksTextAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _linksText[_index] = updateFn(_linksText[_index]);
  }

  void insertAtIndexInLinksText(int _index, String _value) {
    _linksText.insert(_index, _value);
  }

  dynamic _favoriteArticles;
  dynamic get favoriteArticles => _favoriteArticles;
  set favoriteArticles(dynamic _value) {
    _favoriteArticles = _value;
  }

  List<String> _linkUrlDicasLeitor = [];
  List<String> get linkUrlDicasLeitor => _linkUrlDicasLeitor;
  set linkUrlDicasLeitor(List<String> _value) {
    _linkUrlDicasLeitor = _value;
  }

  void addToLinkUrlDicasLeitor(String _value) {
    _linkUrlDicasLeitor.add(_value);
  }

  void removeFromLinkUrlDicasLeitor(String _value) {
    _linkUrlDicasLeitor.remove(_value);
  }

  void removeAtIndexFromLinkUrlDicasLeitor(int _index) {
    _linkUrlDicasLeitor.removeAt(_index);
  }

  void updateLinkUrlDicasLeitorAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _linkUrlDicasLeitor[_index] = updateFn(_linkUrlDicasLeitor[_index]);
  }

  void insertAtIndexInLinkUrlDicasLeitor(int _index, String _value) {
    _linkUrlDicasLeitor.insert(_index, _value);
  }

  List<String> _linkTextDicasLeitor = [];
  List<String> get linkTextDicasLeitor => _linkTextDicasLeitor;
  set linkTextDicasLeitor(List<String> _value) {
    _linkTextDicasLeitor = _value;
  }

  void addToLinkTextDicasLeitor(String _value) {
    _linkTextDicasLeitor.add(_value);
  }

  void removeFromLinkTextDicasLeitor(String _value) {
    _linkTextDicasLeitor.remove(_value);
  }

  void removeAtIndexFromLinkTextDicasLeitor(int _index) {
    _linkTextDicasLeitor.removeAt(_index);
  }

  void updateLinkTextDicasLeitorAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _linkTextDicasLeitor[_index] = updateFn(_linkTextDicasLeitor[_index]);
  }

  void insertAtIndexInLinkTextDicasLeitor(int _index, String _value) {
    _linkTextDicasLeitor.insert(_index, _value);
  }

  List<String> _utensiliosText = [];
  List<String> get utensiliosText => _utensiliosText;
  set utensiliosText(List<String> _value) {
    _utensiliosText = _value;
  }

  void addToUtensiliosText(String _value) {
    _utensiliosText.add(_value);
  }

  void removeFromUtensiliosText(String _value) {
    _utensiliosText.remove(_value);
  }

  void removeAtIndexFromUtensiliosText(int _index) {
    _utensiliosText.removeAt(_index);
  }

  void updateUtensiliosTextAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _utensiliosText[_index] = updateFn(_utensiliosText[_index]);
  }

  void insertAtIndexInUtensiliosText(int _index, String _value) {
    _utensiliosText.insert(_index, _value);
  }

  List<String> _utensiliosUrl = [];
  List<String> get utensiliosUrl => _utensiliosUrl;
  set utensiliosUrl(List<String> _value) {
    _utensiliosUrl = _value;
  }

  void addToUtensiliosUrl(String _value) {
    _utensiliosUrl.add(_value);
  }

  void removeFromUtensiliosUrl(String _value) {
    _utensiliosUrl.remove(_value);
  }

  void removeAtIndexFromUtensiliosUrl(int _index) {
    _utensiliosUrl.removeAt(_index);
  }

  void updateUtensiliosUrlAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _utensiliosUrl[_index] = updateFn(_utensiliosUrl[_index]);
  }

  void insertAtIndexInUtensiliosUrl(int _index, String _value) {
    _utensiliosUrl.insert(_index, _value);
  }

  List<String> _outrasReceitasUrl = [];
  List<String> get outrasReceitasUrl => _outrasReceitasUrl;
  set outrasReceitasUrl(List<String> _value) {
    _outrasReceitasUrl = _value;
  }

  void addToOutrasReceitasUrl(String _value) {
    _outrasReceitasUrl.add(_value);
  }

  void removeFromOutrasReceitasUrl(String _value) {
    _outrasReceitasUrl.remove(_value);
  }

  void removeAtIndexFromOutrasReceitasUrl(int _index) {
    _outrasReceitasUrl.removeAt(_index);
  }

  void updateOutrasReceitasUrlAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _outrasReceitasUrl[_index] = updateFn(_outrasReceitasUrl[_index]);
  }

  void insertAtIndexInOutrasReceitasUrl(int _index, String _value) {
    _outrasReceitasUrl.insert(_index, _value);
  }

  List<String> _outrasReceitasText = [];
  List<String> get outrasReceitasText => _outrasReceitasText;
  set outrasReceitasText(List<String> _value) {
    _outrasReceitasText = _value;
  }

  void addToOutrasReceitasText(String _value) {
    _outrasReceitasText.add(_value);
  }

  void removeFromOutrasReceitasText(String _value) {
    _outrasReceitasText.remove(_value);
  }

  void removeAtIndexFromOutrasReceitasText(int _index) {
    _outrasReceitasText.removeAt(_index);
  }

  void updateOutrasReceitasTextAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _outrasReceitasText[_index] = updateFn(_outrasReceitasText[_index]);
  }

  void insertAtIndexInOutrasReceitasText(int _index, String _value) {
    _outrasReceitasText.insert(_index, _value);
  }

  String _homeTotalPages = '';
  String get homeTotalPages => _homeTotalPages;
  set homeTotalPages(String _value) {
    _homeTotalPages = _value;
  }

  int _homeCurrentPage = 1;
  int get homeCurrentPage => _homeCurrentPage;
  set homeCurrentPage(int _value) {
    _homeCurrentPage = _value;
  }

  String _homeCategorie = '';
  String get homeCategorie => _homeCategorie;
  set homeCategorie(String _value) {
    _homeCategorie = _value;
  }

  String _homeCategoriesExclude = '';
  String get homeCategoriesExclude => _homeCategoriesExclude;
  set homeCategoriesExclude(String _value) {
    _homeCategoriesExclude = _value;
  }

  String _searchTotalPages = '';
  String get searchTotalPages => _searchTotalPages;
  set searchTotalPages(String _value) {
    _searchTotalPages = _value;
  }

  int _searchCurrentPages = 1;
  int get searchCurrentPages => _searchCurrentPages;
  set searchCurrentPages(int _value) {
    _searchCurrentPages = _value;
  }

  String _searchCategories = '';
  String get searchCategories => _searchCategories;
  set searchCategories(String _value) {
    _searchCategories = _value;
  }

  String _searchCategoriesExclude = '';
  String get searchCategoriesExclude => _searchCategoriesExclude;
  set searchCategoriesExclude(String _value) {
    _searchCategoriesExclude = _value;
  }

  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String _value) {
    _searchText = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
