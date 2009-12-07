//
//  PersonDetailViewController.m
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import "PersonDetailViewController.h"

@implementation PersonDetailViewController
@synthesize person;

- (void)viewDidLoad {
    // Ref Mark pg 269
    self.title = self.person.displayName;    
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    //self.person = nil;
    [super viewDidUnload];
}

- (void)dealloc {
    self.person = nil;
    [super dealloc];
}

#pragma mark Table view methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.person.statusUpdates count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // ????: Does this identifier need to be different from the one in PersonListViewController?
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // FIXME:  App crashes when top cell is manually scrolled off screen.
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier] autorelease];
    }

    // Set up the cell.  Ref Mark pg 258
    NSUInteger row = [indexPath row];
    
    // statusUpdates array element type is dictionary.  Dictionary key for a tweet is @"text"    
    cell.textLabel.text = [[self.person.statusUpdates objectAtIndex:row] objectForKey:@"text"];
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont systemFontOfSize: 14];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    // ref Stanford lecture 8 video 27:21
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// Specify row height.  Ref Mark pg 209
// Use UIStringDrawing methods to calculate height.  Ref Presence 2 Assignment, lecture 8 video 33:55.

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSUInteger row = [indexPath row];
    NSString *tweetString = [[self.person.statusUpdates objectAtIndex:row] objectForKey:@"text"];
    UIFont *font = [UIFont systemFontOfSize:14];
    CGSize withinSize = CGSizeMake((tableView.bounds.size.width - 20), 400);
    
    CGSize tweetSize = [tweetString
                        sizeWithFont:font
                        constrainedToSize:withinSize
                        lineBreakMode:UILineBreakModeWordWrap];
        
    return tweetSize.height + kRowVerticalPadding;
 }

@end

