import 'package:flutter/material.dart';
import 'package:basketball/service/basket.service.dart';

import 'gamesUI.model.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<GameUI>>(
        future: BasketService().loadGames(),
        builder: (context, data) {
          if (data.hasData) {
            var gameList = data.data!;
            return ListView.builder(
              itemCount: gameList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "${gameList[index].homeTeam} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  gameList[index].homeTeamAbr,
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  gameList[index].time.substring(0, 10),
                                  style: const TextStyle(fontSize: 10),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Container(
                                  color: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      gameList[index].score,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  gameList[index].status.substring(0, 4),
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  gameList[index].visitorTeam,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  gameList[index].visitorTeamAbr,
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const LinearProgressIndicator();
          }
        },
      ),
    );
  }
}
