import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String formatTitle(String text) {
  if (text.contains("&#8211;")) {
    text = text.replaceAll("&#8211;", "-");
  }
  return text;
}

String getCategory(
  String id,
  List<String> lCategories,
  List<String> lIds,
) {
  for (var i = 0; i < lIds.length; i++) {
    if (id == lIds[i]) {
      return lCategories[i];
    }
  }

  return "";
}

bool containsOutrasReceitas(String text) {
  if (text.contains("Confira mais")) {
    return true;
  }
  return false;
}

String getImage(String link) {
  return link;
}

String formatResume(String text) {
  if (text.contains("<p>")) {
    text = text.replaceAll("<p>", "");
  }
  if (text.contains("</p>")) {
    text = text.replaceAll("</p>", "");
  }
  if (text.contains("[&hellip;]")) {
    text = text.replaceAll("[&hellip;]", "[...]");
  }
  return text;
}

List<String>? getArticleLinks(String htmlText) {
  // Define a regular expression to match all links in the HTML text
  RegExp exp = RegExp(r'<a href="([^"]*)">.*<\/a>');

  // Use the regular expression to extract all the links from the HTML text
  Iterable<Match> matches = exp.allMatches(htmlText);

  // Map the matches to a list of strings containing the links
  List<String>? links =
      matches.map((match) => match.group(1)).cast<String>().toList();

  print(links.toString());
  return links;
}

String getSuperArticleText(String text) {
  if (text.contains("Dica para o")) {
    text = text.substring(0, text.indexOf("Dica para o"));
  } else if (text.contains("Utensílios que vão")) {
    text = text.substring(0, text.indexOf("Utensílios que vão"));
  } else if (text.contains("Confira mais")) {
    text = text.substring(0, text.indexOf("Confira mais"));
  }

  if (text.contains("<p>", 0)) {
    text = text.replaceAll("<p>", "");
  }

  if (text.contains("</p>", 0)) {
    text = text.replaceAll("</p>", "");
  }

  if (text.contains("<h1>", 0)) {
    text = text.replaceAll("<h1>", "");
  }

  if (text.contains("</h1>", 0)) {
    text = text.replaceAll("</h1>", "");
  }

  if (text.contains("<h2>", 0)) {
    text = text.replaceAll("<h2>", "");
  }

  if (text.contains("</h2>", 0)) {
    text = text.replaceAll("</h2>", "");
  }

  if (text.contains("<h3>", 0)) {
    text = text.replaceAll("<h3>", "");
  }

  if (text.contains("</h3>", 0)) {
    text = text.replaceAll("</h3>", "");
  }

  if (text.contains("<h4>", 0)) {
    text = text.replaceAll("<h4>", "");
  }

  if (text.contains("</h4>", 0)) {
    text = text.replaceAll("</h4>", "");
  }

  if (text.contains("<h5>", 0)) {
    text = text.replaceAll("<h5>", "");
  }

  if (text.contains("</h5>", 0)) {
    text = text.replaceAll("</h5>", "");
  }

  if (text.contains("<h6>", 0)) {
    text = text.replaceAll("<h6>", "");
  }

  if (text.contains("</h6>", 0)) {
    text = text.replaceAll("</h6>", "");
  }

  if (text.contains("<ul>", 0)) {
    text = text.replaceAll("<ul>", "");
  }

  if (text.contains("</ul>", 0)) {
    text = text.replaceAll("</ul>", "");
  }

  if (text.contains("<ol>", 0)) {
    text = text.replaceAll("<ol>", "");
  }

  if (text.contains("</ol>", 0)) {
    text = text.replaceAll("</ol>", "");
  }

  if (text.contains("<li>", 0)) {
    text = text.replaceAll("<li>", "");
  }

  if (text.contains("</li>", 0)) {
    text = text.replaceAll("</li>", "");
  }

  if (text.contains("<em>", 0)) {
    text = text.replaceAll("<em>", "");
  }

  if (text.contains("</em>", 0)) {
    text = text.replaceAll("</em>", "");
  }

  if (text.contains("&nbsp;", 0)) {
    text = text.replaceAll("&nbsp;", "");
  }

  RegExp exp = RegExp(r'<[^>]*>|&[^;]+;');
  text = text.replaceAll(exp, '');

  return text;
}

