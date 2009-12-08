//
//  Person.h
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//  Person class instantiates Model objects.

#import <Foundation/Foundation.h>
#import "TwitterHelper.h"

@interface Person : NSObject {
    NSString *twitterUserName;
    NSString *displayName;
    NSURL *profileImageNSURL;
    NSArray *statusUpdates;
    NSString *timeZone;
}

@property (nonatomic, retain) NSString *twitterUserName;
@property (nonatomic, retain) NSString *displayName;
@property (nonatomic, retain) NSURL *profileImageNSURL;

// statusUpdates array element type is dictionary.  Dictionary key for a tweet is @"text"
@property (nonatomic, retain) NSArray *statusUpdates;
@property (nonatomic, retain) NSString *timeZone;

// designated initializer
- (id)initForUserName:(NSString *)userName;

- (void)loadTimeline;

@end
