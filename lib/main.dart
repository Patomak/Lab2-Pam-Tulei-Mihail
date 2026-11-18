import 'package:flutter/material.dart';

const green = Color(0xff18c968),
    ink = Color(0xff17181e),
    muted = Color(0xff838b9e);
void main() => runApp(const FitnessApp());

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});
  @override
  Widget build(BuildContext c) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Arial', useMaterial3: true),
    home: const Home(),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  String filter = 'All Type';
  void go() => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const Detail()),
  );
  @override
  Widget build(BuildContext c) => Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 19, 0, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Friday, 20 May', style: TextStyle(color: muted)),
                      SizedBox(height: 7),
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 24),
                  width: 49,
                  height: 49,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xffe1e5ec)),
                  ),
                  child: const Icon(Icons.notifications_none),
                ),
              ],
            ),
            const SizedBox(height: 29),
            Container(
              margin: const EdgeInsets.only(right: 24),
              height: 82,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xff101116),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Challenge",
                          style: TextStyle(color: Color(0xffb7bbc5)),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Running',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        width: 52,
                        height: 52,
                        child: CircularProgressIndicator(
                          value: .75,
                          color: green,
                          backgroundColor: Color(0xff4a4d55),
                          strokeWidth: 5,
                        ),
                      ),
                      const Text(
                        '15/20',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            head('Featured Plan'),
            const SizedBox(height: 17),
            SizedBox(
              height: 144,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  plan(go),
                  const SizedBox(width: 16),
                  plan(null, small: true),
                ],
              ),
            ),
            const SizedBox(height: 27),
            head('Workout Programs'),
            const SizedBox(height: 17),
            SizedBox(
              height: 33,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ['All Type', 'Pilates', 'Cardio', 'Boxing', 'Yoga']
                    .map(
                      (x) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          label: Text(x),
                          selected: filter == x,
                          onSelected: (_) => setState(() => filter = x),
                          selectedColor: green,
                          labelStyle: TextStyle(
                            color: filter == x ? Colors.white : muted,
                          ),
                          side: BorderSide(
                            color: filter == x
                                ? green
                                : const Color(0xffdce1e9),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 183,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  work('Yoga', 'assets/images/gym_training_hero.png', go),
                  const SizedBox(width: 16),
                  work(
                    'Arm\nStrengthening',
                    'assets/images/massive_upper_body.png',
                    null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
  Widget head(String x) => Padding(
    padding: const EdgeInsets.only(right: 24),
    child: Row(
      children: [
        Expanded(
          child: Text(
            x,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          'See All',
          style: TextStyle(color: green, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
  Widget plan(VoidCallback? tap, {bool small = false}) => InkWell(
    onTap: tap,
    child: SizedBox(
      width: small ? 170 : 296,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/massive_upper_body.png',
              fit: BoxFit.cover,
            ),
            Container(color: Colors.black.withValues(alpha: .22)),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    small ? 'Muscle Plan' : 'Massive Upper Body',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 9),
                  const Text(
                    '⚖  5 week  •  4x/week',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const Spacer(),
                  Container(
                    height: 32,
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Start Now',
                      style: TextStyle(color: Colors.white),
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
  Widget work(String title, String image, VoidCallback? tap) => InkWell(
    onTap: tap,
    child: SizedBox(
      width: 156,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xc9000000)],
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 38,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Positioned(
              left: 16,
              bottom: 13,
              child: Text(
                '♨ 210 kcl    ◷ 120 min',
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class Detail extends StatelessWidget {
  const Detail({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
    body: Column(
      children: [
        SizedBox(
          height: 350,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/gym_training_hero.png',
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 62,
                left: 24,
                child: CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(c),
                  ),
                ),
              ),
              const Positioned(
                top: 67,
                right: 23,
                child: Icon(Icons.more_vert, color: Colors.white, size: 29),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.star, color: Color(0xffffbb3d), size: 19),
                    SizedBox(width: 7),
                    Text('4.5'),
                    Text(' (1,232 reviews)', style: TextStyle(color: muted)),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Mid City Gym Training',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'California, New York',
                  style: TextStyle(color: muted),
                ),
                const SizedBox(height: 15),
                const Divider(),
                const SizedBox(height: 15),
                const Text(
                  'Lorem ipsum dolor sit amet consectetur. Blandit\nvitae aliquet eros laoreet quam sollicitudin. Duis non\neu habitant id vel nisi eget amet tellus...',
                  style: TextStyle(color: muted, height: 1.5),
                ),
                const SizedBox(height: 17),
                const Text(
                  'Amenities',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 17),
                const Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            '🚿  Showers',
                            style: TextStyle(color: muted),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            '▤  Lockers',
                            style: TextStyle(color: muted),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Divider(),
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total', style: TextStyle(color: muted)),
                          Text(
                            '\$69.00 /week',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 156,
                      height: 52,
                      child: FilledButton(
                        style: FilledButton.styleFrom(backgroundColor: green),
                        onPressed: () => ScaffoldMessenger.of(c).showSnackBar(
                          const SnackBar(
                            content: Text('Your training session is reserved!'),
                          ),
                        ),
                        child: const Text('Reserve'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