String formatText(
  String text,
  int index,
) {
  if (text.contains("<p>", 0)) {
    text = text.replaceAll("<p>", "");
  }

  if (text.contains("</p>", 0)) {
    text = text.replaceAll("</p>", "");
  }

  if (text.contains("</ br>", 0)) {
    text = text.replaceAll("</ br>", "");
  }

  if (text.contains("<br />", 0)) {
    text = text.replaceAll("<br />", "");
  }

  if (text.contains("<strong>", 0)) {
    text = text.replaceAll("<strong>", "");
  }

  if (text.contains("</strong>", 0)) {
    text = text.replaceAll("</strong>", "");
  }

  if (text.contains("<h3>", 0)) {
    text = text.replaceAll("<h3>", "");
  }

  if (text.contains("</h3>", 0)) {
    text = text.replaceAll("</h3>", "");
  }

  if (text.contains("<h2>", 0)) {
    text = text.replaceAll("<h2>", "");
  }

  if (text.contains("</h2>", 0)) {
    text = text.replaceAll("</h2>", "");
  }

  if (text.contains("<h4>", 0)) {
    text = text.replaceAll("<h4>", "");
  }

  if (text.contains("</h4>", 0)) {
    text = text.replaceAll("</h4>", "");
  }

  if (text.contains("<ol>", 0)) {
    text = text.replaceAll("<ol>", "");
  }

  if (text.contains("</ol>", 0)) {
    text = text.replaceAll("</ol>", "");
  }

  if (text.contains("<h5>", 0)) {
    text = text.replaceAll("<h5>", "");
  }

  if (text.contains("</h5>", 0)) {
    text = text.replaceAll("</h5>", "");
  }

  if (text.contains("<h6>", 0)) {
    text = text.replaceAll("<h6>", "");
  }

  if (text.contains("</h6>", 0)) {
    text = text.replaceAll("</h6>", "");
  }

  if (text.contains("<ul>", 0)) {
    text = text.replaceAll("<ul>", "");
  }

  if (text.contains("</ul>", 0)) {
    text = text.replaceAll("</ul>", "");
  }

  if (text.contains("<li>", 0)) {
    text = text.replaceAll("<li>", "");
  }

  if (text.contains("</li>", 0)) {
    text = text.replaceAll("</li>", "");
  }

  if (text.contains("<em>", 0)) {
    text = text.replaceAll("<em>", "");
  }

  if (text.contains("</em>", 0)) {
    text = text.replaceAll("</em>", "");
  }

  if (text.contains("&#8211;")) {
    text = text.replaceAll("&#8211;", "-");
  }

  // Remove <a> completo
  //text = text.replaceAll(RegExp(r'<a\b[^>]*>.*?</a>'), '');

  // Remove <a> mantendo o texto
  text = text.replaceAllMapped(
      RegExp(r'<a\b[^>]*>(.*?)</a>'), (match) => match.group(1)!);

  // Remove <figure>
  text = text.replaceAll(RegExp(r'<figure\b[^>]*>.*?</figure>'), '');

  // Remove <div>
  // text =
  //     text.replaceAll(RegExp(r'<div\b[^>]*class="inner"[^>]*>.*?</div>'), '');
  text = text.replaceAll(RegExp(r'<div\b[^>]*>.*?</div>'), '');

  if (text.contains("&nbsp")) {
    text = text.replaceAll("&nbsp", "");
  }

  if (text.contains(";&nbsp")) {
    text = text.replaceAll(";&nbsp", "");
  }

  if (text.contains("&nbsp;")) {
    text = text.replaceAll("&nbsp;", "");
  }

  if (text.contains(";")) {
    text = text.replaceAll(";", "");
  }

  if (text.contains("&#8221")) {
    text = text.replaceAll("&#8221", "");
  }

  if (text.contains("&#8220")) {
    text = text.replaceAll("&#8220", "");
  }

  if (text.contains("Confira mais publicações de nosso blog:")) {
    text = text.substring(
        0, text.indexOf("Confira mais publicações de nosso blog:"));
  }

  if (text.contains("Utensílios que vão te auxiliar")) {
    text = text.substring(0, text.indexOf("Utensílios que vão te auxiliar"));
  }

  text = text.replaceAll("\n\n", "\n");
  text = text.replaceAll("\n\n\n", "\n");
  text = text.replaceAll("\n\n\n\n", "\n");
  text = text.replaceAll("\n\n\n\n\n", "\n");
  text = text.replaceAll("\n\n\n\n\n\n", "\n");
  text = text.replaceAll("\n\n\n\n\n\n\n", "\n");
  text = text.replaceAll("\n\n\n\n\n\n\n\n", "\n");

  text = text.trim();

  //-------------------------------------------------

  if (text.contains("LINK DO CURSO:")) {
    text = text.replaceAll("LINK DO CURSO:", "");
  }

  if (text.contains("Dica para o leitor:")) {
    text = text.replaceAll("Dica para o leitor:", "\nDica para o leitor:\n");
  }

  if (text.contains("Dicas de uso")) {
    text = text.replaceAll("Dicas de uso", "\Dicas de uso\n");
  }

  if (text.contains("Materiais Necessários:")) {
    text =
        text.replaceAll("Materiais Necessários:", "\nMateriais Necessários:\n");
  }

  if (text.contains("Conclusão")) {
    text = text.replaceAll("Conclusão", "Conclusão\n");
  }

  if (text.contains("Instruções:")) {
    text = text.replaceAll("Instruções:", "\nInstruções:\n");
  }

  if (text.contains("Ingredientes:")) {
    text = text.replaceAll("Ingredientes:", "\nIngredientes:\n");
  }

  if (text.contains("Modo de preparo:")) {
    text = text.replaceAll("Modo de preparo:", "Modo de preparo:\n");
  } else if (text.contains("Modo de Preparo:")) {
    text = text.replaceAll("Modo de Preparo:", "Modo de Preparo:\n");
  }

  //-------------------------------------------------

  String text1, text2;

  if (text.contains("Modo de")) {
    text1 = text.substring(0, text.indexOf("Modo de"));
    text2 = text.substring(text.indexOf("Modo de"), text.length);
  } else {
    text1 = text.substring(0, text.indexOf(".", (text.length ~/ 4)) + 1);
    text2 = text.substring(text.indexOf(text1), text.length);
  }

  if (index == 1) {
    return text1;
  } else if (index == 2) {
    return text2;
  }

  return text;
}

