import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/app/app_constants.dart';
import 'package:flutter_test_work/core/utils/utils.dart';
import 'package:flutter_test_work/domain/models/places/place_closer_place_model.dart';

class NerbyPlaceContainerWidget extends StatelessWidget {
  final PlaceCloserPlaceModel place;
  const NerbyPlaceContainerWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: const BoxDecoration(
          color: AppConstants.greyColor,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              place.imgUrl,
              fit: BoxFit.cover,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    place.name,
                    style: StylesUtil.w500(14, Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppConstants.accent,
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          place.address,
                          style: StylesUtil.w400(10, Colors.grey[200]),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
