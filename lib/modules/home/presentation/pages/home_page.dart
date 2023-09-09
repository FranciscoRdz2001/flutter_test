import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/app/app_constants.dart';
import 'package:flutter_test_work/modules/home/presentation/widgets/widgets.dart';
import 'package:flutter_test_work/providers/places/places_provider.dart';
import 'package:flutter_test_work/providers/screen_data_provider.dart';
import 'package:flutter_test_work/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlacesProvider(pagesToLoad: 4),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollHandler);

    super.initState();
  }

  void _scrollHandler() async {
    final places = Provider.of<PlacesProvider>(context, listen: false);
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        places.state != ScreenState.loading) {
      await places.loadOtherPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final places = Provider.of<PlacesProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: AppConstants.screenPadding,
            child: Column(
              children: [
                if (places.state == ScreenState.loading && !places.inPagination)
                  const LoadingWidget()
                else if (places.state == ScreenState.error)
                  const Text('No se pudieron cargar los lugares')
                else ...[
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
                  if (places.state == ScreenState.loading &&
                      places.inPagination) ...[
                    const SizedBox(height: 16),
                    const LoadingWidget()
                  ]
                ],
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
