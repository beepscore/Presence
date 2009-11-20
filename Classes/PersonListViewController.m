//
//  PersonListViewController.m
//  Presence
//
//  Created by Steve Baker on 8/24/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import "PersonListViewController.h"

@implementation PersonListViewController
@synthesize people;


// Ref Mark pg 258, 266
- (void)viewDidLoad {
    // title displays in navigation controller bar.
    self.title = @"People";
    
    // Ref Mark pg 223, 327
    // Note TwitterUsers.plist is an array, not a dictionary
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"TwitterUsers" ofType:@"plist"];
    
    // Use temp variable and explicit release.
    // Using a convenience factory method would be more concise, but would rely on autorelease.
    // Ref Mark pg 43, 184    
    NSArray *tempPeopleArray = [[NSArray alloc] initWithContentsOfFile:plistPath];    
    self.people = tempPeopleArray;
    [tempPeopleArray release];

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
    //self.people = nil;
    [super viewDidUnload];
}

- (void)dealloc {
    [people release];
    [super dealloc];
}

#pragma mark -
#pragma mark Table View methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Ref Mark pg 258
    return [people count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *PersonCellIdentifier = @"PersonCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PersonCellIdentifier];
    
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:PersonCellIdentifier] autorelease];
    }
    
    // Set up the cell.  Ref Mark pg 258
	NSUInteger row = [indexPath row];
    
    // TODO: where to release this?  Using autorelease or releasing in this method breaks app.
    Person *person = [[Person alloc] initForUserName:(NSString *)[self.people objectAtIndex:row]];
    
    cell.textLabel.text = person.displayName;

    NSData *imageData = [NSData dataWithContentsOfURL:person.profileImageNSURL];
    UIImage *img = [[UIImage alloc] initWithData:imageData];	
    cell.imageView.image = img;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [img release];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PersonDetailViewController *personDetailViewController = 
        [[PersonDetailViewController alloc] initWithNibName:@"PersonDetailView" bundle:nil];

	// set detail view person based on selected row
    NSUInteger row = [indexPath row];
    personDetailViewController.person = 
        [[Person alloc] initForUserName:(NSString *)[self.people objectAtIndex:row]];
    
    // Push detail view controller
    if ( [self.parentViewController respondsToSelector:@selector(pushViewController: animated:)] ) {
        [(UINavigationController *)self.parentViewController pushViewController:personDetailViewController animated:YES];        
    } else {
        NSLog(@"parentViewController doesn't respond to pushViewController: animated:");
    }
    // TODO: Release to balance alloc.  Navigation controller will pop to balance push.
    [personDetailViewController release];
}

@end

