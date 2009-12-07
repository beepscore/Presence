//
//  PresenceAppDelegate.h
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright Beepscore LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresenceAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    
    // Add navController outlet.
    // Ref Presence 1 assignment walkthrough pg 2/7, Mark Ch09 pg 254-255
    UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@end

