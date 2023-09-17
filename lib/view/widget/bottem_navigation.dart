
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
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