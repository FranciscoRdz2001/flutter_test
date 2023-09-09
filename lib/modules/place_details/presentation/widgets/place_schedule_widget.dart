import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/app/app_constants.dart';
import 'package:flutter_test_work/core/utils/utils.dart';
import 'package:flutter_test_work/domain/models/places/place_schedules_model.dart';

class PlaceScheduleWidget extends StatelessWidget {
  static const _days = {
    'monday': 'Lunes',
    'tuesday': 'Martes',
    'wednesday': 'Miércoles',
    'thursday': 'Jueves',
    'friday': 'Viernes',
    'saturday': 'Sábado',
    'sunday': 'Domingo',
  };

  final List<PlaceSchedulesModel> schedules;
  const PlaceScheduleWidget({
    super.key,
    required this.schedules,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.access_time_filled_sharp,
                color: AppConstants.accent,
              ),
              const SizedBox(width: 8),
              Text('Horario', style: StylesUtil.w700(18)),
            ],
          ),
          const SizedBox(height: 16),
          ...schedules.map(
            (e) => Padding(
              padding: EdgeInsets.only(
                bottom: e == schedules.last ? 0 : 8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _days[e.weekday] ?? '',
                      style: StylesUtil.w500(16),
                    ),
                  ),
                  Text(
                    '${e.start} - ${e.end}',
                    style: StylesUtil.w400(16, Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
