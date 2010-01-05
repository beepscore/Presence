//
//  PresenceAppDelegate.m
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright Beepscore LLC 2009. All rights reserved.
//

#import "PresenceAppDelegate.h"
#import "PersonListViewController.h"

@implementation PresenceAppDelegate

@synthesize window;
@synthesize navController;

- (void)dealloc {
    [window release], window = nil;
    [navController release], navController = nil;
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    // Add navigation controller view to the window.  Ref Mark pg 255
    [window addSubview: navController.view];

    PersonListViewController *personListViewController = 
        [[PersonListViewController alloc] initWithNibName:@"PersonListViewController" 
                                               bundle:[NSBundle mainBundle]];
    
    // Push person list onto the root of the navigation controller stack.
    // navController will retain pushed view controller
    [navController pushViewController:personListViewController animated:YES];

    [personListViewController release];

    [window makeKeyAndVisible];
}
@end
