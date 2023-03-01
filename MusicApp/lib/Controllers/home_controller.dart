import 'package:get/get.dart';
import 'package:musicapp/Common/ui.dart';
import 'package:musicapp/Model/top_tracks.dart';
import 'package:musicapp/repositories/home_repo.dart';

class HomeController extends GetxController {
  /// Repositories
  late HomeRepository _homeRepository;
  Rx<TopTracks> topTracks = TopTracks().obs;
  Rx<Tracks> tracks = Tracks().obs;
  RxList<Track> tracklist = <Track>[].obs;
  RxBool searching = true.obs;

  ///
  HomeController() {
    _homeRepository = HomeRepository();
  }

  @override
  Future<void> onInit() async {
    await refreshHome();
    super.onInit();
  }

  Future refreshHome({bool showMessage = false}) async {
    await getTopTracks();
    if (showMessage) {
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Home page refreshed successfully".tr));
    }
  }

  Future getTopTracks() async {
    try {
      topTracks.value = await _homeRepository.getTopTracks();
      await setFetchedData();
      searching.value = false;
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future setFetchedData() async {
    tracks.value = topTracks.value.tracks!;
    tracklist.assignAll(tracks.value.track!);
  }
}
