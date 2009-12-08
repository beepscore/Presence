//
//  PersonListViewController.h
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@class PersonDetailViewController;

@interface PersonListViewController : UITableViewController {
    // people array holds a list of peoples names.  Ref Mark pg 223, 257
    NSArray *people;    
    PersonDetailViewController *personDetailViewController;
}
@property (nonatomic, retain) NSArray *people;
@property (nonatomic, retain) IBOutlet PersonDetailViewController *personDetailViewController;

@end