String addFavorite(String id) {
  return id.toString();
}

bool isFavorite(
  List<String> lFavorites,
  String id,
) {
  return lFavorites.contains(id.toString());
}

List<String> getArticleLinksUrlDicaLeitor(String text) {
  if (text.contains("Dica para o leitor")) {
    text =
        text.substring((text.indexOf("Dica para o leitor:") + 19), text.length);

    if (text.contains("Utensílios")) {
      text = text.substring(0, text.indexOf("Utensílios"));
    } else if (text.contains("Confira mais")) {
      text = text.substring(0, text.indexOf("Confira mais"));
    }

    if (text.contains(
        "Gostou da receita? Então não perca tempo e baixe nosso aplicativo no seu celular:")) {
      text = text.substring(
          0,
          text.indexOf(
              "Gostou da receita? Então não perca tempo e baixe nosso aplicativo no seu celular:"));
    }

    final regex = RegExp(r'<a[^>]* href="([^"]*)"[^>]*>');
    final matches = regex.allMatches(text);
    List<String>? links =
        matches.map((match) => match.group(1)).cast<String>().toList();

    List<String>? lala = links.toSet().toList();

    return lala;
  }

  List<String>? links = ["lala", "la"];
  return links;
}

List<String> getArticleLinksTextDicaLeitor(String text) {
  if (text.contains("Dica para o leitor")) {
    text =
        text.substring((text.indexOf("Dica para o leitor:") + 20), text.length);

    if (text.contains("Utensílios")) {
      text = text.substring(0, text.indexOf("Utensílios"));
    } else if (text.contains("Confira mais")) {
      text = text.substring(0, text.indexOf("Confira mais"));
    }

    if (text.contains(
        "Gostou da receita? Então não perca tempo e baixe nosso aplicativo no seu celular:")) {
      text = text.substring(
          0,
          text.indexOf(
              "Gostou da receita? Então não perca tempo e baixe nosso aplicativo no seu celular:"));
    }

    final regex = RegExp(r'<a[^>]*>(.*?)<\/a>');
    final matches = regex.allMatches(text);
    final links =
        matches.map((match) => match.group(1)).cast<String>().toList();
    return links;
  }

  List<String>? links = ["lala", "la"];
  return links;
}

