import 'package:flutter/material.dart';
import 'package:musify/core/const/colors.dart';
import 'package:musify/core/const/string.dart';
import 'package:musify/core/const/widget.dart';
import 'package:musify/view/home_section/home_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SearchPageTextFormField(screenWidth: screenWidth),
          RecentSearch(screenWidth: screenWidth),
          PopularGeneres(screenWidth: screenWidth),
          hightSpace20,
          const BottemNavigationBar()
        ],
      )),
    );
  }
}

class PopularGeneres extends StatelessWidget {
  const PopularGeneres({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Popular Generes',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: screenWidth * 0.46,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 18, 18, 18),
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                        opacity: 0.6,
                        image: NetworkImage(homeHeaderImage),
                        fit: BoxFit.fill),
                  ),
                  child: const Center(
                    child: Text('Rock'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentSearch extends StatelessWidget {
  const RecentSearch({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      height: screenWidth * 0.72,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Recent Searches',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Clear',
                onTap: () {},
              )
            ],
          ),
          Column(
            children: List.generate(
              4,
              (index) => ListTile(
                dense: true,
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
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchPageTextFormField extends StatelessWidget {
  const SearchPageTextFormField({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.72,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 54, 54, 54),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'SearchResultScreen');
                    },
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
                widthSpace10,
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    cursorHeight: 29,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Icon(
            Icons.notifications,
            size: 28,
            color: primaryIconsColor,
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
