import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:shophoria/core/colors_managers.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key, required this.banners});

  final List<dynamic> banners;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: SizedBox(
        width: double.infinity,
        height: size.height * .25,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              banners[index],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: banners.length,
          pagination: SwiperPagination(alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(activeColor: ColorsManagers.primaryBlue)
          ),
        ),
      ),
    );
  }
}
