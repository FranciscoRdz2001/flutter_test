import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/app/app_constants.dart';
import 'package:flutter_test_work/modules/home/presentation/widgets/widgets.dart';
import 'package:flutter_test_work/providers/places/places_provider.dart';
import 'package:flutter_test_work/providers/screen_data_provider.dart';
import 'package:provider/provider.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlacesProvider(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final places = Provider.of<PlacesProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: AppConstants.screenPadding,
            child: Column(
              children: [
                if (places.state == ScreenState.loading)
                  const CircularProgressIndicator()
                else if (places.state == ScreenState.error)
                  const Text('No se pudieron cargar los lugares')
                else
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: places.data?.length ?? 0,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, x) {
                      return PlaceContainerWidget(
                        place: places.data![x],
                      );
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
