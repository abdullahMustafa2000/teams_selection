
import 'dart:math';

/// create string, initialize index 0 with team sequence, loop, select number randomly, get the index of the number and put it in the string,
/// if the string has 6 chars then create a new string, repeat the operation till the list of strings have filled with number of teams

void main(List<String> arguments) {
  int numberOfTeams = 3;
  int noOfPlayers = 9;
  List<int> list  = teamCount(noOfPlayers, numberOfTeams);
  int  noOfPlayersEachTeam = list[0];
  List<String> playersList = ['player0', 'player1', 'player2', 'player3',
    'player4', 'player5', 'player6', '', ''];
  List<String> teams = [];
  List<bool> alreadySelected = List.filled(playersList.length, false);
  for (var i = 0; i<numberOfTeams; i++) {
    String team = '';
    int counter = 1;
    do {
      int randomNumber = Random().nextInt(playersList.length);

      if (!alreadySelected[randomNumber]) {
        alreadySelected[randomNumber] = true;
        team += '${playersList[randomNumber]},';
        counter++;
      }
    } while(counter <= noOfPlayersEachTeam);
    teams.add(team);
  }
  print(teams);
}

List<int> teamCount(int noOfPlayers, int numberOfTeams) {
  if (noOfPlayers % numberOfTeams != 0) {
    do {
      noOfPlayers++;
    } while (noOfPlayers % numberOfTeams != 0);
  }
  return [noOfPlayers~/numberOfTeams, noOfPlayers];
}
