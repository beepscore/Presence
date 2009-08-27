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
    NSURL *profileImageNSURL;
    NSString *displayName;
    NSString *timeZone;
    NSArray *statusUpdates;
}

@property (nonatomic, retain) NSString *twitterUserName;
@property (nonatomic, retain) NSString *displayName;
@property (nonatomic, retain) NSString *timeZone;
@property (nonatomic, retain) NSURL *profileImageNSURL;
@property (nonatomic, retain) NSArray *statusUpdates;

- (id)initForUserName:(NSString *)userName;
@end
