//
//  pitMenuViewController.m
//  mainScreen
//
//  Created by V.J. Cerniglia on 4/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "pitMenuViewController.h"
#import "ReadFullArticleViewController.h"


@implementation pitMenuViewController

//@synthesize dinningHall;
@synthesize cellValue;


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
	
	
	//NSLog(@"Dining Hall Value is: %@", dinningHall);
	//NSLog(@"Cell Number Value is: %d", cellNumber);
	
	listOfItems = [[NSMutableArray alloc] init];
	webAdress = [[NSMutableArray alloc] init];
	
	//NSString *cellValue = dinningHall;
	//cellNumber = 
	
	
	if (cellValue == 0){
	//[listOfItems addObject:@"Breakfast"];
	[listOfItems addObject:@"Lunch"];
	[listOfItems addObject:@"Dinner"];
		
	//[webAdress addObject:@"http://www.campusdish.com/en-US/CSSE/WakeForest/Locations/menuFreshFoodCompany.htm?LocationName=menu%20-%20Fresh%20Food%20Company&MealID=1&OrgID=199847&ShowPrice=False&ShowNutrition=True"];
	
		//[webAdress addObject:@"http://www.campusdish.com/en-US/CSSE/WakeForest/Locations/menuFreshFoodCompany.htm?LocationName=menu%20-%20Fresh%20Food%20Company&MealID=16&OrgID=199847&ShowPrice=False&ShowNutrition=True"];
	[webAdress addObject:@"http://www.campusdish.com/en-US/CSSE/WakeForest/Locations/FreshFoodCompany.htm?LocationName=Menu%20-%20Fresh%20Food%20Company&MealID=16&OrgID=199847&ShowPrice=False&ShowNutrition=True"];
		//[webAdress addObject:@"http://www.campusdish.com/en-US/CSSE/WakeForest/Locations/menuFreshFoodCompany.htm?LocationName=menu%20-%20Fresh%20Food%20Company&MealID=17&OrgID=199847&ShowPrice=False&ShowNutrition=True"];
	[webAdress addObject:@"http://www.campusdish.com/en-US/CSSE/WakeForest/Locations/FreshFoodCompany.htm?LocationName=Menu%20-%20Fresh%20Food%20Company&MealID=17&OrgID=199847&ShowPrice=False&ShowNutrition=True"];	
		
	}
	else if(cellValue == 1){
		[listOfItems addObject:@"Lunch"];
		[webAdress addObject:@"http://www.campusdish.com/en-US/CSSE/WakeForest/Locations/menuMagnoliaRoom.htm"];
	}
	
	/*if (dinningHall = @"Pit"){
	[webAdress addObject:@"http://www.campusdish.com/en-US/CSSE/WakeForest/Locations/menuFreshFoodCompany.htm?LocationName=menu%20-%20Fresh%20Food%20Company&MealID=1&OrgID=199847&ShowPrice=False&ShowNutrition=True"];
	[webAdress addObject:@"http://www.campusdish.com/en-US/CSSE/WakeForest/Locations/menuFreshFoodCompany.htm?LocationName=menu%20-%20Fresh%20Food%20Company&MealID=16&OrgID=199847&ShowPrice=False&ShowNutrition=True"];
	[webAdress addObject:@"http://www.campusdish.com/en-US/CSSE/WakeForest/Locations/menuFreshFoodCompany.htm?LocationName=menu%20-%20Fresh%20Food%20Company&MealID=17&OrgID=199847&ShowPrice=False&ShowNutrition=True"];
	}
	else if (dinningHall = @"Magnolia Room"){
		[webAdress addObject:@"http://www.campusdish.com/en-US/CSSE/WakeForest/Locations/menuMagnoliaRoom.htm"];
	}
	else{
		NSLog(@"error");
	}*/
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSURL *urlValue = [webAdress objectAtIndex:indexPath.row];
	ReadFullArticleViewController *viewController = [[ReadFullArticleViewController alloc] initWithNibName:@"readFullArticle" bundle:nil];
	viewController.articleURL = urlValue;
	[self.navigationController pushViewController:viewController animated:YES];
	[viewController release];
	
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

