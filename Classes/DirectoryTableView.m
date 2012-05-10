//
//  RootViewController.m
//  TableView
//
//  Created by iPhone SDK Articles on 1/17/09.
//  Copyright www.iPhoneSDKArticles.com 2009. 
//

#import "DirectoryTableView.h"
#import "ReadFullArticleViewController.h"

@implementation DirectoryTableView

- (void)viewDidLoad {
    [super viewDidLoad];
	
	//Initialize the array.
	listOfItems = [[NSMutableArray alloc] init];
	phoneNumbers = [[NSMutableArray alloc] init];
	emailAddress = [[NSMutableArray alloc] init];
	webAdress = [[NSMutableArray alloc] init];
	
	//Add items
	[listOfItems addObject:@"Admissions"];
	//[listOfItems addObject:@"Alumni Affairs"];
	[listOfItems addObject:@"Athletics"];
	[listOfItems addObject:@"Benson University Center"];
	[listOfItems addObject:@"Campus Ministry"];
	[listOfItems addObject:@"Campus Recreation"];
	[listOfItems addObject:@"Career Services"];
	//[listOfItems addObject:@"Center for International Studies"];
	[listOfItems addObject:@"Counseling Center"];
	//[listOfItems addObject:@"Coy C. Carpenter Library"];
	
	[listOfItems addObject:@"Creative Services"];
	[listOfItems addObject:@"Deacon Shop"];
	[listOfItems addObject:@"Dean of Summer Sessions"];
	[listOfItems addObject:@"Dean of the College"];
	//[listOfItems addObject:@"Dining Services"];
	[listOfItems addObject:@"Facilities Management"];
	[listOfItems addObject:@"Financial Aid"];
	[listOfItems addObject:@"Financial and Accounting Services"];
	[listOfItems addObject:@"Graylyn Conference Center"];
	[listOfItems addObject:@"Human Resources"];
	[listOfItems addObject:@"Information Systems"];
	[listOfItems addObject:@"Institutional Research"];
	[listOfItems addObject:@"International Studies"];
	[listOfItems addObject:@"Multicultural Affairs"];
	[listOfItems addObject:@"Museum of Anthropology"];
	//[listOfItems addObject:@"News Service"];
	[listOfItems addObject:@"Parking Management"];
	[listOfItems addObject:@"Payroll"];
	[listOfItems addObject:@"Police"];
	//[listOfItems addObject:@"Printing Services"];
	[listOfItems addObject:@"Professional Center Library"];
	[listOfItems addObject:@"Purchasing"];
	[listOfItems addObject:@"Registrar"];
	[listOfItems addObject:@"Research and Sponsored Programs"];
	[listOfItems addObject:@"Residence Life and Housing"];
	[listOfItems addObject:@"Reynolda Gardens"];
	[listOfItems addObject:@"Reynolda House"];
	[listOfItems addObject:@"Secrest Artist Series"];
	//[listOfItems addObject:@"Student Activity Fee"];
	[listOfItems addObject:@"Student Development"];
	[listOfItems addObject:@"Student Employment"];
	[listOfItems addObject:@"Student Health"];
	[listOfItems addObject:@"Student Life"];
	[listOfItems addObject:@"Telecommunications"];
	[listOfItems addObject:@"University Center for Entrepreneurship"];
	[listOfItems addObject:@"University Counseling Center"];
	//[listOfItems addObject:@"University Police"];
	//[listOfItems addObject:@"University Stores"];
	[listOfItems addObject:@"University Theatre"];
	[listOfItems addObject:@"Volunteer Services"];
	[listOfItems addObject:@"Welcome Center"];
	[listOfItems addObject:@"WFDD 88.5"];
	[listOfItems addObject:@"WFU Press"];
	[listOfItems addObject:@"Z. Smith Reynolds Library"];

	[webAdress addObject:@"http://admissions.wfu.edu/"];
	//[webAdress addObject:@"http://alumni.wfu.edu/"];
	[webAdress addObject:@"http://www.wfu.edu/athletics/"];
	[webAdress addObject:@"http://www.wfu.edu/benson/"];
	[webAdress addObject:@"http://www.wfu.edu/chaplain/"];
	[webAdress addObject:@"http://www.wfu.edu/campusrec/"];
	[webAdress addObject:@"http://www.wfu.edu/career/"];
	//[webAdress addObject:@"http://www.wfu.edu/cis/"];
	[webAdress addObject:@"http://www.wfu.edu/ucc/"];
	//[webAdress addObject:@"http://www2.wfubmc.edu/library/"];
	[webAdress addObject:@"http://www.wfu.edu/creative/"];
	[webAdress addObject:@"http://www.deaconshop.com/"];
	[webAdress addObject:@"http://www.wfu.edu/academics/summer/contact.html"];
	[webAdress addObject:@"http://www.wfu.edu/undergraduate_college/"];
	//[webAdress addObject:@"http://www.campusdish.com/en-US/eCampus1/WakeForest/"];
	[webAdress addObject:@"http://www.wfu.edu/facilities/"];
	[webAdress addObject:@"http://www.wfu.edu/finaid/"];
	[webAdress addObject:@"http://www.wfu.edu/administration/fas/"];
	[webAdress addObject:@"http://www.graylyn.com/"];
	[webAdress addObject:@"http://www.wfu.edu/hr/"];
	[webAdress addObject:@"http://www.wfu.edu/technology/"];
	[webAdress addObject:@"http://www.wfu.edu/administration/ir/"];
	[webAdress addObject:@"http://www.wfu.edu/cis/"];
	[webAdress addObject:@"http://www.wfu.edu/campuslife/multicultural/"];
	[webAdress addObject:@"http://www.wfu.edu/academics/anthropology/museum/"];
	//[webAdress addObject:@"http://www.wfu.edu/wfunews/index.htm"];
	[webAdress addObject:@"http://www.wfu.edu/police/traffic.html"];
	[webAdress addObject:@"http://www.wfu.edu/administration/fas/payroll/"];
	[webAdress addObject:@"http://www.wfu.edu/police/"];
	//[webAdress addObject:@"http://www.wfubmc.edu/biomed/"];
	[webAdress addObject:@"http://pcl.wfu.edu/"];
	[webAdress addObject:@"http://www.wfu.edu/administration/purchasing/"];
	[webAdress addObject:@"http://www.wfu.edu/administration/registrar/"];
	[webAdress addObject:@"http://www.wfu.edu/RSP/"];
	[webAdress addObject:@"http://www.wfu.edu/housing/"];
	[webAdress addObject:@"http://www.wfu.edu/gardens/"];
	[webAdress addObject:@"http://www.reynoldahouse.org/"];
	[webAdress addObject:@"http://www.wfu.edu/organizations/secrestartists/"];
	//[webAdress addObject:@"http://www.wakestudent.com/directory/"];
	[webAdress addObject:@"http://www.wfu.edu/campuslife/development/"];
	[webAdress addObject:@"http://www.wfu.edu/admissions/finaid/employment.html"];
	[webAdress addObject:@"http://www.wfu.edu/campuslife/shs/"];
	[webAdress addObject:@"http://www.wfu.edu/campuslife/studentlife/"];
	[webAdress addObject:@"http://www.wfu.edu/technology/telecom/"];
	[webAdress addObject:@"http://entrepreneurship.wfu.edu/"];
	[webAdress addObject:@"http://www.wfu.edu/campuslife/ucc/"];
	//[webAdress addObject:@"http://www.wfu.edu/police/"];
	//[webAdress addObject:@"http://www.wakestudent.com/directory/"];
	[webAdress addObject:@"http://www.wfu.edu/theatre/univthe/unithe.htm"];
	[webAdress addObject:@"http://www.wfu.edu/campuslife/volunteer/"];
	[webAdress addObject:@"http://www.wfu.edu/visitors/welcome.html"];
	[webAdress addObject:@"http://www.wfdd.org/"];
	[webAdress addObject:@"http://www.wfu.edu/wfupress/"];
	[webAdress addObject:@"http://zsr.wfu.edu/"];


	
	[phoneNumbers addObject:@"3367585201"];
	[phoneNumbers addObject:@"800.752.8568"];
	[phoneNumbers addObject:@"NULL"];
	[phoneNumbers addObject:@"336-758-4869"];
	[phoneNumbers addObject:@"NULL"];
	[phoneNumbers addObject:@"336.758.5838"];
	[phoneNumbers addObject:@"336.758.5902"];
	[phoneNumbers addObject:@"(336) 758-5938"];
	[phoneNumbers addObject:@"336.758.5273"];
	[phoneNumbers addObject:@"336-716-4691"];
	[phoneNumbers addObject:@""];
	[phoneNumbers addObject:@""];
	[phoneNumbers addObject:@""];
	[phoneNumbers addObject:@""];
	[phoneNumbers addObject:@""];
	[phoneNumbers addObject:@""];
	[phoneNumbers addObject:@""];
	[phoneNumbers addObject:@""];
	[phoneNumbers addObject:@""];
	
	[emailAddress addObject:@"admissions@wfu.edu"];
	[emailAddress addObject:@"alumni@wfu.edu"];
	[emailAddress addObject:@"NULL"];
	[emailAddress addObject:@"bensonoa@wfu.edu"];
	[emailAddress addObject:@"chaplain@wfu.edu"];
	[emailAddress addObject:@"NULL"];
	[emailAddress addObject:@"careers@wfu.edu"];
	[emailAddress addObject:@"NULL"];
	[emailAddress addObject:@"NULL"];
	[emailAddress addObject:@""];
	[emailAddress addObject:@""];
	[emailAddress addObject:@""];
	[emailAddress addObject:@""];
	[emailAddress addObject:@""];
	[emailAddress addObject:@""];
	[emailAddress addObject:@""];
	[emailAddress addObject:@""];
	[emailAddress addObject:@""];
	[emailAddress addObject:@""];
	

	
	
	//Set the title
	self.navigationItem.title = @"Directory";
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
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listOfItems count];
}


// Customize the appearance of table view cells.
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




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	//NSString *cellValue = [listOfItems objectAtIndex:indexPath.row];
	
	NSURL *urlValue = [webAdress objectAtIndex:indexPath.row];
	
	ReadFullArticleViewController *viewController = [[ReadFullArticleViewController alloc] initWithNibName:@"readFullArticle" bundle:nil];
	viewController.articleURL = urlValue;
	[self.navigationController pushViewController:viewController animated:YES];
	[viewController release];
	
	

	/*NSLog(@"did click");
	[[UIApplication sharedApplication] openURL: [NSURL URLWithString:urlValue]];
	//[[UIApplication sharedApplication] openURL: [listValues objectAtIndex:indexPath.row]]; //[NSURL URLWithString: urlValue]; // URLWithString:@"tel://123123"]];
	NSLog(@"URL Value is: %@", urlValue);*/
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


- (void)dealloc {
	
	[listOfItems release];
    [super dealloc];
}


@end

