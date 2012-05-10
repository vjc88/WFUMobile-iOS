//
//  rootCampusViewController.m
//  mainScreen
//
//  Created by VJ Cerniglia on 7/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "OverlayViewController.h"1
#import "rootCampusMapViewController.h"
#import "CampusMapViewController.h"
#import "MyAnnotation.h"

@implementation rootCampusMapViewController
@synthesize mapView;


- (void)viewDidLoad {
    [super viewDidLoad];
	
	//CGRect webFrame = CGRectMake(0.0, 0.0, 320.0, 460.0);
	//initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, 416)];
	mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, 375)];
	
	//mapView = [[MKMapView alloc] initWithFrame:webFrame]; //self.view.bounds];
	[self.view insertSubview:mapView atIndex:0];
	
	[mapView setMapType:MKMapTypeStandard];
	[mapView setZoomEnabled:YES];
	[mapView setScrollEnabled:YES];
	[mapView setDelegate:self];
	
	//shows users location
	[mapView setShowsUserLocation:YES];
	
	//sets the view to wake forest university so its not zoomed all the way out
	MKCoordinateRegion wakeForestLocation = { {0.0, 0.0 }, { 0.0, 0.0 } };
	wakeForestLocation.center.latitude = 36.134339;
	wakeForestLocation.center.longitude = -80.278645;
	wakeForestLocation.span.longitudeDelta = 0.013f;
	wakeForestLocation.span.latitudeDelta = 0.013f;	
	[mapView setRegion:wakeForestLocation animated:YES];
	
	
	//Initialize the array.
	listOfItems = [[NSMutableArray alloc] init];
	latArray = [[NSMutableArray alloc] init];
	lngArray = [[NSMutableArray alloc] init];
	
	countriesToLiveInArray = [NSArray arrayWithObjects:@"Anthropology Lab", @"Babcock Residence Hall", @"Benson University Center", @"BookStore", @"Bostwick Residence Hall", @"Calloway School of Business", @"Carswell Hall", @"Collins Residence Hall", @"Davis Residence Hall", @"Deacon Shop", @"Efford Residence Hall",  @"Facilities/Campus Services", @"Greene Hall", @"Haddock Golf Center", @"Huffman Residence Hall", @"Information Systems", @"Johnson Residence Hall", @"Kentner Stadium", @"Kirby Hall", @"Kitchin Residence Hall", @"Leighton Tennis Stadium", @"Luter Residence Hall", @"Manchester Athletic Center", @"Manchester Hall", @"Martin Residence Hall", @"Miller Center", @"Museum of Anthropology", @"North Campus Apartments", @"Olin Physical Laboratory", @"Palmer Residence Hall", @"Piccolo Residence Hall", @"Polo Residence Hall", @"Poteat Residence Hall", @"Pruitt Football Center", @"Freshman Parking", @"Residential Community", @"Reynolds Gymnasium", @"Reynolda Hall", @"Salem Hall", @"Scales Fine Arts Center", @"Spry Soccer Stadium", @"Starling Hall/Welcome Center", @"Student Apartments", @"Subway", @"Taylor Residence Hall", @"Tennis Courts", @"Townhouse Apartments", @"Tribble Hall", @"University Photographer", @"University Police and Parking Management", @"UPS Store", @"Wait Chapel", @"Water Tower Field",  @"WFDD Radio Station", @"Wingate Hall", @"Winston Hall", @"Worrell Professional Center", @"Z. Smith Reynolds Library", @"The Pit", @"Mag Room", @"Q Parking", nil]; 
	NSDictionary *countriesToLiveInDict = [NSDictionary dictionaryWithObject:countriesToLiveInArray forKey:@"Countries"];
	
	NSArray *latValsArray = [NSArray arrayWithObjects:@"36.134508", @"36.131343", @"36.132791", @"36.134411", @"36.132188", @"36.133607", @"36.132888", @"36.131562", @"36.133568", @"36.134287", @"36.134721", @"36.131974", @"36.1332", @"36.133001", @"36.13521", @"36.137974", @"36.13171", @"36.134578", @"36.133729", @"36.134387", @"36.13508", @"36.13099", @"36.133993", @"36.133443", @"36.13849", @"36.134149", @"36.134799", @"36.134054", @"36.132013", @"36.135505", @"36.135856", @"36.137905", @"36.135262", @"36.133781", @"36.140114", @"36.13917", @"36.134422", @"36.133573", @"36.131159", @"36.133967", @"36.138468", @"36.131224", @"36.137593", @"36.133672", @"36.134357", @"36.135033", @"36.137931", @"36.132074", @"36.132121", @"36.131792", @"36.135072", @"36.135228", @"36.136592", @"36.13518", @"36.135475",@"36.130873", @"36.13726", @"36.132087", @"36.133538", @"36.133568", @"36.136012", nil];
	//[NSArray arrayWithObjects:@"36.134508", @"36.131343", @"36.132791", @"36.134411", @"36.132188", @"36.133607", @"36.132888", @"36.131562", @"36.133568", @"36.134287", @"", @"", @"", nil];
	NSDictionary *latValsDict = [NSDictionary dictionaryWithObject:latValsArray forKey:@"Lats"];
	
	NSArray *lngValsArray = [NSArray arrayWithObjects:@"-80.273484", @"-80.276923", @"-80.2777", @"-80.278969", @"-80.275421", @"-80.276346", @"-80.275812", @"-80.27541", @"-80.278551", @"-80.277381", @"-80.279127", @"-80.272942", @"-80.276118", @"-80.273103", @"-80.278371", @"-80.27548", @"-80.276198", @"-80.2749", @"-80.276161", @"-80.277003", @"-80.276354", @"-80.277438", @"-80.275109", @"-80.276569", @"-80.281692", @"-80.274273", @"-80.273902", @"-80.282271", @"-80.278918", @"-80.272744", @"-80.272449",  @"-80.281219", @"-80.277947", @"-80.274943", @"-80.279959", @"-80.27505", @"-80.276032", @"-80.277389", @"-80.279267", @"-80.280924", @"-80.278661", @"-80.283065", @"-80.28218", @"-80.278269", @"-80.27932", @"-80.276397", @"-80.276719", @"-80.277094", @"-80.272379", @"-80.273516",@"-80.278178", @"-80.279004", @"-80.273162", @"-80.273972", @"-80.279267", @"-80.279793", @"-80.274946", @"-80.278119", @"-80.277362", @"-80.277379", @"-80.280232",  nil];
	//[NSArray arrayWithObjects:@"-80.273484", @"-80.276923", @"-80.2777", @"-80.278969", @"-80.275421", @"-80.276346", @"-80.275812", @"-80.27541", @"-80.278551", @"-80.277381", @"", @"", nil];
	NSDictionary *lngValsDict = [NSDictionary dictionaryWithObject:lngValsArray forKey:@"Lngs"];
	
	[listOfItems addObject:countriesToLiveInDict];
	[latArray addObject:latValsDict];
	[lngArray addObject:lngValsDict];
	//[lngArray addObject:lngValsDict];
	
	//Initialize the copy array.
	copyListOfItems = [[NSMutableArray alloc] init];
	
	//Set the title
	self.navigationItem.title = @"Campus Map";
	
	//Add the search bar
	self.tableView.tableHeaderView = searchBar;
	searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	searching = NO;
	
	letUserSelectRow = YES;	
	self.tableView.scrollEnabled = NO;
}

