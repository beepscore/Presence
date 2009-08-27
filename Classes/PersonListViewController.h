//
//  PersonListViewController.h
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonListViewController : UITableViewController {
    // names array holds a list of peoples names.  Ref Mark pg 223, 257
    NSArray *names;
}
@property (nonatomic, retain) NSArray *names;
@end
