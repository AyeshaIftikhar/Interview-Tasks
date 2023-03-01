import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/Constant/colors.dart';
import 'package:musicapp/Constant/consts.dart';
import 'package:musicapp/Constant/route_names.dart';
import 'package:musicapp/Controllers/search_controller.dart';
import 'package:musicapp/Theme/input_decoration.dart';
import 'package:musicapp/Widgets/appbar.dart';
import 'package:musicapp/Widgets/circular_loading_widget.dart';
import 'package:musicapp/Widgets/custom_text.dart';
import 'package:musicapp/Widgets/track_widget.dart';

// ignore: must_be_immutable
class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: customAppBar(
          elevation: 5.0,
          implyleading: true,
          title: TextFormField(
            controller: controller.search,
            onEditingComplete: () {
              debugPrint(controller.search.text);
              controller.getSearchedProposals();
            },
            onFieldSubmitted: (value) {
              debugPrint(controller.search.text);
              controller.getSearchedProposals();
            },
            onSaved: (val) {
              debugPrint(controller.search.text);
              controller.getSearchedProposals();
            },
            decoration: inputDecoration(
              hint: 'Write something to search...',
              hintSize: 14,
              dense: false,
              hintColor: greylight,
              errorBorder: InputBorder.none,
              focusBorder: InputBorder.none,
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => controller.clearSearch(),
                icon: const Icon(Icons.cancel_outlined, color: grey),
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: controller.searching.value
              ? controller.tracklist.isEmpty
                  ? CircularLoadingWidget(
                      height: height,
                      onCompleteText: 'Nothing to show...',
                    )
                  : searchedProposalsWidget()
              : SizedBox(
                  height: height,
                  child: const Center(
                    child: CustomText(
                      text: 'Search here...',
                      alignment: Alignment.center,
                      size: 16,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget searchedProposalsWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.tracklist.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          var _track = controller.tracklist[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed(
                trackDetails,
                parameters: {
                  'artist_name': _track.artist!,
                  'track_name': _track.name!,
                },
              );
            },
            child: trackWidget(
              name: _track.artist!,
              icon: controller.images[0],
              title: _track.name!,
              timeline: controller.images[1],
              count: _track.listeners!,
            ),
          );
        },
      ),
    );
  }
}
