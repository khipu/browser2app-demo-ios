//
//  AppDelegate.m
//  Browser2AppDemo
//
//  Created by Iván Galaz-Jeria on 10/7/16.
//  Copyright © 2016 khipu. All rights reserved.
//

#import "AppDelegate.h"
#import <khenshin/khenshin.h>

// EJEMPLO PARA PAGOS GENERADOS CON API khipu
//#define KH_AUTOMATON_API_URL @"https://khipu.com/app/2.0"
//#define KH_CEREBRO_URL @"https://khipu.com/cerebro"

// EJEMPLO PARA B2A CMR
#define KH_AUTOMATON_API_URL @"https://cmr.browser2app.com/api/automata/"
#define KH_CEREBRO_URL @"https://cmr.browser2app.com/api/automata/"

#import "PaymentProcessHeader.h"
#import "WarningViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self configureKhenshin];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) configureKhenshin {
    
    [KhenshinInterface initWithNavigationBarCenteredLogo:[UIImage imageNamed:@"Bar Logo"]
                               NavigationBarLeftSideLogo:[[UIImage alloc] init]
                                         automatonAPIURL:[self safeURLWithString:KH_AUTOMATON_API_URL]
                                           cerebroAPIURL:[self safeURLWithString:KH_CEREBRO_URL]
                                           processHeader:(UIView<ProcessHeader>*)[self processHeader]
                                          processFailure:nil
                                          processSuccess:nil
                                          processWarning:(UIViewController<ProcessExit>*)[self warningViewController]
                                  allowCredentialsSaving:NO
                                         mainButtonStyle:KHMainButtonFatOnForm
                         hideWebAddressInformationInForm:NO
                                useBarCenteredLogoInForm:NO
                                          principalColor:[self principalColor]
                                    darkerPrincipalColor:[self darkerPrincipalColor]
                                          secondaryColor:[self secondaryColor]
                                   navigationBarTextTint:[self navigationBarTextTint]
                                                    font:[UIFont fontWithName:@"Avenir Next Condensed" size:15.0f]];
    
    [KhenshinInterface setPreferredStatusBarStyle:UIStatusBarStyleLightContent];
}

- (UIViewController*) warningViewController {
    
    WarningViewController *warningViewController = [[WarningViewController alloc] initWithNibName:@"Warning"
                                                                                           bundle:[NSBundle mainBundle]];
    
    return warningViewController;
}

- (UIView*) processHeader {
    
    PaymentProcessHeader *processHeaderObj =    [[[NSBundle mainBundle] loadNibNamed:@"PaymentProcessHeader"
                                                                               owner:self
                                                                             options:nil]
                                                 objectAtIndex:0];
    
    //    return nil;
    return processHeaderObj;
}

- (UIColor*) principalColor {
    
    //    return [UIColor colorWithRed:1.0
    //                           green:0.0
    //                            blue:16.0/255.0
    //                           alpha:1.0];
    return [UIColor lightGrayColor];
}

- (UIColor*) darkerPrincipalColor {
    
    //    return [UIColor colorWithRed:137.0/255.0
    //                           green:0.0
    //                            blue:255.0/255.0
    //                           alpha:1.0];
    return [UIColor darkGrayColor];
}

- (UIColor*) secondaryColor {
    
    //    return [UIColor colorWithRed:50.0/255.0
    //                           green:1.0
    //                            blue:77.0/255.0
    //                           alpha:1.0];
    return [UIColor redColor];
}

- (UIColor*) navigationBarTextTint {
    
    return [UIColor whiteColor];
}




- (NSURL *) safeURLWithString:(NSString *)URLString {
    
    return [NSURL URLWithString:[URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
}
@end
