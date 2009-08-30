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
@synthesize displayName;
@synthesize profileImageNSURL;
@synthesize timeZone;


- (id)initForUserName:(NSString *)userName {
    // allow superclass to initialize its state first
    self = [super init];    
    if (self) {
        twitterUserName = userName;

        // Use convenience factory method, rely on autorelease.  Don't explicitly release.
        // http://apiwiki.twitter.com/Twitter-REST-API-Method:-users%C2%A0show
        NSDictionary *userDictionary = [TwitterHelper fetchInfoForUsername:userName];
        // Display the best available name
        if (nil != [userDictionary objectForKey:@"name"]) {
            displayName = [userDictionary objectForKey:@"name"];
        }
        else if (nil != [userDictionary objectForKey:@"screen_name"]) {
            displayName = [userDictionary objectForKey:@"screen_name"];
        }
        else {
            displayName = userName;
        }
        timeZone = [userDictionary objectForKey:@"time_zone"];
        
        // Ref Hillegass pg 350
        NSString *profileImageURL = [userDictionary objectForKey:@"profile_image_url"];
        profileImageNSURL = [NSURL URLWithString:profileImageURL];
        
        statusUpdates = nil;

    }
    return self;
}

// Get statusUpdates, store in person.
// http://groups.google.com/group/iphone-appdev-auditors/browse_thread/thread/d1cf4e28c864979f
-(NSArray *)statusUpdates {
    // statusUpdates array element type is dictionary.  Dictionary key for a tweet is @"text"
    statusUpdates = [TwitterHelper fetchTimelineForUsername:self.twitterUserName];
    return statusUpdates;
}


- (void)dealloc {
    [twitterUserName release];
    [displayName release];
    [profileImageNSURL release];
    [statusUpdates release];
    [timeZone release];
    [super dealloc];
}
@end
