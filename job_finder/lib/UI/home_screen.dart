import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(255.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lets Find',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Your Dream Jobs',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Search a job or position',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    size: 30,
                  )),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jobs For you',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text('See All', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _randerTopContentCard(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/dicoding.jpg'),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Text(
                              'PT Dicoding Akademi Indonesia.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 22),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Software engineering',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    _buildItemIconTitleRow(
                        icon: Icons.location_on, text: 'Bandung, Jawa barat'),
                    _buildItemIconTitleRow(
                        icon: Icons.attach_money, text: '8 - 15 jt'),
                    _buildItemIconTitleRow(
                        icon: Icons.work, text: '2 - 3 year experience'),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildLabelText('Fulltime'),
                        const SizedBox(
                          width: 15,
                        ),
                        _buildLabelText('Remote')
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 360,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5A6081),
                          side: const BorderSide(
                              color: Colors.transparent, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Apply now',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Text(
              'Recently post',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildLabelText(String text) => Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
      );

  Row _randerTopContentCard() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('1 Days ago', style: Theme.of(context).textTheme.bodyMedium),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.bookmark_border_outlined,
              size: 30,
            ),
          )
        ],
      );
  Padding _buildItemIconTitleRow(
          {IconData? icon, required String text, TextStyle? textStyle}) =>
      Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon),
              const SizedBox(
                width: 10,
              ),
              Text(text,
                  style: textStyle ?? Theme.of(context).textTheme.bodyLarge),
            ],
          ));
}
