//
//  ViewController.h
//  AdmobVungle
//
//  Created by Vincent on 2020/1/11.
//  Copyright © 2020 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMobileAds;

@interface ViewController : UIViewController <GADInterstitialDelegate, GADRewardedAdDelegate>

@property(nonatomic, strong) GADInterstitial *interstitial;
@property(nonatomic, strong) GADRewardedAd *rewardedAd;

- (void)createView;
- (void)initMediation;
- (void)loadInterstitial;
- (void)playInterstitial;
- (void)loadReward;
- (void)playReward;

@end

