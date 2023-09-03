import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  void _navigateToDetailPage(BuildContext context, String title) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailPage(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Space technology in the service of mankind',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset('images/logo.png'))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'images/space2.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _searchFocusNode.requestFocus();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            final searchText = _searchController.text;
                            if (searchText.isNotEmpty) {
                              _navigateToDetailPage(context, searchText);
                            }
                          },
                        ),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (searchText) {
                        if (searchText.isNotEmpty) {
                          _navigateToDetailPage(context, searchText);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 80),
                buildButtonRow(
                    context, ['Chandrayaan 3', 'ISRO', 'Adithya L1']),
                SizedBox(height: 11),
                buildButtonRow(context, ['Mangalyaan', 'Chandrayaan 2']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonRow(BuildContext context, List<String> buttons) {
    return Row(
      children: buttons.map((text) {
        return Padding(
          padding: EdgeInsets.only(right: 8),
          child: OutlinedButton(
            onPressed: () => _navigateToDetailPage(context, text),
            child: Text(text),
          ),
        );
      }).toList(),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  DetailPage(this.title);

  @override
  Widget build(BuildContext context) {
    final MissionDetail? missionDetail = missionDetails[title];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: missionDetail != null
              ? SingleChildScrollView(
                  child: Text(
                    missionDetail.description,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "HellixBold",
                    ),
                  ),
                )
              : Text(
                  'No information available',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "HellixBold",
                  ),
                ),
        ),
      ),
    );
  }
}

class MissionDetail {
  final String title;
  final String description;

  MissionDetail(this.title, this.description);
}

final Map<String, MissionDetail> missionDetails = {
  'Chandrayaan 3': MissionDetail(
    'Chandrayaan 3',
    'Chandrayaan-3 is the third mission in the Chandrayaan programme, a series of lunar-exploration missions developed by the Indian Space Research Organisation (ISRO). Launched in July 2023, the mission consists of a lunar lander named Vikram and a lunar rover named Pragyan, similar to those launched aboard Chandrayaan-2 in 2019.The propulsion module carried the lander and rover configuration till 100 km lunar orbit. The propulsion module has Spectro-polarimetry of Habitable Planet Earth (SHAPE) payload to study the spectral and Polari metric measurements of Earth from the lunar orbit.The spacecraft entered lunar orbit on 5 August, and the lander touched down in the lunar south polar region on 23 August at 12:33 UTC, making India the fourth country to successfully land on the Moon, and the first to do so near the lunar south pole.',
  ),
  'ISRO': MissionDetail(
    'ISRO',
    'Indian Space Research Organisation (ISRO) is the space agency of India. The organisation is involved in science, engineering and technology to harvest the benefits of outer space for India and the mankind ISRO is a major constituent of the Department of Space (DOS), Government of India. The department executes the Indian Space Programme primarily through various Centres or units within ISRO.ISRO was previously the Indian National Committee for Space Research (INCOSPAR), set up by the Government of India in 1962, as envisioned by Dr. VikramA Sarabhai. ISRO was formed on August 15, 1969 and superseded INCOSPAR with an expanded role to harness space technology. DOS was set up and ISRO was brought under DOS in 1972.The prime objective of ISRO/DOS is the development and application of space technology for various national needs. To fulfil this objective, ISRO has established major space systemsfor communication, television broadcasting and meteorological services; resources monitoring and management; space-based navigation services. ISRO has developed satellite launch vehicles, PSLV and GSLV, to place the satellites in the required orbits',
  ),
  'Adithya L1': MissionDetail(
    'Adithya L1',
    'Aditya L1 is the first space based Indian mission to study the Sun. The spacecraft is placed in a halo orbit around the Lagrange point 1 (L1) of the Sun-Earth system which is about 1.5 million km from the Earth. A satellite is placed in the halo orbit around the L1 point has the major advantage of continuously viewing the Sun without any occultation/eclipses. This will provide a greater advantage of observing the solar activities and its effect on space weather in real time. The spacecraft carries seven payloads to observe the photosphere, chromosphere and the outermost layers of the Sun (the corona) using electromagnetic and particle and magnetic field detectors. Using the special vantage point L1, four payloads directly view the Sun and the remaining three payloads carry out in-situ studies of particles and fields at the Lagrange point L1, thus providing important scientific studies of the propagatory effect of solar dynamics in the interplanetary medium. The suits of Aditya L1 payloads are expected to provide most crucial informations to understand the problem of coronal heating, coronal mass ejection, pre-flare and flare activities and their characteristics, dynamics of space weather, propagation of particle and fields etc.',
  ),
  'Mangalyaan': MissionDetail(
    'Mangalyaan',
    'Mars Orbiter Mission (MOM), unofficially known as Mangalyaan, India\'s first interplanetary mission to planet Mars was launched onboard PSLV-C25 on November 05, 2013 ISRO has become the fourth space agency to successfully send a spacecraft to Mars orbit.Though the designed mission life is 6 months, MOM completed 7 years in its orbit on Sept 24, 2021.The objectives of this mission are primarily technological and include design, realisation and launch of a Mars Orbiter spacecraft capable of operating with sufficient autonomy during the journey phase; Mars orbit insertion / capture and in-orbit phase around Mars. MOM carries five scientific payloads to study the Martian surface features, morphology, mineralogy and Martian atmosphere.',
  ),
  'Chandrayaan 2': MissionDetail(
    'Chandrayaan 2',
    'Chandrayaan 2 is the second lunar exploration mission developed by the Indian Space Research Organisation (ISRO), after Chandrayaan-1. It consists of a lunar orbiter, and formerly included the Vikram lander and the Pragyan rover all of which were developed in India. The main scientific objective is to map and study the variations in lunar surface composition, as well as the location and abundance of lunar water.The spacecraft was launched from the second launch pad at the Satish Dhawan Space Centre in Andhra Pradesh on 22 July 2019 at 09:13:12 UTC by a LVM3-M1 rocket. The craft reached the lunar orbit on 20 August 2019 and began orbital positioning manoeuvres for the landing of the Vikram lander. The lander and the rover were scheduled to land on the near side of the Moon, in the south polar region at a latitude of about 70° south on 6 September 2019.However, the lander crashed when it deviated from its intended trajectory while attempting to land on 6 September 2019. According to a failure analysis report submitted to ISRO, the crash was caused by a software glitch.',
  ),
};
