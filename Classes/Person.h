//
//  Person.h
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//  Person class instantiates Model objects.

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    // TODO: Use image URL instead?
    UIImage *personImage;
    NSString *twitterUserName;
    // Note: Some users may not have a display name.
    NSString *displayName;
    NSArray *statusUpdates;
}

@property (nonatomic, retain) UIImage *personImage;
@property (nonatomic, retain) NSString *twitterUserName;
@property (nonatomic, retain) NSString *displayName;
@property (nonatomic, retain) NSArray *statusUpdates;

- (id)initWithHardcodedValues;
@end