List<String> getArticleUtensiliosText(String text) {
  if (text.contains("Utensílios que vão")) {
    text =
        text.substring((text.indexOf("Utensílios que vão") + 56), text.length);

    if (text.contains("Confira mais")) {
      text = text.substring(0, text.indexOf("Confira mais"));
    }

    final regex = RegExp(r'<a[^>]*>(.*?)<\/a>');
    final matches = regex.allMatches(text);
    List<String> links =
        matches.map((match) => match.group(1)).cast<String>().toList();

    links.removeWhere((item) => item.contains('<img'));

    for (int i = 0; i < links.length; i++) {
      if (links[i].contains("<span")) {
        links[i] = links[i].replaceAll(RegExp('<[^>]*>'), '');
      }
    }

    return links;
  }

  List<String>? links = ["lala", "la"];
  return links;
}

List<String> getArticleOutrasReceitasUrl(String text) {
  if (text.contains("Confira mais")) {
    text = text.substring(
        (text.indexOf("Confira mais publicações de nosso blog:") + 39),
        text.length);

    final regex = RegExp(r'<a[^>]* href="([^"]*)"[^>]*>');
    final matches = regex.allMatches(text);
    List<String>? links =
        matches.map((match) => match.group(1)).cast<String>().toList();
    return links;
  }

  List<String>? links = ["lala", "la"];
  return links;
}

List<String> getArticleUtensiliosUrl(String text) {
  if (text.contains("Utensílios que vão")) {
    text =
        text.substring((text.indexOf("Utensílios que vão") + 56), text.length);

    if (text.contains("Confira mais")) {
      text = text.substring(0, text.indexOf("Confira mais"));
    }

    final regex = RegExp(r'<a[^>]* href="([^"]*)"[^>]*>');
    final matches = regex.allMatches(text);
    List<String>? links =
        matches.map((match) => match.group(1)).cast<String>().toList();

    final temp = links.toSet().toList();
    return temp;
  }

  List<String>? links = ["lala", "la"];
  return links;
}

String getNumberComments(List<String> replies) {
  return replies.length.toString();
}

String setIncludeFavs(List<String> fav) {
  String temp = "";

  for (int i = 0; i < fav.length; i++) {
    if (temp.length <= 0) {
      temp = fav[i];
    } else {
      temp = temp + "," + fav[i];
    }
  }

  print(temp);
  return temp;
}

List<String> getArticleOutrasReceitasText(String text) {
  if (text.contains("Confira mais")) {
    text = text.substring(
        (text.indexOf("Confira mais publicações de nosso blog:") + 39),
        text.length);

    if (text.contains("&#8211;")) {
      text = text.replaceAll("&#8211;", "-");
    }

    final regex = RegExp(r'<a[^>]*>(.*?)<\/a>');
    final matches = regex.allMatches(text);
    final links =
        matches.map((match) => match.group(1)).cast<String>().toList();

    return links;
  }

  List<String>? links = ["lala", "la"];
  return links;
}

String getArticleIntro(String text) {
  text = text.substring(0, text.indexOf("Ingredientes:"));

  if (text.contains("&nbsp;", 0)) {
    text = text.replaceAll("&nbsp;", "");
  }

  RegExp regex = RegExp(r'<p>(.*?)<\/p>');
  String temp =
      regex.allMatches(text).map((match) => match.group(1)).join('\n');

  temp = temp.replaceAll("\n", "");
  temp = temp.replaceAll("\n\n", "\n");
  temp = temp.replaceAll("\n\n\n", "\n");
  temp = temp.replaceAll("\n\n\n\n", "\n");

  return temp;
}

