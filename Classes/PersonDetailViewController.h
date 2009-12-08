//
//  PersonDetailViewController.h
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#define kRowVerticalPadding 20

@interface PersonDetailViewController : UITableViewController {
    NSString *userNameKey;
    Person *person;
}
@property (nonatomic, copy) NSString *userNameKey;
@property (nonatomic, retain) Person *person;

@end
