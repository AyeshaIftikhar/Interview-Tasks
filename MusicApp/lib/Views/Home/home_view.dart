import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:get/get.dart';
import 'package:musicapp/Constant/colors.dart';
import 'package:musicapp/Constant/consts.dart';
import 'package:musicapp/Constant/route_names.dart';
import 'package:musicapp/Controllers/home_controller.dart';
import 'package:musicapp/Theme/input_decoration.dart';
import 'package:musicapp/Widgets/appbar.dart';
import 'package:musicapp/Widgets/circular_loading_widget.dart';
import 'package:musicapp/Widgets/custom_text.dart';
import 'package:musicapp/Widgets/track_widget.dart';

import 'Widgets/title_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: customAppBar(
          title: CustomText(
              text: 'Home'.tr, alignment: Alignment.center, size: 16),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: searchbar(),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.refreshHome(showMessage: true),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: controller.searching.value
                ? CircularLoadingWidget(
                    height: height,
                    onCompleteText: 'Nothing to show...',
                  )
                : Column(
                    children: [
                      titleWidget(text: 'Top Tracks '),
                      SizedBox(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.tracklist.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            var _track = controller.tracklist[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  trackDetails,
                                  parameters: {
                                    'artist_name': _track.artist!.name!,
                                    'track_name': _track.name!,
                                  },
                                );
                              },
                              child: trackWidget(
                                name: _track.artist!.name!,
                                icon: _track.image![0].text!,
                                title: _track.name!,
                                timeline: _track.image![1].text!,
                                count: _track.playcount!,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget searchbar() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10, top: 10, bottom: 20),
      child: TextFormField(
        readOnly: true,
        onTap: () => Get.toNamed(search),
        decoration: inputDecoration(
          hint: 'Search'.tr,
          suffix: GestureDetector(
            child: Container(
              width: 15,
              height: 10,
              color: green.withOpacity(0.9),
              child: const Icon(Icons.search, color: white, size: 23),
            ),
          ),
        ),
      ),
    );
  }
}
