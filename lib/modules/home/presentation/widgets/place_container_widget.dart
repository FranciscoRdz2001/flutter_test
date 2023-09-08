import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/app/app_constants.dart';
import 'package:flutter_test_work/core/utils/styles_util.dart';
import 'package:flutter_test_work/modules/home/presentation/widgets/place_image_widget.dart';
import 'package:flutter_test_work/modules/home/presentation/widgets/widgets.dart';

class PlaceContainerWidget extends StatelessWidget {
  const PlaceContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PlaceImageWidget(
            rating: 4.5,
            image: 'assets/images/restaurant.jpg',
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'La negrita Restaurante El Cuyo',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: StylesUtil.w700(14, AppConstants.blackColor),
                ),
                const SizedBox(height: 10),
                const PlaceIconDataWidget(
                  icon: Icons.airplane_ticket,
                  iconColor: AppConstants.pinkColor,
                  data: 'Restaurantes',
                ),
                const SizedBox(height: 4),
                const PlaceIconDataWidget(
                  icon: Icons.access_time_filled_outlined,
                  iconColor: AppConstants.blueColor,
                  data: '09:00 - 21:00',
                ),
                const SizedBox(height: 4),
                const PlaceIconDataWidget(
                  icon: Icons.attach_money_outlined,
                  iconColor: AppConstants.greenColor,
                  data: '\$60 - \$200',
                ),
                const SizedBox(height: 4),
                const PlaceIconDataWidget(
                  icon: Icons.location_on_sharp,
                  iconColor: AppConstants.yellowColor,
                  data: 'Yizimin, Yucatán',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
