import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/app/app_constants.dart';
import 'package:flutter_test_work/core/utils/styles_util.dart';
import 'package:flutter_test_work/modules/place_details/presentation/widgets/widgets.dart';
import 'package:flutter_test_work/providers/places/place_details_provider.dart';
import 'package:flutter_test_work/providers/screen_data_provider.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/widgets.dart';

class PlaceDetailsModule extends StatelessWidget {
  final int id;
  const PlaceDetailsModule({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlaceDetailsProvider()..getData(id: id),
      child: const PlaceDetailsPage(),
    );
  }
}

class PlaceDetailsPage extends StatelessWidget {
  const PlaceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final place = Provider.of<PlaceDetailsProvider>(context);
    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: const DividerThemeData(
          color: Colors.transparent,
        ),
      ),
      child: Scaffold(
        extendBody: true,
        persistentFooterButtons: [
          AnimatedOpacity(
            opacity: place.state == ScreenState.loaded ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: AnimatedScale(
              scale: place.state == ScreenState.loaded ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linearToEaseOut,
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppConstants.accent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Reservar',
                  style: StylesUtil.w700(16, Colors.white),
                ),
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: AppConstants.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButtonWidget(
                    color: AppConstants.accent,
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 16),
                  if (place.state == ScreenState.loading)
                    const LoadingWidget()
                  else if (place.state == ScreenState.error)
                    const Center(child: Text('Error'))
                  else if (place.state == ScreenState.loaded) ...[
                    PlaceDataWidget(place: place.data!),
                    const SizedBox(height: 16),
                    NerbyPlacesWidget(place: place.data!),
                    const SizedBox(height: 16),
                    if (place.data!.schedules.isNotEmpty) ...[
                      PlaceScheduleWidget(schedules: place.data!.schedules),
                      const SizedBox(height: 16),
                    ],
                    if (place.data!.amenities.isNotEmpty) ...[
                      PlaceAmenitiesWidget(amenities: place.data!.amenities),
                      const SizedBox(height: 16),
                    ],
                    if (place.data!.gallery.isNotEmpty) ...[
                      PlaceGaleryWidget(images: place.data!.gallery),
                    ],
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
