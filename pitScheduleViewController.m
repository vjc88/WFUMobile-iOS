//
//  pitScheduleViewController.m
//  mainScreen
//
//  Created by V.J. Cerniglia on 4/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "pitScheduleViewController.h"
#import "pitMenuViewController.h"


@implementation pitScheduleViewController


#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	[super viewDidLoad];
	listOfItems = [[NSMutableArray alloc] init];
	
	[listOfItems addObject:@"Pit"];
	//[listOfItems addObject:@"Magnolia Room"];
	
	//[webAdress addObject:@"http://admissions.wfu.edu/"];
	//[webAdress addObject:@"https://alumni.wfu.edu/"];

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


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [listOfItems count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	NSString *cellValue = [listOfItems objectAtIndex:indexPath.row];
	cell.text = cellValue;
    
    return cell;
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


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	

	int cellPosition = [indexPath indexAtPosition: [indexPath length] - 1];
	/*if (cellPosition == 0) {
		
	}
	else if (cellPosition == 1) {
		
	}*/
	/*NSLog(@"cell Position is: %d", cellPosition);
	//int cellPosition = indexPath.row;
	NSString *selectedCell = [listOfItems objectAtIndex:indexPath.row];
	cellValue = 0;
	if (selectedCell = @"Pit") {
		cellValue = 1;
	}
	if (selectedCell = @"Magnolia Room"){
		cellValue = 2;
	}
	//NSLog(@"Cell Value is: %@", cellValue);
	//NSLog(@"Cell Name is: %@", selectedCell);
	 */
	pitMenuViewController *detailViewController = [[pitMenuViewController alloc] init];
	//detailViewController.dinningHall = selectedCell;
	detailViewController.cellValue = cellPosition;
	//selectedCell = @"";
	//[cellValue release];
	//[selectedCell release];
	//NSLog(@"Cell index path row is: %@", cellPosition);
	/*if ([listOfItems objectAtIndex:indexPath.row] = @"Pit"){
		detailViewController.dinningHall = @"pit";
		NSLog(@"Named Cell Pit");
	}
	else if ([listOfItems objectAtIndex:indexPath.row] = @"Magnolia Room"){
		detailViewController.dinningHall = @"mag";
		NSLog(@"Named Cell Magnolia Room");
	}
	else {
		NSLog(@"Error");
	}*/
	[self.navigationController pushViewController:detailViewController animated:YES];
	[pitMenuViewController release];
	 
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

