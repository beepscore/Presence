//
//  PersonListViewController.h
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PersonListViewController : UITableViewController {
    // people array will hold instances of Person.  Ref Mark pg 257
    NSArray *people;
}
@property (nonatomic, retain) NSArray *people;
@end
