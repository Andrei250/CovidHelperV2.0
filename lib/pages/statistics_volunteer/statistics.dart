import 'package:covidhelper_v2/pages/statistics_volunteer/stats_widget.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class StatisticsVolunteer extends StatefulWidget {
  @override
  _StatisticsVolunteerState createState() => _StatisticsVolunteerState();
}

class _StatisticsVolunteerState extends State<StatisticsVolunteer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 15.0),
              child: Center(
                  child: Text(
                'Iata ce ai reusit pana acum',
                style: eTitle,
              )),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: StatsWidget(
                  lun: 1,
                  mar: 2,
                  mie: 3,
                  joi: 4,
                  vin: 5,
                  sam: 6,
                  dum: 10,
                  maximum: 10,
                  text: 'Persoane ajutate',
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: StatsWidget(
                  lun: 6,
                  mar: 12,
                  mie: 13,
                  joi: 11,
                  vin: 9,
                  sam: 3,
                  dum: 20,
                  maximum: 20,
                  text: 'Kilometri parcursi',
                )),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                    color: Colors.grey[100],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Esti pe locul xx in topul voluntarilor!',
                          style: eStats,
                        ),
                      ),
                    ),
                  )),
            ),
            SizedBox(height: 20,),

          ],
        ));
  }
}
