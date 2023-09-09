import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/app/app_constants.dart';
import 'package:flutter_test_work/core/utils/utils.dart';
import 'package:flutter_test_work/domain/models/places/place_image_model.dart';

class PlaceGaleryWidget extends StatelessWidget {
  final List<PlaceImageModel> images;
  const PlaceGaleryWidget({super.key, required this.images});

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
          Row(
            children: [
              const Icon(
                Icons.image,
                color: AppConstants.accent,
              ),
              const SizedBox(width: 8),
              Text('Galeria', style: StylesUtil.w700(18)),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...images.map(
                (e) {
                  // Only use custom size if lenght is less than 3
                  final x = images.indexOf(e);
                  final width = MediaQuery.of(context).size.width;
                  final isFullSize = x % 3 == 0 || images.length < 3;
                  final collapsedImagesSize = width * 0.4;
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppConstants.greyColor,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: e.file,
                        height: 100,
                        fit: BoxFit.cover,
                        width: isFullSize ? width : collapsedImagesSize,
                        progressIndicatorBuilder: (context, url, progress) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
