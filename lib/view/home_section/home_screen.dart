import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musify/core/const/colors.dart';
import 'package:musify/core/const/string.dart';
import 'package:musify/core/const/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const HomeHeader(),
            HomeExplore(screenWidth: screenWidth),
            hightSpace20,
            const HomePopularSongs()
          ],
        ),
      )),
      bottomNavigationBar:const BottemNavigationBar(),
    );
  }
}

class BottemNavigationBar extends StatelessWidget {
  const BottemNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.one_x_mobiledata,
      Icons.pause,
      Icons.save,
      Icons.forward
    ];
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      width: double.infinity,
      color: const Color.fromARGB(255, 49, 48, 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            4,
            (index) => Icon(
                  icons[index],
                  color: Colors.white,
                  size: 32,
                )),
      ),
    );
  }
}

class HomePopularSongs extends StatelessWidget {
  const HomePopularSongs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Popular Songs',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          hightSpace10,
          Column(
            children: List.generate(
              3,
              (index) => ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(homeHeaderImage),
                ),
                title: Text(
                  'Cali lIving',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text(
                  'Alma',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeExplore extends StatelessWidget {
  const HomeExplore({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Discover Music',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              InkWell(
                child: Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                      color: primaryButtonColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      'Explore',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              )
            ],
          ),
          hightSpace10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => Container(
                width: screenWidth * 0.29,
                height: screenWidth * 0.34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                      image: NetworkImage(homeHeaderImage), fit: BoxFit.fill),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(207, 174, 88, 231),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hip-Hop',
                          style: GoogleFonts.ubuntu(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryTextColor),
                        ),
                        Text(
                          'EDM',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          Text(
            'Good afternoon,Comensec',
            style: GoogleFonts.ubuntu(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: primaryTextColor),
          ),
          const Spacer(),
          Icon(
            Icons.headphones,
            color: primaryTextColor,
          ),
          widthSpace10,
          const CircleAvatar(
            backgroundImage: NetworkImage(homeHeaderImage),
          )
        ],
      ),
    );
  }
}