- (MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation
{
	
	printf("in the function!!!!\n");
	MKPinAnnotationView *pinView = nil;
	if(annotation != mapView.userLocation) 
	{
		pinView.animatesDrop = TRUE;
		
		static NSString *defaultPinID = @"1";
		pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
		if ( pinView == nil )
			pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
		
		pinView.pinColor = MKPinAnnotationColorGreen;
		pinView.canShowCallout = YES;
		pinView.animatesDrop = YES;
		pinView.enabled = YES;
	}
	else
	{
		[mapView.userLocation setTitle:@"You Are Here"];
	}
	
	annotation = pinView;
	
    return annotation;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	if (searching)
		return 1;
	else{
		return [listOfItems count];
	}
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (searching)
		return [copyListOfItems count];
	else {
		
		//Number of rows it should expect should be based on the section
		NSDictionary *dictionary = [listOfItems objectAtIndex:section];
		NSArray *array = [dictionary objectForKey:@"Countries"];
		return [array count]; 
		
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 25.0f;	
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	
	if(searching) 
	{
		cell.text = [copyListOfItems objectAtIndex:indexPath.row];
	}
	else {
		
		//First get the dictionary object
		NSDictionary *dictionary = [listOfItems objectAtIndex:indexPath.section];
		NSArray *array = [dictionary objectForKey:@"Countries"];
		NSString *cellValue = [array objectAtIndex:indexPath.row];
		cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0]; // boldSytemFontofSize:16]; // [UIFont systemFontOfSize:11.0];
		//myLabel.font = [UIFont boldSytemFontofSize:16];
		cell.text = cellValue; 
	}
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//Get the selected country
	
	NSString *selectedCountry = nil;
	
	if(searching) {
		selectedCountry = [copyListOfItems objectAtIndex:indexPath.row];
	}
	else {
		
		NSDictionary *dictionary = [listOfItems objectAtIndex:indexPath.section];
		//NSArray *array = [dictionary objectForKey:@"Countries"];
	}
	//Make a bunch of annotations instead of arrays
	
	//NSArray *nameArray = [NSArray arrayWithObjects:@"Anthropology Lab", @"Babcock Residence Hall", @"Benson University Center", @"BookStore", @"Bostwick Residence Hall", @"Calloway School of Business", @"Carswell Hall", @"Collins Residence Hall", @"Davis Residence Hall", @"Deacon Shop", @"Efford Residence Hall",  @"Facilities/Campus Services", @"Greene Hall", @"Haddock Golf Center", @"Hooks Baseball Stadium", @"Huffman Residence Hall", @"Information Systems", @"Johnson Residence Hall", @"Kentner Stadium", @"Kirby Hall", @"Kitchin Residence Hall", @"Leighton Tennis Stadium", @"Luter Residence Hall", @"Manchester Athletic Center", @"Manchester Hall", @"Martin Residence Hall", @"Miller Center", @"Museum of Anthropology", @"North Campus Apartments", @"Olin Physical Laboratory", @"Palmer Residence Hall", @"Piccolo Residence Hall", @"Polo Residence Hall", @"Polo Road Gate", @"Poteat Residence Hall", @"Pruitt Football Center", @"Q Parking/Freshman Parking", @"Residential Community", @"Reynolds Gymnasium", @"Reynolda Hall", @"Salem Hall", @"Scales Fine Arts Center", @"Spry Soccer Stadium", @"Starling Hall/Welcome Center", @"Student Apartments", @"Subway", @"Taylor Residence Hall", @"Tennis Courts", @"Townhouse Apartments", @"Tribble Hall", @"University Photographer", @"University Police and Parking Management", @"UPS Store", @"Wait Chapel", @"Water Tower Field",  @"WFDD Radio Station", @"Wingate Hall", @"Winston Hall", @"Worrell Professional Center", @"Z. Smith Reynolds Library", nil];
	NSArray *latValsArray = [NSArray arrayWithObjects:@"36.134508", @"36.131343", @"36.132791", @"36.134411", @"36.132188", @"36.133607", @"36.132888", @"36.131562", @"36.133568", @"36.134287", @"", @"", @"", nil];
	NSLog(@"latValsArray value is: %@ /n", [latValsArray objectAtIndex:1]);
	
	NSUInteger indexValue = [countriesToLiveInArray indexOfObject: selectedCountry]; // [animalOptions indexOfObject:@"Bear"];
	
	NSDictionary *dictionary = [listOfItems objectAtIndex:indexPath.section];
	NSDictionary *dictionaryLats = [latArray objectAtIndex:indexPath.section];
	NSDictionary *dictionaryLngs = [lngArray objectAtIndex:indexPath.section];
	
	//NSArray *array = [dictionary objectForKey:@"Countries"];
	NSArray *latitudeArray = [dictionaryLats objectForKey:@"Lats"];
	NSArray *longitudeArray = [dictionaryLngs objectForKey:@"Lngs"];
	
	//int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	//NSString *link = [storyLinks objectAtIndex: storyIndex]; //objectForKey: @"link"];
	NSString *GPSlat = [latitudeArray objectAtIndex:indexValue];
	NSString *GPSlng = [longitudeArray objectAtIndex:indexValue];
	
	lat = [GPSlat floatValue];
	lng = [GPSlng floatValue];
	
	MKCoordinateRegion buildingGPS = { {0.0, 0.0 }, { 0.0, 0.0 } };
	buildingGPS.center.latitude = lat;
	buildingGPS.center.longitude = lng;
	building = [[MyAnnotation alloc] init];
	building.title = selectedCountry; // [array objectAtIndex:indexPath.row];
	//building.subtitle = @"Next Stop: ... ";
	building.coordinate = buildingGPS.center;
	[mapView addAnnotation:building];
	
	NSIndexPath *indexPath2=[NSIndexPath indexPathForRow:0 inSection:0];	
	[self.tableView scrollToRowAtIndexPath:indexPath2 atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
	
	
	searchBar.text = @"";
	[searchBar resignFirstResponder];
	
	mapView.hidden = NO; 
	letUserSelectRow = YES;
	searching = NO;
	self.navigationItem.rightBarButtonItem = nil;
	self.tableView.scrollEnabled = NO;
	//self.mapView.scrollEnabled = YES;
	
	[ovController.view removeFromSuperview];
	[ovController release];
	ovController = nil;
	
	[self.tableView reloadData];
	
	
}

- (NSIndexPath *)tableView :(UITableView *)theTableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if(letUserSelectRow)
		return indexPath;
	else
		return nil;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	//return UITableViewCellAccessoryDetailDisclosureButton;
	return UITableViewCellAccessoryDisclosureIndicator;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	[self tableView:tableView didSelectRowAtIndexPath:indexPath];
}


#pragma mark -
#pragma mark Search Bar 


- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
	
	//This method is called again when the user clicks back from teh detail view.
	//So the overlay is displayed on the results, which is something we do not want to happen.
	if(searching)
		return;
	
	//Add the overlay view.
	if(ovController == nil)
		ovController = [[OverlayViewController alloc] initWithNibName:@"OverlayView" bundle:[NSBundle mainBundle]];
	
	CGFloat yaxis = self.navigationController.navigationBar.frame.size.height;
	CGFloat width = self.view.frame.size.width;
	CGFloat height = 200;
	
	//Parameters x = origion on x-axis, y = origon on y-axis.
	CGRect frame = CGRectMake(0, yaxis, width, height);
	ovController.view.frame = frame;	
	ovController.view.backgroundColor = [UIColor grayColor];
	ovController.view.alpha = 0.5;
	
	ovController.rvController = self;
	
	[self.tableView insertSubview:ovController.view aboveSubview:self.parentViewController.view];
	//[self.mapView insertSubview:ovController.view aboveSubview:self.parentViewController.view];
	
	searching = YES;
	letUserSelectRow = NO;
	mapView.hidden = YES; 
	self.tableView.scrollEnabled = NO;
	//self.mapView.scrollEnabled = NO;
	
	//Add the done button.
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
											   initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
											   target:self action:@selector(doneSearching_Clicked:)] autorelease];
}


- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
	
	//Remove all objects first.
	[copyListOfItems removeAllObjects];
	
	if([searchText length] > 0) {
		
		[ovController.view removeFromSuperview];
		searching = YES;
		letUserSelectRow = YES;
		self.tableView.scrollEnabled = YES;
		//self.mapView.scrollEnabled = YES;
		[self searchTableView];
	}
	else {
		
		[self.tableView insertSubview:ovController.view aboveSubview:self.parentViewController.view];
		//[self.mapView insertSubview:ovController.view aboveSubview:self.parentViewController.view];
		
		searching = NO;
		letUserSelectRow = NO;
		self.tableView.scrollEnabled = NO;
		//self.mapView.scrollEnabled = NO;
	}
	
	[self.tableView reloadData];
	//[self.mapView reloadData];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
	
	[self searchTableView];
}

- (void) searchTableView {
	
	NSString *searchText = searchBar.text;

	NSMutableArray *searchArray = [[NSMutableArray alloc] init];
	
	for (NSDictionary *dictionary in listOfItems)
	{
		NSArray *array = [dictionary objectForKey:@"Countries"];
		[searchArray addObjectsFromArray:array];
	}
	
	for (NSString *sTemp in searchArray)
	{
		NSRange titleResultsRange = [sTemp rangeOfString:searchText options:NSCaseInsensitiveSearch];
		
		if (titleResultsRange.length > 0)
			[copyListOfItems addObject:sTemp];
	}
	
	[searchArray release];
	searchArray = nil;
	
	/////////////////
	
/*	NSMutableArray *searchArrayLat = [[NSMutableArray alloc] init];
	
	for (NSDictionary *dictionaryLat in listOfItems)
	{
		NSArray *arrayLat = [dictionaryLat objectForKey:@"Countries"];
		[searchArrayLat addObjectsFromArray:arrayLat];
	}
	
	for (NSString *sTempLat in searchArrayLat)
	{
		NSRange titleResultsRange = [sTempLat rangeOfString:searchText options:NSCaseInsensitiveSearch];
		
		if (titleResultsRange.length > 0)
			[copyListOfItems addObject:sTempLat];
	}
	
	[searchArray release];
	searchArray = nil;*/
}

- (void) doneSearching_Clicked:(id)sender {
	
	searchBar.text = @"";
	[searchBar resignFirstResponder];
	
	NSIndexPath *indexPath2=[NSIndexPath indexPathForRow:0 inSection:0];	
	[self.tableView scrollToRowAtIndexPath:indexPath2 atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
	
	//self.tableView.hidden = YES;
	mapView.hidden = NO; 
	letUserSelectRow = YES;
	searching = NO;
	self.navigationItem.rightBarButtonItem = nil;
	self.tableView.scrollEnabled = NO;
	//self.mapView.scrollEnabled = YES;
	
	[ovController.view removeFromSuperview];
	[ovController release];
	ovController = nil;
	
	[self.tableView reloadData];
		//[self.mapView reloadData];
}

- (void)dealloc {
	
	[ovController release];
	[copyListOfItems release];
	[searchBar release];
	[listOfItems release];
    [super dealloc];
}


@end