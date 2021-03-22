import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API= "AIzaSyB77IGWcvdRxsDkuvYW-gtpJ1kJIY2Akmw";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  pesquisar(String pesquisa) async {
    http.Response response = await http.get(
        URL_BASE + "search"
            "?part=snippet"
            ""
    )
  }
}