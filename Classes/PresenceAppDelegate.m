//
//  PresenceAppDelegate.m
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright Beepscore LLC 2009. All rights reserved.
//

#import "PresenceAppDelegate.h"

@implementation PresenceAppDelegate

@synthesize window;
@synthesize navController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    // Add navigation controller view to the window.  Ref Mark pg 255
    [window addSubview: navController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [navController release];
    [super dealloc];
}


@end
