import 'dart:convert';
import 'dart:io';

import 'package:basketball/model/team.model.dart';
import 'package:basketball/model/basket.model.dart';
import 'package:basketball/ui/gamesUI.model.dart';
import 'package:basketball/ui/teamsUI.model.dart';
import 'package:http/http.dart' as http;

class BasketService {
  Future<List<GameUI>> loadGames() async {
    var _uri = Uri.https('www.mocky.io', 'v2/5de8d38a3100000f006b1479');
    var response = await http.Client().get(_uri);
    List<GameUI> games = List.empty(growable: true);
    if (response.statusCode == HttpStatus.ok) {
      var listGame = BasketBall.fromJson(jsonDecode(response.body));
      listGame.data?.forEach((element) {
        games.add(
          GameUI(
            homeTeam: element.homeTeam!.fullName!,
            visitorTeam: element.visitorTeam!.fullName!,
            score: '${element.homeTeamScore} - ${element.visitorTeamScore}',
            time: '${element.date}',
            status: '${element.status}',
            homeTeamAbr: element.homeTeam!.abbreviation!,
            visitorTeamAbr: element.visitorTeam!.abbreviation!,
          ),
        );
      });
    }
    return games;
  }

  Future<List<TeamUI>> loadTeams() async {
    var _uri = Uri.https('www.mocky.io', 'v2/5de8d40d31000074006b1487');
    var response = await http.Client().get(_uri);
    List<TeamUI> teams = List.empty(growable: true);
    if (response.statusCode == HttpStatus.ok) {
      var listTeams = TeamsJson.fromJson(jsonDecode(response.body));
      listTeams.data?.forEach((element) {
        teams.add(
          TeamUI(
              fullName: element.fullName!,
              abbreviation: '${element.abbreviation}',
              city: '${element.city}',
              conference: '${element.conference}',
              division: '${element.division}',
              name: '${element.name}'),
        );
      });
    }
    return teams;
  }
}
