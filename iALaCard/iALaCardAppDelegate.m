//
//  iALaCardAppDelegate.m
//  iALaCard
//
//  Created by Rodolfo Torres on 3/22/13.
//  Copyright (c) 2013 Rodolfo Torres. All rights reserved.
//

#import "iALaCardAppDelegate.h"
#import "aLaCardManager+Shared.h"
#import "Constants.h"

#define MAX_TIME_BETWEEN 60

@implementation iALaCardAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:CARD_NUMBER_KEY2] == nil && [[NSUserDefaults standardUserDefaults] objectForKey:CARD_NUMBER_KEY] != nil)
    {
        [[NSUserDefaults standardUserDefaults] setObject:[[NSUserDefaults standardUserDefaults] objectForKey:CARD_NUMBER_KEY] forKey:CARD_NUMBER_KEY2];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to tate in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.restore your application to its current s
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
//    if(MAX_TIME_BETWEEN > 0)
//    {
//        self.window.alpha = 0;
//    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    if(MAX_TIME_BETWEEN > 0)
//    {
//        [self smartLogIn];
//    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) smartLogIn
{
    int timeBetween = 0;
    
    NSDate *lastAccountRefresh = [[NSUserDefaults standardUserDefaults] objectForKey:LAST_REFRESH_DATE_KEY];
    
    if(lastAccountRefresh)
    {
        int minNow = [[NSCalendar currentCalendar] ordinalityOfUnit:NSMinuteCalendarUnit inUnit:NSEraCalendarUnit forDate:[NSDate date]];
        int minAccount = [[NSCalendar currentCalendar] ordinalityOfUnit:NSMinuteCalendarUnit inUnit:NSEraCalendarUnit forDate:lastAccountRefresh];
        
        timeBetween = minNow - minAccount;
    }
    
    if(timeBetween >= MAX_TIME_BETWEEN)
    {
        UIImageView *splash = [[UIImageView alloc] initWithImage:[UIImage imageNamed:(IS_IPHONE_5)? SPLASH_I5 : SPLASH_I4]];
        
        splash.frame = self.window.frame;
        
        [self.window.rootViewController.view addSubview:splash];
        
        [UIView animateWithDuration:0.5 delay:2 options: UIViewAnimationOptionTransitionNone
                         animations:^{
                             splash.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             [splash removeFromSuperview];
                         }];
    }
    self.window.alpha = 1;
}

@end
