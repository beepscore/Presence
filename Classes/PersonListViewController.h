//
//  PersonListViewController.h
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "PersonDetailViewController.h"

@interface PersonListViewController : UITableViewController {
    // people array holds a list of peoples names.  Ref Mark pg 223, 257
    NSArray *people;
    // TODO: Does this outlet conflict with navController in PresenceAppDelegate?
    UINavigationController *navController;
}
@property (nonatomic, retain) NSArray *people;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@end
