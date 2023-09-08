import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/utils/styles_util.dart';
import 'package:flutter_test_work/domain/models/places/detailed_place_model.dart';
import 'package:flutter_test_work/modules/place_details/presentation/widgets/nerby_place_container_widget.dart';

class NerbyPlacesWidget extends StatelessWidget {
  final DetailedPlaceModel place;
  const NerbyPlacesWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Lugares cercanos', style: StylesUtil.w700(18)),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: place.closerPlaces.length,
              separatorBuilder: (context, x) => const SizedBox(width: 16),
              itemBuilder: (context, x) {
                final nerbyPlace = place.closerPlaces[x];
                return NerbyPlaceContainerWidget(
                  place: nerbyPlace,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
