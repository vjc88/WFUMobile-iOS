//
//  calendarViewController.m
//  mainScreen
//
//  Created by VJ Cerniglia on 12/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "calendarViewController.h"
#include "FullArticleViewController.h"
#import "readEventViewController.h"


@implementation calendarViewController

@synthesize sportsTypeMens;
@synthesize sportsTypeWomens;
@synthesize tvCell;
@synthesize path;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.frame = CGRectMake(0.0, 0.0, 20.0, 20.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview:activityIndicator];
    
    
    // loginIndicator.hidden = FALSE;
    //	[loginIndicator startAnimating];
	
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [stories count];
}

/*- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"cccc, MMMM dd, yyyy"];
	
	NSDate *now = [[NSDate alloc] init];
	
	NSString *theDate = [dateFormat stringFromDate:now];
	
	[dateFormat release];
	[now release];
	
	return theDate;
	
	
}*/



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellOne";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"customCalendarXib" owner:self options:nil];
		
        cell = tvCell;
        self.tvCell = nil;
    }
	
	
	//NSDictionary *mDict = [self.mensList objectAtIndex:indexPath.row];
	UILabel *label;
	UILabel *labelTwo;
	UILabel *labelThree;
	UIImageView *picture;
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	
	label = (UILabel *)[cell viewWithTag:1];
	label.text = [[stories objectAtIndex: storyIndex] objectForKey: @"title"];
	
	NSDate *dateAndTime = [[stories objectAtIndex: storyIndex] objectForKey: @"date"];
	NSLog(@"The date and time are: %@", dateAndTime);
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"H:m"];
	NSString *formatTime = [dateFormat stringFromDate:dateAndTime];
	//[dateAndTime dateInFormat:@"%H:%M:%S"];
	NSLog(@"The time is: %@", formatTime);
	
	labelTwo = (UILabel *)[cell viewWithTag:2];
	labelTwo.text = dateAndTime; // [[stories objectAtIndex: storyIndex] objectForKey: @"date"];
	
	
	//picture = (UIImageView *)[cell viewWithTag:3];
	//labelThree.text = [[stories objectAtIndex: storyIndex] objectForKey: @"summary"];
	
	//labelThree = (UILabel *)[cell viewWithTag:3];
	//labelThree.text = [[stories objectAtIndex: storyIndex] objectForKey: @"summary"];
	
	
	return cell;
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 60.0f;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// Navigation logic
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	NSString *storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"];
	NSString *storyTitle = [[stories objectAtIndex: storyIndex] objectForKey: @"title"];
	NSString *storyDate = [[stories objectAtIndex: storyIndex] objectForKey: @"date"];
	NSString *storySummary = [[stories objectAtIndex: storyIndex] objectForKey: @"summary"];
	
	readEventViewController *viewController = [[readEventViewController alloc] initWithNibName:@"readEvent" bundle:nil];
	viewController.url = storyLink;
	viewController.title = storyTitle;
	viewController.date = storyDate;
	viewController.summary = storySummary;
	viewController.pictureURL = @"insert picture URL here";

	[self.navigationController pushViewController:viewController animated:YES];
	[viewController release];

}


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    [activityIndicator startAnimating];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	if ([stories count] == 0) {
	
		[self parseXMLFileAtURL:path];
		
		cellSize = CGSizeMake([newsTable bounds].size.width, 60);
		
	}
}

- (void)viewWillDisappear:(BOOL)animated {
}

- (void)viewDidDisappear:(BOOL)animated {
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{	
	NSLog(@"found file and started parsing");
	
}

- (void)parseXMLFileAtURL:(NSString *)URL
{	
	 stories = [[NSMutableArray alloc] init];
	
    NSURL *xmlURL = [NSURL URLWithString:URL];

    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [rssParser setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	
    [rssParser parse];
	
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{			
    //NSLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches...
		item = [[NSMutableDictionary alloc] init];
		currentTitle = [[NSMutableString alloc] init];
		currentDate = [[NSMutableString alloc] init];
		currentSummary = [[NSMutableString alloc] init];
		currentLink = [[NSMutableString alloc] init];
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{     
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...
		[item setObject:currentTitle forKey:@"title"];
		[item setObject:currentLink forKey:@"link"];
		[item setObject:currentSummary forKey:@"summary"];
		[item setObject:currentDate forKey:@"date"];
		
		[stories addObject:[item copy]];
		NSLog(@"adding story: %@", currentTitle);
	}
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//NSLog(@"found characters: %@", string);
	// save the characters for the current item...
	if ([currentElement isEqualToString:@"title"]) {
		[currentTitle appendString:string];
	} else if ([currentElement isEqualToString:@"link"]) {
		[currentLink appendString:string];
	} else if ([currentElement isEqualToString:@"description"]) {
		[currentSummary appendString:string];
	} else if ([currentElement isEqualToString:@"pubDate"]) {
		[currentDate appendString:string];
	} 
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	
	[activityIndicator stopAnimating];
	[activityIndicator removeFromSuperview];
	
	NSLog(@"all done!");
	NSLog(@"stories array has %d items", [stories count]);
	[newsTable reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	
	[currentElement release];
	[rssParser release];
	[stories release];
	[item release];
	[currentTitle release];
	[currentDate release];
	[currentSummary release];
	[currentLink release];
	
	[super dealloc];
}


@end

