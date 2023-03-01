import 'package:get/get.dart';
import 'package:musicapp/Bindings/track_detail_binding.dart';
import 'package:musicapp/Bindings/root_bindings.dart';
import 'package:musicapp/Bindings/search_bindings.dart';
import 'package:musicapp/Constant/route_names.dart';
import 'package:musicapp/Views/root_view.dart';
import 'package:musicapp/Views/search_view.dart';
import 'package:musicapp/Views/track_details/track_details_view.dart';

List<GetPage> approutes = <GetPage>[
  GetPage(name: root, page: () => const RootView(), binding: RootBindings()),
  GetPage(
    name: search,
    page: () => const SearchView(),
    binding: SearchBinding(),
  ),
  GetPage(
    name: trackDetails,
    page: () => const TrackDetailsView(),
    binding: TrackDetailBinding(),
  ),
];
