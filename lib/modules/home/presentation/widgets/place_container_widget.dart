import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/app/app_constants.dart';
import 'package:flutter_test_work/core/utils/styles_util.dart';
import 'package:flutter_test_work/domain/models/places/place_model.dart';
import 'package:flutter_test_work/modules/home/presentation/widgets/widgets.dart';
import 'package:flutter_test_work/modules/modules.dart';

class PlaceContainerWidget extends StatelessWidget {
  final PlaceModel place;
  const PlaceContainerWidget({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PlaceDetailsModule(id: place.id),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlaceImageWidget(
              score: place.score,
              image: place.imageUrl,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: StylesUtil.w700(14, AppConstants.blackColor),
                  ),
                  const SizedBox(height: 10),
                  PlaceIconDataWidget(
                    icon: Icons.airplane_ticket,
                    iconColor: AppConstants.pinkColor,
                    data: place.categories,
                  ),
                  const SizedBox(height: 4),
                  PlaceIconDataWidget(
                    icon: Icons.access_time_filled_outlined,
                    iconColor: AppConstants.blueColor,
                    data: place.schedule,
                  ),
                  const SizedBox(height: 4),
                  PlaceIconDataWidget(
                    icon: Icons.attach_money_outlined,
                    iconColor: AppConstants.greenColor,
                    data: place.priceRange,
                  ),
                  const SizedBox(height: 4),
                  PlaceIconDataWidget(
                    icon: Icons.location_on_sharp,
                    iconColor: AppConstants.yellowColor,
                    data: place.location,
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
