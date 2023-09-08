import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/app/app_constants.dart';
import 'package:flutter_test_work/core/utils/utils.dart';

class PlaceImageWidget extends StatelessWidget {
  final int score;
  final String image;
  const PlaceImageWidget({
    super.key,
    required this.score,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.25;
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Stack(
          children: [
            Image.network(
              image,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  height: size * 0.25,
                  width: size * 0.5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          score.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: StylesUtil.w700(
                            10,
                            AppConstants.greyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
