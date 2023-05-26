import 'package:chewie/chewie.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/home/data/model/single_course_model.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/widgets/custom_error_view.dart';
import 'package:e_teach/features/widgets/custom_loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? chewieController;
  bool isVideoShowen = false;
  int _playingIndex = -1;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainCubit>(context).getCourseById(widget.id);
  }

  List<VideoCourse> videos = [];

  @override
  void dispose() {
    _videoPlayerController?.pause();
    _videoPlayerController?.dispose();
    _videoPlayerController = null;
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
        color: ColorManager.white,
      )),
      body: BlocBuilder<MainCubit, MainState>(builder: (context, state) {
        videos = [];
        if (state is GetCourseByIdSuccessfully) {
          state.singleCourseModel.response!.data!.videoCourse!.forEach((e) {
            var link = "https://eteach.albayan-eg.com/files/${e.videos}";
            videos.add(VideoCourse(name: e.name, videos: link));
          });

          return Container(
            decoration: BoxDecoration(color: ColorManager.primary),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 30.h,
                    child: (isVideoShowen == false)
                        ? Center(
                            child: Text(
                              AppStrings.noVideos.tr(),
                              style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s24,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _playVideo(context),
                              _controlVideo(context)
                            ],
                          )),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(70))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(Routes.paymentView);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.monetization_on_rounded,
                                color: ColorManager.black,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                AppStrings.supportInstructor.tr(),
                                style: TextStyle(
                                  color: ColorManager.black,
                                  fontSize: 14.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildListView(context)
                    ],
                  ),
                ))
              ],
            ),
          );
        } else if (State is GetCourseByIdFailed) {
          return CustomErrorWidget(
              voidCallback: () =>
                  MainCubit.get(context).getCourseById(widget.id));
        } else {
          return const CustomLoading();
        }
      }),
    );
  }

  _controlVideo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () async {
            final index = _playingIndex - 1;
            if (index > 0 && videos.isNotEmpty) {
              _initializeVideo(index);
            } else {
              debugPrint('NI VIDEOS NOW ');
            }
          },
          icon: const Icon(Icons.fast_rewind),
        ),
        IconButton(
          onPressed: () async {
            final index = _playingIndex + 1;
            if (index < videos.length) {
              _initializeVideo(index);
            } else {
              debugPrint('YOU WATCHED ALL VIDEOS ');
            }
          },
          icon: const Icon(Icons.fast_forward),
        ),
      ],
    );
  }

  _playVideo(BuildContext context) {
    final controller = _videoPlayerController;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(
            controller: chewieController!,
          ));
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(child: Text(AppStrings.loading.tr())),
      );
    }
  }

  _initializeVideo(int index) {
    final videoPlayerController =
        VideoPlayerController.network(videos[index].videos!);
    final oldController = _videoPlayerController;
    _videoPlayerController = videoPlayerController;
    if (oldController != null) {
      oldController.pause();
    }
    setState(() {});
    // ignore: avoid_single_cascade_in_expression_statements
    videoPlayerController
      ..initialize().then((_) {
        oldController?.dispose();
        _playingIndex = index;
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: true,
          looping: true,
        );
        videoPlayerController.play();
        setState(() {});
      });
  }

  buildListView(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: videos.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: GestureDetector(
                onTap: () {
                  _initializeVideo(index);
                  setState(() {
                    if (isVideoShowen == false) {
                      isVideoShowen = true;
                    }
                  });
                },
                child: Container(
                    height: 8.h,
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    padding: EdgeInsets.only(left: 3.w, top: 2.h, bottom: 2.h),
                    decoration: BoxDecoration(
                        color: ColorManager.grey2,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${index + 1} -    ${videos[index].name!}',
                          style: TextStyle(
                              color: ColorManager.black, fontSize: 14.sp),
                        ),
                        IconButton(
                            onPressed: () {
                              GallerySaver.saveVideo(
                                videos[index].videos!,
                              );
                            },
                            icon: Icon(Icons.download))
                      ],
                    ))),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 2.h,
        ),
      ),
    );
  }
}
