
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    FacebookAudienceNetwork.init(
      testingId: "", //optional
      // iOSAdvertiserTrackingEnabled: true //default false
    );
    super.initState();
  }

  FacebookBannerAd facebookBannerAd;
  FacebookNativeAd facebookNativeAd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    try {
                      setState(() {
                        facebookBannerAd = FacebookBannerAd(
                          placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
                          bannerSize: BannerSize.STANDARD,
                          listener: (result, val) {},
                        );
                      });
                    } catch (e) {}
                  },
                  child: Text('Banner Ads')),
              ElevatedButton(
                  onPressed: () {
                    try {
                      setState(() {
                        facebookNativeAd = FacebookNativeAd(
                          adType: NativeAdType.NATIVE_AD,
                          placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
                          width: double.infinity,
                          height: 380,
                          backgroundColor: Colors.lightGreen,
                          titleColor: Colors.white,
                          descriptionColor: Colors.red,
                          listener: (result, val) {},
                        );
                      });
                    } catch (e) {}
                  },
                  child: Text('Native Ads'))
            ],
          ),
          Spacer(),
          Container(
            child: facebookBannerAd,
          ),
          SizedBox(height: 50),
          Container(
            child: facebookNativeAd,
          ),
        ],
      ),
    );
  }
}
