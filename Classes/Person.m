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
@synthesize personImageURLString;
@synthesize personImageURL;
@synthesize displayName;
@synthesize statusUpdates;


- (id)initForUserName:(NSString *)userName {
    // allow superclass to initialize its state first
    self = [super init];    
    if (self) {
        self.twitterUserName = userName;

        // TODO: these 2 lines cause crash or hang blocking waiting for data?
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
        self.personImageURLString = [userDictionary objectForKey:@"profile_image_url"];
        self.personImageURL = [NSURL URLWithString:personImageURLString];
        NSLog(self.personImageURLString);
        
        // TODO: Why does this statement cause a problem?
        //[userDictionary release];
        
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
    [personImageURLString release];
    [personImageURL release];
    [twitterUserName release];
    [displayName release];
    [super dealloc];
}
@end
