//
//  PersonDetailViewController.h
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonDetailViewController : UITableViewController {
    Person *person;
}
@property (nonatomic, retain) Person *person;
@end
