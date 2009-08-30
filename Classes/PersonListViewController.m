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
@synthesize navController;
//@synthesize myNavController;

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/

// Ref Mark pg 258, 266
- (void)viewDidLoad {
    // title displays in navigation controller bar.
    self.title = @"People";
    
    // Ref Mark pg 223, 327
    // Note TwitterUsers.plist root is an array, not a dictionary
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


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.people = nil;
    [super viewDidUnload];
}


- (void)dealloc {
    [people release];
    //[navController release];

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
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell.  Ref Mark pg 258
	NSUInteger row = [indexPath row];    
    Person *person = [[Person alloc] initForUserName:(NSString *)[self.people objectAtIndex:row]];
    cell.textLabel.text = person.displayName;

    NSData *imageData = [NSData dataWithContentsOfURL:person.profileImageNSURL];
    UIImage *img = [[UIImage alloc] initWithData:imageData];	
    cell.imageView.image = img;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // person will need to be released, but can't do it here it breaks app.
    //[person release];
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
    
    // TODO: understand how to reference PresenceAppDelegate navController property
    // http://stackoverflow.com/questions/855456/compiler-warning-not-found-in-protocols-when-using-uiapplication-sharedapp
    // http://stackoverflow.com/questions/1000560/why-does-uiapplication-sharedapplication-delegate-return-a-nil-object    
    // myNavController = (UINavigationController *)[[[UIApplication sharedApplication] delegate] navController];
    // [myNavController pushViewController:personDetailViewController animated:YES];

    [navController pushViewController:personDetailViewController animated:YES];
    
    // TODO: Don't need to release, navigation controller will pop it?
    //[personDetailViewController release];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


@end

