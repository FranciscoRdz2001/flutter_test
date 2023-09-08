import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/app/app_constants.dart';
import 'package:flutter_test_work/modules/home/presentation/widgets/widgets.dart';
import 'package:flutter_test_work/providers/places_provider.dart';

// class HomeModule extends StatelessWidget {
//   const HomeModule({super.key});

//   @override
//   Widget build(BuildContext context) {}
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: AppConstants.screenPadding,
            child: Column(
              children: [
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 100,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return const PlaceContainerWidget();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
