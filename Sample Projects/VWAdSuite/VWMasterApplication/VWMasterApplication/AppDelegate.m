//
//  AppDelegate.m
//  VWMasterApplication
//
//  Created by Christina Long on 9/25/15.
//  Copyright (c) 2015 Christina Long. All rights reserved.
//

#import "AppDelegate.h"
#import <VWAdLibrary.h>
#import <VWSplashAdView.h>

static NSString *const kPartnerKeyword = @"adsdkexample";
static NSString *const kGimbalAPIKey = @"d26e62e8-475b-4a70-b111-82b59e376592";

@interface AppDelegate () <VWSplashAdViewDelegate>

@property (strong, nonatomic) VWSplashAdView *splashAdView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[VWAdLibrary shared] setPartnerKeyword:kPartnerKeyword];
    [[VWAdLibrary shared] startGimbalProximityWithAPIKey:kGimbalAPIKey enableCommunicate:YES];
    
    self.splashAdView = [[VWSplashAdView alloc] init];
    self.splashAdView.delegate = self;
    
    [self.splashAdView loadRequest:[VWAdRequest requestWithContentCategoryID:VWContentCategoryNewsAndInformation]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Splash Ad Delegate

- (void)splashAdView:(VWSplashAdView *)splashAdView didFailToReceiveAdWithError:(NSError *)error {
    //handle didFailToReceiveAdWithError
}

- (void)splashAdViewDidReceiveAd:(VWSplashAdView *)splashAdView {
    [self.window.rootViewController.view addSubview:self.splashAdView];
}

- (void)splashAdViewShouldBeDismissed:(VWSplashAdView *)splashAdView {
    [self.splashAdView removeFromSuperview];
}

@end