import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lock_screen/main.dart';
import 'package:lock_screen/utils/loadibg_dialog.dart';
import 'package:lock_screen/view/HomePage/home_controll.dart';
import 'package:lock_screen/view/NewPage/new_page.dart';

class AdManager {
  RewardedAd? _rewardedAd;

  HomeController homeController = Get.put(HomeController());

  loadAd(BuildContext context, String index) {
    showLoadingDialog();
    RewardedAd.load(
        adUnitId: "ca-app-pub-3940256099942544/5224354917",
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            hideLoadingDialog(context: context);
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  // Dispose the ad here to free resources.
                  ad.dispose();
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
                  // Dispose the ad here to free resources.
                  ad.dispose();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NewPage(),
                    ),
                  );
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});

            // Keep a reference to the ad so you can show it later.
            _rewardedAd = ad;
            _rewardedAd!.show(onUserEarnedReward:
                (AdWithoutView ad, RewardItem rewardItem) async {
              await sharedPreferences.setBool("Lock$index", true);
              if (index == "1") {
                homeController.Lock1.value = true;
              } else {
                homeController.Lock2.value = true;
              }
            });
          },

          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            hideLoadingDialog(context: context);
          },
        ));
  }
}
