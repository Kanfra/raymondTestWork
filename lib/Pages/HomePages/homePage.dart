import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:raymond_test/Components/Text/textExtraSmall.dart';
import 'package:raymond_test/Components/Text/textLarge.dart';
import 'package:raymond_test/Components/Text/textMedium.dart';
import 'package:raymond_test/GlobalVariables/ImageStringGlobalVariables/imageStringGlobalVariables.dart';

import '../../GlobalVariables/SizeGlobalVariables/sizeGlobalVariables.dart';
import '../../GlobalVariables/globalVariables.dart';
import '../../bloc/weather_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

	Widget getWeatherIcon(int code) {
		switch (code) {
		  case >= 200 && < 300 :
		    return Image.asset(
					width: 250,
					height: 250,
					'${ImageStringGlobalVariables.imagePath}1.png'
				);
			case >= 300 && < 400 :
		    return Image.asset(
						width: 250,
						height: 250,
					'${ImageStringGlobalVariables.imagePath}2.png'
				);
			case >= 500 && < 600 :
		    return Image.asset(
						width: 250,
						height: 250,
					'${ImageStringGlobalVariables.imagePath}.png'
				);
			case >= 600 && < 700 :
		    return Image.asset(
						width: 250,
						height: 250,
					'${ImageStringGlobalVariables.imagePath}4.png'
				);
			case >= 700 && < 800 :
		    return Image.asset(
						width: 250,
						height: 250,
					'${ImageStringGlobalVariables.imagePath}5.png'
				);
			case == 800 :
		    return Image.asset(
						width: 250,
						height: 250,
					'${ImageStringGlobalVariables.imagePath}6.png'
				);
			case > 800 && <= 804 :
		    return Image.asset(
						width: 250,
						height: 250,
					'${ImageStringGlobalVariables.imagePath}7.png'
				);
		  default:
			return Image.asset(
					width: 250,
					height: 250,
				'${ImageStringGlobalVariables.imagePath}7.png'
			);
		}
	}

  @override
  Widget build(BuildContext context) {
		final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
			backgroundColor: GlobalVariables.blackColor,
			extendBodyBehindAppBar: GlobalVariables.trueValue,
			appBar: AppBar(
				backgroundColor: Colors.transparent,
				elevation: SizeGlobalVariables.zero,
				systemOverlayStyle: const SystemUiOverlayStyle(
					statusBarBrightness: Brightness.dark
				),
			),
			body: Padding(
				padding: const EdgeInsets.fromLTRB(
				SizeGlobalVariables.double_size_forty,
						SizeGlobalVariables.one_point_two * kToolbarHeight,
						SizeGlobalVariables.double_size_forty,
						SizeGlobalVariables.double_size_twenty
				),
				child: SizedBox(
					height: MediaQuery.of(context).size.height,
					child: Stack(
						children: [
							// right circular container
							Align(
								alignment: const AlignmentDirectional(
										SizeGlobalVariables.double_size_three,
										-SizeGlobalVariables.point_three_zero,
								),
								child: Container(
									height: SizeGlobalVariables.double_size_three_hundred.h,
									width: SizeGlobalVariables.double_size_three_hundred.w,
									decoration: const BoxDecoration(
										shape: BoxShape.circle,
										color: GlobalVariables.buttonColor,
									),
								),
							),
							// left circular container
							Align(
								alignment: const AlignmentDirectional(
										-SizeGlobalVariables.double_size_three,
										-SizeGlobalVariables.point_three_zero,
								),
								child: Container(
									height: SizeGlobalVariables.double_size_three_hundred.h,
									width: SizeGlobalVariables.double_size_three_hundred.w,
									decoration: const BoxDecoration(
										shape: BoxShape.circle,
										color: GlobalVariables.buttonColor,
									),
								),
							),
							// top center square container
							Align(
								alignment: const AlignmentDirectional(
										SizeGlobalVariables.zero,
										-SizeGlobalVariables.one_point_two,
								),
								child: Container(
									height: SizeGlobalVariables.double_size_three_hundred.h,
									width: SizeGlobalVariables.double_size_six_hundred.w,
									decoration: const BoxDecoration(
										color: GlobalVariables.goldColor,
									),
								),
							),
							// for blur design
							BackdropFilter(
								filter: ImageFilter.blur(
										sigmaX: SizeGlobalVariables.hundred,
										sigmaY: SizeGlobalVariables.hundred,
								),
								child: Container(
									decoration: const BoxDecoration(
											color: Colors.transparent
									),
								),
							),
							// implementation of bloc
							BlocBuilder<WeatherBloc, WeatherState>(
								builder: (context, state) {
									if(state is WeatherBlocSuccess) {
										return SizedBox(
											width: screenSize.width,
											height: screenSize.height,
											child: Column(
												crossAxisAlignment: CrossAxisAlignment.start,
												children: [
													// aix-en... text
													TextExtraSmall(
															title: '📍 ${state.weather.areaName}',
															textColor: GlobalVariables.whiteColor,
													),
													SizedBox(
															height: SizeGlobalVariables.double_size_eight.h,
													),
													// good morning text
													TextLarge(
															title: 'Good morning',
															fontWeight: FontWeight.bold,
															textColor: GlobalVariables.whiteColor,
													),
													// show weather icon type
													getWeatherIcon(state.weather.weatherConditionCode!),
													// temperature text in celsius
													Center(
														child: TextLarge(
																title: '${state.weather.temperature!.celsius!.round()}°C',
																fontWeight: FontWeight.bold,
																textColor: GlobalVariables.whiteColor,
																textSize: SizeGlobalVariables.double_size_forty.sp,
														),
													),
													// temperature description
													Center(
														child: TextLarge(
																title: state.weather.weatherMain!.toUpperCase(),
																fontWeight: FontWeight.w500,
																textColor: GlobalVariables.whiteColor,
														),
													),
													SizedBox(height: SizeGlobalVariables.double_size_five.h),
													// date format text
													Center(
														child: TextMedium(
																title: DateFormat('EEEE dd •').add_jm().format(state.weather.date!),
																fontWeight: FontWeight.w300,
																textColor: GlobalVariables.whiteColor
														),
													),
													SizedBox(height: SizeGlobalVariables.double_size_thirty.h),
													// row for top horizontal section
													Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: [
															// sunshine section
															Row(
																children: [
																	// sunshine image
																	Image.asset(
																		'${ImageStringGlobalVariables.imagePath}11.png',
																		scale: SizeGlobalVariables.double_size_eight,
																	),
																	SizedBox(width: SizeGlobalVariables.double_size_five.h),
																	// sunshine and time text
																	Column(
																		crossAxisAlignment: CrossAxisAlignment.start,
																		children: [
																			TextExtraSmall(
																					title: 'Sunshine',
																					textColor: GlobalVariables.whiteColor,
																					fontWeight: FontWeight.w300,
																			),
																			SizedBox(height: SizeGlobalVariables.double_size_three.h),
																			TextExtraSmall(
																					title: DateFormat().add_jm().format(state.weather.sunrise!),
																					textColor: GlobalVariables.whiteColor,
																					fontWeight: FontWeight.w700,
																			),
																		],
																	)
																],
															),
															// sunset section
															Row(
																children: [
																	Image.asset(
																		'${ImageStringGlobalVariables.imagePath}12.png',
																		scale: SizeGlobalVariables.double_size_eight,
																	),
																	SizedBox(width: SizeGlobalVariables.double_size_five.w,),
																	Column(
																		crossAxisAlignment: CrossAxisAlignment.start,
																		children: [
																			TextExtraSmall(
																					title: 'Sunset',
																					textColor: GlobalVariables.whiteColor,
																					fontWeight: FontWeight.w300,
																			),
																			SizedBox(height: SizeGlobalVariables.double_size_three.h),
																			TextExtraSmall(
																					title: DateFormat().add_jm().format(state.weather.sunset!),
																					textColor: GlobalVariables.whiteColor,
																					fontWeight: FontWeight.w700,
																			),
																		],
																	)
																],
															),
														],
													),
													// divider
													Padding(
														padding: EdgeInsets.symmetric(vertical: SizeGlobalVariables.double_size_five.h),
														child: const Divider(
															color: GlobalVariables.textFieldDeeperShadeColorThree,
														),
													),
													// row for bottom horizontal section
													Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: [
															// temperature max section
															Row(
																children: [
																	Image.asset(
																		'${ImageStringGlobalVariables.imagePath}13.png',
																		scale: SizeGlobalVariables.double_size_eight,
																	),
																	SizedBox(width: SizeGlobalVariables.double_size_five.w,),
																	Column(
																		crossAxisAlignment: CrossAxisAlignment.start,
																		children: [
																			TextExtraSmall(
																					title: 'Temp Max',
																					textColor: GlobalVariables.whiteColor,
																					fontWeight: FontWeight.w300,
																			),
																			SizedBox(height: SizeGlobalVariables.double_size_three.h,),
																			TextExtraSmall(
																					title: "${state.weather.tempMax!.celsius!.round()} °C",
																					textColor: GlobalVariables.whiteColor,
																					fontWeight: FontWeight.w700,
																			),
																		],
																	)
																]
															),
															// temperature min section
															Row(
																children: [
																	Image.asset(
																		'${ImageStringGlobalVariables.imagePath}14.png',
																		scale: SizeGlobalVariables.double_size_eight,
																	),
																	SizedBox(width: SizeGlobalVariables.double_size_five.w,),
																	Column(
																		crossAxisAlignment: CrossAxisAlignment.start,
																		children: [
																			TextExtraSmall(
																					title: 'Temp Min',
																					textColor: GlobalVariables.whiteColor,
																					fontWeight: FontWeight.w300,
																			),
																			SizedBox(height: SizeGlobalVariables.double_size_three.h,),
																			TextExtraSmall(
																					title: "${state.weather.tempMin!.celsius!.round()} °C",
																					textColor: GlobalVariables.whiteColor,
																					fontWeight: FontWeight.w700,
																			),
																		],
																	)
																]
															)
														],
													),
												],
											),
										);
									} else {
										return Container();
									}
								},
							)
						],
					),
				),
			),
		);
  }
}