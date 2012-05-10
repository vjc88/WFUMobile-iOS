//
//  mainCampusMapViewController.m
//  mainScreen
//
//  Created by VJ Cerniglia on 12/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "OverlayViewController.h"
#import "mainCampusMapViewController.h"


@implementation mainCampusMapViewController
@synthesize mapView;


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	listOfItems = [[NSMutableArray alloc] init];
	
	NSArray *countriesToLiveInArray = [NSArray arrayWithObjects:@"Anthropology Lab", @"Babcock Residence Hall", @"Benson University Center", @"BookStore", @"Bostwick Residence Hall", @"Calloway Center", @"Carswell Hall", @"Collins Residence Hall", @"Davis Residence Hall", @"Deacon Shop", @"Efford Residence Hall",  @"Facilities/Campus Services", @"Greene Hall", @"Haddock Golf Center", @"Hooks Baseball Stadium", @"Huffman Residence Hall", @"Information Systems", @"Johnson Residence Hall", @"Kentner Stadium", @"Kirby Hall", @"Kitchin Residence Hall", @"Leighton Tennis Stadium", @"Luter Residence Hall", @"Manchester Athletic Center", @"Manchester Hall", @"Martin Residence Hall", @"Miller Center", @"Museum of Anthropology", @"North Campus Apartments", @"Olin Physical Laboratory", @"Palmer Residence Hall", @"Piccolo Residence Hall", @"Polo Residence Hall", @"Polo Road Gate", @"Poteat Residence Hall", @"Pruitt Football Center", @"Q Parking/Freshman Parking", @"Residential Community", @"Reynolds Gymnasium", @"Reynolda Hall", @"Salem Hall", @"Scales Fine Arts Center", @"Spry Soccer Stadium", @"Starling Hall/Welcome Center", @"Student Apartments", @"Subway", @"Taylor Residence Hall", @"Tennis Courts", @"Townhouse Apartments", @"Tribble Hall", @"University Photographer", @"University Police and Parking Management", @"UPS Store", @"Wait Chapel", @"Water Tower Field",  @"WFDD Radio Station", @"Wingate Hall", @"Winston Hall", @"Worrell Professional Center", @"Z. Smith Reynolds Library", nil]; 
	NSDictionary *countriesToLiveInDict = [NSDictionary dictionaryWithObject:countriesToLiveInArray forKey:@"Countries"];
	
	[listOfItems addObject:countriesToLiveInDict];
	
	//Initialize the copy array.
	copyListOfItems = [[NSMutableArray alloc] init];
	
	//Set the title
	self.navigationItem.title = @"Campus Map";
	
	//Add the search bar
	//self.tableView.tableHeaderView = searchBar;
	
	searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	
	searching = NO;
	letUserSelectRow = YES;
	
}


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
}


- (void)dealloc {
    [super dealloc];
}


@end