List<String> getArticleIngredients(String text) {
  text = text.substring(
      (text.indexOf("Ingredientes:") + 13), text.indexOf("Modo de preparo:"));

  RegExp regex = RegExp(r'<li>(.*?)<\/li>');
  List<String>? temp = regex
      .allMatches(text)
      .map((match) => match.group(1))
      .cast<String>()
      .toList();

  return temp;
}

List<String> getArticlePrepare(String text) {
  if (text.contains("Dica para")) {
    text = text.substring(
        (text.indexOf("Modo de preparo:") + 16), text.indexOf("Dica para"));
  } else if (text.contains("Utensílios")) {
    text = text.substring(
        (text.indexOf("Modo de preparo:") + 16), text.indexOf("Utensílios"));
  } else if (text.contains("Confira mais")) {
    text = text.substring(
        (text.indexOf("Modo de preparo:") + 16), text.indexOf("Confira mais"));
  } else {
    text = text.substring((text.indexOf("Modo de preparo:") + 16), text.length);
  }

  RegExp regex = RegExp(r'<li>(.*?)<\/li>');
  List<String>? temp = regex
      .allMatches(text)
      .map((match) => match.group(1))
      .cast<String>()
      .toList();

  return temp;
}

int setPrepareNumber(int index) {
  return index + 1;
}

bool containsDicaLeitor(String text) {
  if (text.contains("Dica para o leitor")) {
    return true;
  }
  return false;
}

String getArticleDicaLeitor(String text) {
  if (text.contains("Dica para o leitor")) {
    text =
        text.substring((text.indexOf("Dica para o leitor:") + 19), text.length);

    if (text.contains("Utensílios")) {
      text = text.substring(0, text.indexOf("Utensílios"));
    } else if (text.contains("Confira mais")) {
      text = text.substring(0, text.indexOf("Confira mais"));
    }

    if (text.contains(
        "Gostou da receita? Então não perca tempo e baixe nosso aplicativo no seu celular:")) {
      text = text.substring(
          0,
          text.indexOf(
              "Gostou da receita? Então não perca tempo e baixe nosso aplicativo no seu celular:"));
    }

    if (text.contains("<h6>", 0)) {
      text = text.replaceAll("<h6>", "");
    }

    if (text.contains("</h6>", 0)) {
      text = text.replaceAll("</h6>", "");
    }

    if (text.contains("<strong>", 0)) {
      text = text.replaceAll("<strong>", "");
    }

    if (text.contains("</strong>", 0)) {
      text = text.replaceAll("</strong>", "");
    }

    if (text.contains("<p>", 0)) {
      text = text.replaceAll("<p>", "");
    }

    if (text.contains("</p>", 0)) {
      text = text.replaceAll("</p>", "");
    }

    if (text.contains("<em>", 0)) {
      text = text.replaceAll("<em>", "");
    }

    if (text.contains("</em>", 0)) {
      text = text.replaceAll("</em>", "");
    }

    if (text.contains("&nbsp;", 0)) {
      text = text.replaceAll("&nbsp;", "");
    }

    if (text.contains("<br />", 0)) {
      text = text.replaceAll("<br />", "");
    }

    RegExp aRegex = RegExp(r'<a.*?>(.*?)<\/a>');
    String temp = text.replaceAllMapped(aRegex, (match) => match.group(1)!);

    if (temp.contains("Confira aqui")) {
      temp = temp.substring(0, temp.indexOf("Confira aqui"));
    }

    temp = temp.replaceAll("\n", "");
    temp = temp.replaceAll("\n\n", "");
    temp = temp.replaceAll("\n\n\n", "");

    return temp;
  }

  return "lala";
}

bool containsUtensilios(String text) {
  if (text.contains("Utensílios que vão")) {
    return true;
  }
  return false;
}

int convertStrToInt(String text) {
  return int.parse(text);
}

int updateCurrentPage(
  int curentPage,
  bool isSoma,
) {
  if (isSoma = true) {
    curentPage = curentPage + 1;
  } else {
    curentPage = curentPage - 1;
  }
  return curentPage;
}
