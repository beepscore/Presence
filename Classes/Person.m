//
//  Person.m
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize personImage;
@synthesize twitterUserName;
@synthesize displayName;
@synthesize statusUpdates;

- (id)init {
    // allow superclass to initialize its state first
    self = [super init];
    if (self) {
        [self initWithHardcodedValues];
    }
    return self;    
}

- (id)initWithHardcodedValues {
    // allow superclass to initialize its state first
    self = [super init];    
    if (self) {
        // Use temp variable and explicit release.
        // Using a convenience factory method would be more concise, but would rely on autorelease.
        // Ref Mark pg 43, 184
        UIImage *tempPersonImage = [UIImage imageNamed:@"beepscoreIcon57.png"];
        self.personImage = tempPersonImage;
        [tempPersonImage release];
        
        NSString *tempTwitterUserName = [[NSString alloc] initWithString:@"jtwitt"];
        self.twitterUserName = tempTwitterUserName;
        [tempTwitterUserName release];

        NSString *tempDisplayName = [[NSString alloc] initWithString:@"Joe Twitt"];
        self.displayName = tempDisplayName;
        [tempDisplayName release];
        
        NSArray *tempStatusUpdates = [[NSArray alloc]
                                      initWithObjects:@"first status update", @"second status update", nil];
        self.statusUpdates = tempStatusUpdates;
        [tempStatusUpdates release];
    }
    return self;
}


- (void)dealloc {
    [personImage release];
    [twitterUserName release];
    [displayName release];
    [super dealloc];
}
@end
