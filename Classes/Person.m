//
//  Person.m
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize twitterUserName;
@synthesize timeZone;
@synthesize profileImageNSURL;
@synthesize displayName;
@synthesize statusUpdates;


- (id)initForUserName:(NSString *)userName {
    // allow superclass to initialize its state first
    self = [super init];    
    if (self) {
        self.twitterUserName = userName;

        // Use convenience factory method, rely on autorelease instead of explicit release
        NSDictionary *userDictionary = [TwitterHelper fetchInfoForUsername:userName];
        // Display best name available
        if (nil == [userDictionary valueForKey:@"screen_name"]) {
            self.displayName = userName;
        }
        else {
            self.displayName = [userDictionary valueForKey:@"screen_name"];
        }
        self.timeZone = [userDictionary valueForKey:@"time_zone"];
        
        // Ref Hillegass pg 350
        NSString *profileImageURL = [userDictionary objectForKey:@"profile_image_url"];
        self.profileImageNSURL = [NSURL URLWithString:profileImageURL];
        
        // Use temp variable and explicit release.
        // Using a convenience factory method would be more concise, but would rely on autorelease.
        // Ref Mark pg 43, 184        
        NSArray *tempStatusUpdates = [[NSArray alloc]
                                      initWithObjects:@"first status update", @"second status update", nil];
        self.statusUpdates = tempStatusUpdates;
        [tempStatusUpdates release];
    }
    return self;
}


- (void)dealloc {
    [profileImageNSURL release];
    [twitterUserName release];
    [displayName release];
    [super dealloc];
}
@end
