import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sohel_app/consts/app_consts.dart';

import '../consts/routes.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/logo_widget.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder( 
            builder: (BuildContext ctx, BoxConstraints constraints) { 
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Spacer(),
                _logosWidget(context),
                Spacer(),
                _textWidget(
                    getStartedText, 28.0, FontWeight.bold, 1000.ms), // Fade in text
                SizedBox(height: 25),
                _textWidget(
                    getStartedSubText, 18.0, FontWeight.w400, 1200.ms), // Fain text
                SizedBox(height: 40),
                Spacer(),
                SizedBox(
                  width: constraints.maxWidth * (constraints.maxWidth<600?0.85:0.5),
                  child: CustomButtonWidget(
                    text: getStartedButtonText,
                    radius: 12,
                    fontSize: 16,
                    padding: EdgeInsets.all(12),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, mySubscriptionsPath);
                    },
                  ),
                )
                    .animate()
                    .slideY(
                        begin: 1,
                        end: 0,
                        duration: 500.ms,
                        delay: 1400.ms) // Slide up button
                    .fadeIn(duration: 500.ms, delay: 1400.ms), // Fade in button
                SizedBox(height: 40),
              ],
            ),
          );
        }
      ),
    );
  }

  Widget _logosWidget(BuildContext context) {
    return SizedBox(
      width:  220,
      child: Stack(
        children: [
         // Container with shadow
          Center(
            child: Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withValues(alpha: 0.3),
                    spreadRadius: 20,
                    blurRadius: 50,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ).animate().show(
                delay: Duration(
                  seconds: 1,
                ),
                duration: 500.ms,
              ),
         // Figma logo (left)
          Positioned(
            left: 20,
            top: 30,
           child: Opacity(
              opacity: 0.5,
              child:LogoWidget(size: 60,padding:8,  imagePath: figmaLogo,),
            ),
          )
              .animate()
              .show(
                delay: Duration(
                  seconds: 1,
                ),
                duration: 500.ms,
              )
              .slideX(begin: 0, end: -1, duration: 500.ms, delay: 1500.ms),
          // HBO logo (left center)
          Positioned(
            left: 45,
            top: 25,
            child: Opacity(
              opacity: 0.95,
              child: LogoWidget(size: 70, padding: 0, imagePath: hboMaxLogo,),
            ),
          )
              .animate()
              .show(
                delay: Duration(
                  seconds: 1,
                ),
                duration: 500.ms,
              )
              .slideX(begin: 0, end: -0.5, duration: 500.ms, delay: 1500.ms),

          // HBO logo (right center)
          Positioned(
            right: 45,
            top: 25,
            child: Opacity(
              opacity: 0.95,
              child: LogoWidget(size: 70, padding: 0, imagePath: hboMaxLogo,),
            ),
          )
              .animate()
              .show(
                delay: Duration(
                  seconds: 1,
                ),
                duration: 500.ms,
              )
              .slideX(begin: 0, end: 0.5, duration: 500.ms, delay: 1500.ms),
          
          // Figma logo (right)
          Positioned(
            right: 20,
            top: 30,
            child: Opacity(
              opacity: 0.5,
              child: LogoWidget(size: 60,padding: 8,  imagePath: figmaLogo,),
            ),
          )
              .animate()
              .show(
                delay: Duration(
                  seconds: 1,
                ),
                duration: 500.ms,
              )
              .slideX(begin: 0, end: 1, duration: 500.ms, delay: 1500.ms),

           // Spotify logo (center)
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: LogoWidget(size: 80, padding: 10, imagePath: spotifyLogo,),
            ),
          )
              .animate()
              .scale(duration: 500.ms) // Scale up
              .slideY(begin: 0.8, end: 0, duration: 500.ms, delay: 500.ms),
        ],
      ),
    );
  }

  Widget _textWidget(text, fontSize, FontWeight? fontWeight, delay) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: Colors.white),
    )
        .animate()
        .slideY(
            begin: 1, end: 0, duration: 500.ms, delay: delay) // Slide up text
        .fadeIn(duration: 500.ms, delay: 1000.ms);
  }
}
