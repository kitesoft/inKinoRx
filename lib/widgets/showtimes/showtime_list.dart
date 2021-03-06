import 'package:flutter/material.dart';
import 'package:inkinoRx/data/show.dart';
import 'package:inkinoRx/widgets/common/info_message_view.dart';
import 'package:inkinoRx/widgets/showtimes/showtime_list_tile.dart';


class ShowtimeList extends StatelessWidget {
  static final Key emptyViewKey = new Key('emptyView');
  static final Key contentKey = new Key('content');

  ShowtimeList(this.shows);
  final List<Show> shows;

  @override
  Widget build(BuildContext context) {
    if (shows.isEmpty) {
      return new InfoMessageView(
        key: emptyViewKey,
        title: 'All empty!',
        description:
            'Didn\'t find any movies\nabout to start for today. ¯\\_(ツ)_/¯',
      );
    }

    return new Scrollbar(
      key: contentKey,
      child: new ListView.builder(
        padding: const EdgeInsets.only(bottom: 8.0),
        itemCount: shows.length,
        itemBuilder: (BuildContext context, int index) {
          var show = shows[index];
          var useAlternateBackground = index % 2 == 0;

          return new Column(
            children: <Widget>[
              new ShowtimeListTile(show, useAlternateBackground),
              new Divider(
                height: 1.0,
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          );
        },
      ),
    );
  }
}
