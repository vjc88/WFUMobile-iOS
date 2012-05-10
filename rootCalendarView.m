//
//  rootCalendarView.m
//  mainScreen
//
//  Created by VJ Cerniglia on 7/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "rootCalendarView.h"
#import "calendarViewController.h"


@implementation rootCalendarView

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.navigationController.title = @"News";
	
	listOfItems = [[NSMutableArray alloc] init];
	storyLinks = [[NSMutableArray alloc] init];
	
	//Cell Name
	[listOfItems addObject:@"WakeSync Calendar"];
	//[listOfItems addObject:@"WakeStudent Calendar"];

	
	//Link to Calendar RSS feed
	//[storyLinks addObject:@"http://www.wakestudent.com/assets/rss/cal.rss.php"];
	[storyLinks addObject:@"http://wakeforest.orgsync.com/feed/upcoming_events"];
	//[storyLinks addObject:@"https://orgsync.com/calendar/user/rss/217926/40c2da8c2f9183be62fd86ce6b6f574a0bde1a9b"];
	//[storyLinks addObject:@"http://wakestudent.com/?feed=rss2"];
	
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [listOfItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
    // Set up the cell...
	NSString *cellValue = [listOfItems objectAtIndex:indexPath.row];
	cell.text = cellValue;
	
	return cell;
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 75.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	NSString *link = [storyLinks objectAtIndex: storyIndex]; //objectForKey: @"link"];
	
	calendarViewController *myController = [[calendarViewController alloc] initWithNibName:@"newsMain" bundle:nil];
	myController.path = link; // @"http://www.wfu.edu/news/rss/topstories/";
	[self.navigationController pushViewController:myController animated:YES];
	[myController release];
	
}

- (void)dealloc {
	[super dealloc];
}


@end

