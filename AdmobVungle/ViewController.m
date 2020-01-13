//
//  ViewController.m
//  AdmobVungle
//
//  Created by Vincent on 2020/1/11.
//  Copyright © 2020 Vincent. All rights reserved.
//

#import "ViewController.h"
#import "Constant.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}

- (void)createView {
    float screenWidth = self.view.bounds.size.width;
    float x = screenWidth/2-100;
    float y = 100;
    float btnWidth = 200;
    float btnHeight = 50;
    
    UILabel *title = [[UILabel alloc] init];
    title.frame = CGRectMake(x, y - 50, btnWidth, btnHeight);
    title.text = @"Admob + Vungle";
    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];
    
    UIButton *initBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    initBtn.frame = CGRectMake(x, y, btnWidth, btnHeight);
    [initBtn setTitle:@"init Admob" forState:UIControlStateNormal];
    [initBtn addTarget:self action:@selector(initMediation) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *loadInterstitialBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loadInterstitialBtn.frame = CGRectMake(x, y + 50, btnWidth, btnHeight);
    [loadInterstitialBtn setTitle:@"Load Interstitial" forState:UIControlStateNormal];
    [loadInterstitialBtn addTarget:self action:@selector(loadInterstitial) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *playIntersititalBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playIntersititalBtn.frame = CGRectMake(x, y + 100, btnWidth, btnHeight);
    [playIntersititalBtn setTitle:@"Play Interstitial" forState:UIControlStateNormal];
    [playIntersititalBtn addTarget:self action:@selector(playInterstitial) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *loadRewardBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loadRewardBtn.frame = CGRectMake(x, y + 150, btnWidth, btnHeight);
    [loadRewardBtn setTitle:@"Load Reward" forState:UIControlStateNormal];
    [loadRewardBtn addTarget:self action:@selector(loadReward) forControlEvents:UIControlEventTouchUpInside];

    UIButton *playRewardBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playRewardBtn.frame = CGRectMake(x, y + 200, btnWidth, btnHeight);
    [playRewardBtn setTitle:@"Play Reward" forState:UIControlStateNormal];
    [playRewardBtn addTarget:self action:@selector(playReward) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:initBtn];
    [self.view addSubview:loadInterstitialBtn];
    [self.view addSubview:playIntersititalBtn];
    [self.view addSubview:loadRewardBtn];
    [self.view addSubview:playRewardBtn];
}

# pragma mark - mediation init, load & play
- (void)initMediation {
    [[GADMobileAds sharedInstance] startWithCompletionHandler:nil];
    self.interstitial = [[GADInterstitial alloc]
                         initWithAdUnitID:interstitialPlacement];
    self.rewardedAd = [[GADRewardedAd alloc]
    initWithAdUnitID:rewardPlacement];
    self.interstitial.delegate = self;
}

- (void)loadInterstitial {
    GADRequest *request = [GADRequest request];
    [self.interstitial loadRequest:request];
}

- (void)playInterstitial {
    if (self.interstitial.isReady) {
        [self.interstitial presentFromRootViewController:self];
    } else {
       NSLog(@"interstitial wasn't ready");
   }
}

- (void)loadReward {
    GADRequest *request = [GADRequest request];
    [self.rewardedAd loadRequest:request completionHandler:^(GADRequestError * _Nullable error) {
      if (error) {
          NSLog(@"rewardedAd fail with error %@", error.localizedDescription);
      }
    }];
}

- (void)playReward {
    if (self.rewardedAd.isReady) {
        [self.rewardedAd presentFromRootViewController:self delegate:self];
    } else {
        NSLog(@"rewardedAd wasn't ready");
    }
}
    
#pragma mark - mediation interstitial delegate
- (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
  NSLog(@"interstitialDidReceiveAd %@", ad.adUnitID);
}

- (void)interstitial:(GADInterstitial *)ad
    didFailToReceiveAdWithError:(GADRequestError *)error {
  NSLog(@"interstitial %@ didFailToReceiveAdWithError: %@", ad.adUnitID, [error localizedDescription]);
}

- (void)interstitialWillPresentScreen:(GADInterstitial *)ad {
  NSLog(@"interstitialWillPresentScreen %@", ad.adUnitID);
}

- (void)interstitialWillDismissScreen:(GADInterstitial *)ad {
  NSLog(@"interstitialWillDismissScreen %@", ad.adUnitID);
}

- (void)interstitialDidDismissScreen:(GADInterstitial *)ad {
  NSLog(@"interstitialDidDismissScreen %@", ad.adUnitID);
}

- (void)interstitialWillLeaveApplication:(GADInterstitial *)ad {
  NSLog(@"interstitialWillLeaveApplication %@", ad.adUnitID);
}

#pragma mark - mediation reward delegate
- (void)rewardedAd:(GADRewardedAd *)rewardedAd userDidEarnReward:(GADAdReward *)reward {
  NSLog(@"rewardedAd %@ userDidEarnReward: %@", rewardedAd.adUnitID, reward.amount);
}

- (void)rewardedAdDidPresent:(GADRewardedAd *)rewardedAd {
  NSLog(@"rewardedAdDidPresent %@", rewardedAd.adUnitID);
}

- (void)rewardedAd:(GADRewardedAd *)rewardedAd didFailToPresentWithError:(NSError *)error {
  NSLog(@"rewardedAd %@ didFailToPresentWithError %@", rewardedAd.adUnitID, error.localizedDescription);
}

- (void)rewardedAdDidDismiss:(GADRewardedAd *)rewardedAd {
  NSLog(@"rewardedAdDidDismiss %@", rewardedAd.adUnitID);
}

@end
