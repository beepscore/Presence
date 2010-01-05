//
//  PersonDetailViewController.m
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import "PersonDetailViewController.h"
#import "BSGlobalValues.h"

@implementation PersonDetailViewController
@synthesize person;

- (void)dealloc {
    [person release], person = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Ref Mark pg 269
    self.title = self.person.displayName; 
    [self.person loadTimeline];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
    [super viewDidUnload];
}

#pragma mark Table view methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
    int numberOfRows = [self.person.statusUpdates count];
    DLog(@"Number of rows = %d", numberOfRows);
    return numberOfRows;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier] autorelease];
    }

    // Set up the cell.  Ref Mark pg 258
    DLog(@"Set up cell row = %d", [indexPath row]);
    NSUInteger row = [indexPath row];
    
    // statusUpdates array element type is dictionary.  Dictionary key for a tweet is @"text"    
    cell.textLabel.text = [[self.person.statusUpdates objectAtIndex:row] objectForKey:@"text"];    
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont systemFontOfSize: 14];

    return cell;
}

- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
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
        
    return tweetSize.height + K_ROW_VERTICAL_PADDING;
 }
@end

