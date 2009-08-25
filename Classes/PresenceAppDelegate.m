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


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
