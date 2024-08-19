import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> jobList = [
    {
      'nama_perusahaan': 'PT Dicoding Akademi Indonesia',
      'title_job': 'Software engineering',
      'location': 'Bandung, Jawa barat',
      'gaji': '8 - 15 jt',
      'experience': '2 - 5',
      'type_work': ['Fulltime', 'Remote', 'Onsite'],
      'logo': 'assets/images/dicoding.jpg'
    },
    {
      'nama_perusahaan': 'PT Shopee International Indonesia',
      'title_job': 'Backend engineering',
      'location': 'Jakarta, Indonesia',
      'gaji': '8 - 15 jt',
      'experience': '2 - 5',
      'type_work': ['Fulltime', 'Remote', 'Onsite'],
      'logo': 'assets/images/shopee.png'
    },
    {
      'nama_perusahaan': 'PT Linkedin',
      'title_job': 'Backend engineering',
      'location': 'Jakarta, Indonesia',
      'gaji': '8 - 15 jt',
      'experience': '2 - 5',
      'type_work': ['Fulltime', 'Remote', 'Onsite'],
      'logo': 'assets/images/LinkedIn.png'
    },
    {
      'nama_perusahaan': 'PT GoTo Gojek Tokopedia Tbk.',
      'title_job': 'Backend engineering',
      'location': 'Jakarta, Indonesia',
      'gaji': '8 - 15 jt',
      'experience': '2 - 5',
      'type_work': ['Fulltime', 'Remote', 'Onsite'],
      'logo': 'assets/images/gojek.png'
    },
    {
      'nama_perusahaan': 'Google',
      'title_job': 'Backend engineering',
      'location': 'Singapore',
      'gaji': '30 - 50 jt',
      'experience': '2 - 5',
      'type_work': ['Fulltime', 'Remote', 'Onsite'],
      'logo': 'assets/images/google.png'
    },
    {
      'nama_perusahaan': ' PT. Tokopedia.',
      'title_job': 'Backend engineering',
      'location': 'Jakarta, Indonesia',
      'gaji': '8 - 15 jt',
      'experience': '2 - 5',
      'type_work': ['Fulltime', 'Remote', 'Onsite'],
      'logo': 'assets/images/tokopedia.png'
    },
    {
      'nama_perusahaan': ' Grab',
      'title_job': 'Backend engineering',
      'location': 'Jakarta, Indonesia',
      'gaji': '8 - 15 jt',
      'experience': '2 - 5',
      'type_work': ['Fulltime', 'Remote', 'Onsite'],
      'logo': 'assets/images/grab.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
          builder:  (BuildContext context, BoxConstraints constraints) {
            final isLargeScreen = constraints.maxWidth > 800;
            return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(isLargeScreen),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jobs For you',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text('See All',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  buildCardJobsForYou(isLargeScreen),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Recently post',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  buildListRecentlyPost(isLargeScreen)
                ],
              ),
            ),
                  );
          }
        ),
    );
  }

  Widget _buildHeader(bool isLargeScreen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lets Find',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: isLargeScreen ? 50 : 40,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      size: 30,
                    )),
              )
            ],
          ),
          Text(
            'Your Dream Jobs',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: isLargeScreen ? 45 : 38,
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
    );
  }

  Widget buildListRecentlyPost(bool isLargeScreen) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: jobList.length,
        itemBuilder: (context, int index) {
          final item = jobList[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: CircleAvatar(
                       radius: isLargeScreen ? 40 : 30,
                      backgroundImage: AssetImage(item['logo']),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['nama_perusahaan'],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 14),
                          ),
                          Text(
                            item['title_job'],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: isLargeScreen ? 22 : 20, fontWeight: FontWeight.w700),
                          ),
                          _buildItemIconTitleRow(
                              icon: Icons.location_on, text: item['location']),
                          _buildItemIconTitleRow(
                              icon: Icons.attach_money, text: item['gaji']),
                          _buildItemIconTitleRow(
                              icon: Icons.work,
                              text: '${item['experience']} year experience'),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: _buildLabelText('Fulltime'),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: _buildLabelText('Remote'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget buildCardJobsForYou(bool isLargeScreen) {
    return SizedBox(
      height: isLargeScreen ? 480 : 450,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          itemCount: jobList.length,
          itemBuilder: (context, int index) {
            final item = jobList[index];
            return SizedBox(
              width: isLargeScreen ? 370 : 370,
              child: Card(
                color: const Color(0xFFCFD2E4),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _randerTopContentCard(),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                             radius: isLargeScreen ? 40 : 30,
                              backgroundImage: AssetImage(item['logo']),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Text(item['nama_perusahaan'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize:  isLargeScreen ? 24 : 20,),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  maxLines: 2),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          item['title_job'],
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: isLargeScreen ? 22 : 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      _buildItemIconTitleRow(
                          icon: Icons.location_on, text: item['location']),
                      _buildItemIconTitleRow(
                          icon: Icons.attach_money, text: item['gaji']),
                      _buildItemIconTitleRow(
                          icon: Icons.work,
                          text: '${item['experience']} year experience'),
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
                          width: isLargeScreen ? 370 : 360,
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
            );
          }),
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
          padding: const EdgeInsets.only(top: 8.0,left: 12),
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
