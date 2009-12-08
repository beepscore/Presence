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
@synthesize statusUpdates;
@synthesize timeZone;

- (void)dealloc {
    self.twitterUserName = nil;
    self.displayName = nil;
    self.profileImageNSURL = nil;
    self.statusUpdates = nil;
    self.timeZone = nil;
    [super dealloc];
}

#pragma mark initializers
- (id)init {
  // call designated initializer
 return [self initForUserName:@"sparkfun"];
}

// designated initializer
- (id)initForUserName:(NSString *)userName {
    // call superclass' designated initializer
    self = [super init];    
    if (self) {
        self.twitterUserName = userName;

        // Use convenience factory method, rely on autorelease.  Don't explicitly release.
        // http://apiwiki.twitter.com/Twitter-REST-API-Method:-users%C2%A0show
        
        // Note: without an internet connection, the app will crash
        NSDictionary *userDictionary = [TwitterHelper fetchInfoForUsername:userName];
        // Display the best available name
        if (nil != [userDictionary objectForKey:@"name"]) {
            self.displayName = [userDictionary objectForKey:@"name"];
        } else 
            if (nil != [userDictionary objectForKey:@"screen_name"]) {
            self.displayName = [userDictionary objectForKey:@"screen_name"];
        } else {
            self.displayName = userName;
        }
        
        self.timeZone = [userDictionary objectForKey:@"time_zone"];
        
        // Ref Hillegass pg 350
        NSString *profileImageURL = [userDictionary objectForKey:@"profile_image_url"];
        self.profileImageNSURL = [NSURL URLWithString:profileImageURL];

    }
    return self;
}

#pragma mark -
// loadTimeline calls statusUpdates property setter.  Adding this fixed crash when scrolling.
// Call this only if user navigates from personListViewController to personDetailViewController.
// Ref http://groups.google.com/group/iphone-appdev-auditors/browse_thread/thread/d1cf4e28c864979f
- (void)loadTimeline {
    self.statusUpdates = [TwitterHelper fetchTimelineForUsername:self.twitterUserName];
}

@end
