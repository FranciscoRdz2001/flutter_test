import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/app/app_constants.dart';
import 'package:flutter_test_work/core/utils/utils.dart';
import 'package:flutter_test_work/domain/models/places/place_amenity_model.dart';

class PlaceAmenitiesWidget extends StatelessWidget {
  final List<PlaceAmenityModel> amenities;
  const PlaceAmenitiesWidget({super.key, required this.amenities});

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
                Icons.menu,
                color: AppConstants.accent,
              ),
              const SizedBox(width: 8),
              Text('Amenidades', style: StylesUtil.w700(18)),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 0,
            children: [
              ...amenities.map(
                (e) => Chip(
                  backgroundColor: AppConstants.greyColor,
                  padding: EdgeInsets.zero,
                  label: Text(
                    e.name,
                    style: StylesUtil.w500(12),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
