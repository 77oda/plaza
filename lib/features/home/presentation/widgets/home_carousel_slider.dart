import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaza/features/home/logic/banners_cubit/banners_cubit.dart';
import 'package:plaza/features/home/logic/banners_cubit/banners_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class HomeCarouselSlider extends StatelessWidget {
  const HomeCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannersCubit, BannersState>(
      builder: (context, state) {
        if (state is BannersLoadingState)
          return SizedBox(
            height: 200.h,
            width: double.infinity,
            child: Shimmer(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey, Colors.white, Colors.grey],
              ),
              child: Container(color: Colors.white),
            ),
          );
        else if (state is BannersErrorState)
          return Center(child: Text(state.error));
        else if (state is BannersSuccessState)
          return CarouselSlider(
            items:
                state.bannersModel.data!
                    .map(
                      (e) => CachedNetworkImage(
                        imageUrl: "${e.image}",
                        placeholder:
                            (context, url) => SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Shimmer(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.grey,
                                    Colors.white,
                                    Colors.grey,
                                  ],
                                ),
                                child: Container(color: Colors.white),
                              ),
                            ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                    .toList(),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              enableInfiniteScroll: true,
              height: 200.h,
              initialPage: 0,
              reverse: false,
              scrollDirection: Axis.horizontal,
              viewportFraction: 1,
            ),
          );
        else
          return const SizedBox();
      },
    );
  }
}
