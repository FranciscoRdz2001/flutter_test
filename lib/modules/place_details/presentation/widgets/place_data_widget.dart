import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/app/app_constants.dart';
import 'package:flutter_test_work/core/utils/styles_util.dart';
import 'package:flutter_test_work/domain/models/places/detailed_place_model.dart';
import 'package:flutter_test_work/widgets/custom_button_widget.dart';

class PlaceDataWidget extends StatelessWidget {
  final DetailedPlaceModel place;
  const PlaceDataWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (place.categories.isNotEmpty) ...[
            Wrap(
              spacing: 8,
              runSpacing: -8,
              children: [
                ...place.categories.map(
                  (e) => Chip(
                    backgroundColor: AppConstants.greyColor,
                    padding: EdgeInsets.zero,
                    label: Text(
                      e.name,
                      style: StylesUtil.w500(10),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
          ],
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  place.logoImg,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.name,
                      style: StylesUtil.w700(18),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      height: 10,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (context, x) =>
                            const SizedBox(width: 0.5),
                        itemBuilder: (context, x) {
                          final filled = (x + 1) <= place.reviews.totalScore;
                          return Icon(
                            Icons.star_rounded,
                            size: 14,
                            color:
                                filled ? AppConstants.accent : Colors.grey[300],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: AppConstants.accent,
                size: 16,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  place.geolocation.textDirection,
                  style: StylesUtil.w400(10, Colors.grey[400]),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 200,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: place.mainImg,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => const Icon(Icons.error),
                  ),
                  Positioned(
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButtonWidget(
                        color: place.isFavorite ? Colors.red : Colors.black,
                        icon: Icons.favorite,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Precio',
                style: StylesUtil.w400(14, Colors.grey[400]),
              ),
              const SizedBox(width: 8),
              Text(
                place.rangePrice,
                style: StylesUtil.w700(14, AppConstants.accent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
