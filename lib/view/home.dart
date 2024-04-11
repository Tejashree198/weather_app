import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding:const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40,20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF673AB7)
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFFFAB40)
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration:  const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if(state is WeatherBlocSuccess) {
                 return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:  const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${state.weather.areaName}',
                      style:TextStyle(
                        color:Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300 
                         ),
                       ),
                     SizedBox(height: 30),
                    Text(
                      'good morning',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Image.assets(
                        'sunrise.png',
                       ),
                        Center(
                        child: Text(
                         '${state.weather.temperature!= null? state.weather.temperature!.round().toString() : 'N/A'}C',
                           style: TextStyle(
                        color:Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                        ),
                        ),
                       ),
                        Center(
                        child: Text(
                          state.weather.weatherMain!.toUpperCase(),
                           style: TextStyle(
                        color:Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                        ),
                        ),
                       ),
                       SizedBox(height:5),
                    Center(
                        child: Text(
                         DateFormat('EEEE dd *').add_jm().format(state.weather.date!) ,
                           style: TextStyle(
                        color:Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w300
                        ),
                        ),
                       ),
                    SizedBox(height:3),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children:[
                    Image.E:\weather_app\assests(
                      'image to be inserted',
                      scale:8,
                    ),
                    SizedBox(width:5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sunrise',
                      style:TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.w300 
                         ),
                       ),
                     SizedBox(height: 3),
                    Text(
                     DateFormat().add_jm().format(state.weather.sunrise!) , 
                      style: TextStyle(
                        color:Colors.white,
                       fontWeight: FontWeight.w700
                      ),
                     ),
                    ],
                   )
                  ],
                 ),
                  Row(
                      children:[
                    Image.E:\weather_app\assests(
                      'assests/12.png',
                      scale:8,
                    ),
                    SizedBox(width:5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sunset',
                      style:TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.w300 
                         ),
                       ),
                     SizedBox(height: 3),
                    Text(
                      DateFormat().add_jm().format(state.weather.sunset!) ,
                      style: TextStyle(
                        color:Colors.white,
                       fontWeight: FontWeight.w700
                      ),
                     ),
                    ],
                   )
                  ],
                 ),
                 Padding(
                  padding: EdgeInsets.symmetric(vertical:5.0),
                  child: Divider(
                    color: Colors.grey,
                    ),
                    ),
                     Row(
                      children:[
                    Image.E:\weather_app\assests(
                      'image to be inserted',
                      scale:8,
                    ),
                    SizedBox(width:5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Temp Max',
                      style:TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.w300 
                         ),
                       ),
                     SizedBox(height: 3),
                    Text(
                      state.weather.tempMax,
                      style: TextStyle(
                        color:Colors.white,
                       fontWeight: FontWeight.w700
                      ),
                     ),
                    ],
                   )
                  ],
                 ),
                  Row(
                      children:[
                    Image.assest(
                      'image to be inserted',
                      scale:8,
                    ),
                    SizedBox(width:5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Temp min',
                      style:TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.w300 
                         ),
                       ),
                     SizedBox(height: 3),
                    Text(
                      '18degree c',
                      style: TextStyle(
                        color:Colors.white,
                       fontWeight: FontWeight.w700
                      ),
                     ),
                    ],
                   )
                  ],
                 ),
                 Padding(
                  padding: EdgeInsets.symmetric(vertical:5.0),
                  child: Divider(
                    color: Colors.grey,
                  ),
                    ),
                  ],
                )
              ],
             ),
              );
          }else{
            return Container();
             }
            }
         
        ),
  
    ]),
  );)
}}
  
