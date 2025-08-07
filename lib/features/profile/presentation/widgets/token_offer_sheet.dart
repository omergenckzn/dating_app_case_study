import 'dart:ui';

import 'package:dating_app/core/global_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dating_app/core/assets/assets.gen.dart';
import 'package:dating_app/core/theme/dating_app_color.dart';

class TokenOfferContent extends StatefulWidget {
  const TokenOfferContent({Key? key}) : super(key: key);

  @override
  State<TokenOfferContent> createState() => _TokenOfferContentState();
}

class _TokenOfferContentState extends State<TokenOfferContent> {
  @override
  Widget build(BuildContext context) {
    final colors = context.datingAppColor;
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 200.w, // glow çapı
                  height: 100.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: context.datingAppColor.primaryBrandColor,
                        blurRadius: 100, // blur’un ne kadar yumuşak olduğu
                        spreadRadius: 40, // glow’un ne kadar yayıldığı
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  12.verticalSpace,
                  const TokenOfferHeader(),
                  // Perks panel with inner blur
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          gradient: RadialGradient(
                            colors: [
                              Colors.white.withValues(alpha: 0.1),
                              Colors.white.withValues(alpha: 0.03),
                            ],
                          ),
                          border: BoxBorder.all(
                            color: Colors.white.withValues(alpha: 0.1),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Alacağınız Bonuslar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            12.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _PerkItem(
                                    icon: Assets.icons.gemPng,
                                    label: 'Premium Hesap'),
                                _PerkItem(
                                    icon: Assets.icons.doubleheart,
                                    label: 'Daha Fazla\nEşleşme'),
                                _PerkItem(
                                    icon: Assets.icons.cuteArrow,
                                    label: 'Öne\nÇıkarma'),
                                _PerkItem(
                                    icon: Assets.icons.hearth,
                                    label: 'Daha Fazla\nBeğeni'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  21.verticalSpace,

                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        'Kilidi açmak için bir jeton paketi seçin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  16.verticalSpace,
                  SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _TokenCard(
                            original: '200',
                            amount: '330',
                            discount: '+10%',
                            price: '₺99,99',
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF6F060B), Color(0xFFE50914)],
                            ),
                            onTap: () {},
                          ),
                          12.horizontalSpace,
                          _TokenCard(
                            original: '2.000',
                            amount: '3.375',
                            discount: '+70%',
                            price: '₺799,99',
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF5949E6), Color(0xFFE50914)],
                            ),
                            onTap: () {},
                          ),
                          12.horizontalSpace,
                          _TokenCard(
                            original: '1.000',
                            amount: '1.350',
                            discount: '+35%',
                            price: '₺399,99',
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF6F060B), Color(0xFFE50914)],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  32.verticalSpace,
                  PrimaryButton(text: 'Tüm Jetonları Gör', onPressed: () async {}),
                  SizedBox(height: 17.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TokenOfferHeader extends StatelessWidget {
  const TokenOfferHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: 16.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sınırlı Teklif',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          4.verticalSpace,
          Text(
            'Jeton paketini seçerek bonus kazanın ve\nyeni bölümlerin kilidini açın!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12.sp,
              height: 1.4,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class RedBlurBehindColumn extends StatelessWidget {
  const RedBlurBehindColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        elevation: 40, // gölgenin “yukarı” çıkma yüksekliği
        shadowColor: Colors.red.withOpacity(0.8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 1) Kırmızı dolgu
              Positioned.fill(
                child: Container(color: Colors.red.withOpacity(0.6)),
              ),

              // 2) Blur efekti
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 216.25,
                    sigmaY: 216.25,
                  ),
                  child: Container(color: Colors.transparent),
                ),
              ),

              // 3) Glow katmanı
              Positioned.fill(
                child: Container(color: Colors.red.withOpacity(0.2)),
              ),

              // 4) İçerik
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Sınırlı Teklif',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Jeton paketini seçerek bonus kazanın ve\nyeni bölümlerin kilidini açın!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        height: 1.4,
                        fontWeight: FontWeight.w400,
                      ),
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
}

class _PerkItem extends StatelessWidget {
  const _PerkItem({required this.icon, required this.label});
  final AssetGenImage icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56.w,
          height: 56.w,
          decoration: const BoxDecoration(
            color: Color(0xFF6F060B),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 2,
              ),
            ],
          ),
          child: Center(child: icon.image(height: 32.h)),
        ),
        8.verticalSpace,
        SizedBox(
          width: 70,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}

class _TokenCard extends StatelessWidget {
  const _TokenCard({
    required this.original,
    required this.amount,
    required this.discount,
    required this.price,
    required this.gradient,
    required this.onTap,
  });
  final String original, amount, discount, price;
  final LinearGradient gradient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.scale(
              scale: 1,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 111.w,
                  height: 240,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 1.w),
                  decoration: BoxDecoration(
                    gradient: gradient,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.4),
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      30.verticalSpace,
                      Text(
                        original,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        amount,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          height: 0.8,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Jeton',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        price,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Başına haftalık',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            top: 10,
            child: Container(
              height: 25,
              width: 61,
              decoration: BoxDecoration(
                color: gradient.colors.first,
                borderRadius: BorderRadius.circular(22.r),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 4,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  discount,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
