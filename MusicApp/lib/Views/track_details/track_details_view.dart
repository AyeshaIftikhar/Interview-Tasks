import 'package:card_swiper/card_swiper.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/Common/ui.dart';
import 'package:musicapp/Constant/colors.dart';
import 'package:musicapp/Constant/consts.dart';
import 'package:musicapp/Controllers/track_details.dart';
import 'package:musicapp/Widgets/circular_loading_widget.dart';
import 'package:musicapp/Widgets/custom_text.dart';
import 'package:musicapp/Widgets/fade_in_image.dart';

class TrackDetailsView extends GetView<TrackDetailsController> {
  const TrackDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: () => controller.refreshTrackDetail(showMessage: true),
        child: Scaffold(
          backgroundColor: white.withOpacity(0.9),
          body: controller.searching.value
              ? CircularLoadingWidget(
                  height: height,
                  onCompleteText: 'Nothing to show...',
                )
              : CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 250.0,
                      floating: false,
                      pinned: false,
                      automaticallyImplyLeading: false,
                      leading: Container(
                        margin: const EdgeInsets.only(left: 10),
                        decoration: const BoxDecoration(
                          color: blue,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.arrow_back),
                          color: white,
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        // ignore: unnecessary_null_comparison
                        background: controller.album.value == null
                            ? const SizedBox()
                            : Swiper(
                                itemCount: controller.album.value.image!.length,
                                autoplay: true,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        FadeInImageWidget(
                                  image: controller
                                      .album.value.image![index].text!,
                                ),
                              ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          customContainers(
                            child: Column(
                              children: [
                                CustomText(
                                  size: 16,
                                  text: controller.track.value.name!,
                                  weight: FontWeight.bold,
                                ),
                                const SizedBox(height: 5),
                                ExpandableText(
                                  Ui.parseString(
                                      controller.wiki.value.summary!),
                                  expandText: 'Read More',
                                  collapseText: 'Read Less',
                                  maxLines: 2,
                                  linkColor: blue3,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          BookingTilWidget(
                            title: const CustomText(
                              size: 18,
                              text: 'Artist',
                              weight: FontWeight.bold,
                            ),
                            content: CustomText(
                              text: controller.artist.value.name!,
                            ),
                            actions: const [],
                          ),
                          BookingTilWidget(
                            title: const CustomText(
                              size: 18,
                              text: 'Wiki\'s',
                              weight: FontWeight.bold,
                            ),
                            content: Column(
                              children: [
                                CustomText(
                                  text: Ui.parseString(
                                      controller.wiki.value.content!),
                                ),
                              ],
                            ),
                            actions: [
                              CustomText(
                                text: controller.wiki.value.published!,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget customContainers({
    required Widget child,
    EdgeInsetsGeometry padding =
        const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      child: child,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: greylight.withOpacity(0.5),
            blurRadius: 0.1,
            spreadRadius: 1.0,
          )
        ],
      ),
    );
  }
}

class BookingTilWidget extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final double? horizontalPadding;

  const BookingTilWidget({
    Key? key,
    this.title,
    this.content,
    this.actions,
    this.horizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 20, vertical: 15),
      decoration: Ui.getBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: title!),
              if (actions != null) Wrap(children: actions!)
            ],
          ),
          const Divider(height: 26, thickness: 1.2),
          content!,
        ],
      ),
    );
  }
}
