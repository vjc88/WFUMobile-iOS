//
//  mainNewsViewController.m
//  mainScreen
//
//  Created by VJ Cerniglia on 12/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "mainNewsViewController.h"
#import "newsViewController.h"
#import "FullArticleViewController.h"


@implementation mainNewsViewController





- (void)viewDidLoad {
	    [super viewDidLoad];
 // Add the following line if you want the list to be editable
 // self.navigationItem.leftBarButtonItem = self.editButtonItem;
 self.navigationController.title = @"News";
	
	listOfItems = [[NSMutableArray alloc] init];
	storyLinks = [[NSMutableArray alloc] init];
	
	[listOfItems addObject:@"Window on Wake Forest"];
	//[listOfItems addObject:@"News Service"];
	//[listOfItems addObject:@"Wake Student"];
	
	[storyLinks addObject:@"/"];
	//[storyLinks addObject:@"http://newscenter.blogs.wfu.edu/feed/"];
	//[storyLinks addObject:@"http://wakestudent.com/?feed=rss2"];
	//[storyLinks addObject:@"http://www.wakestudent.com/assets/rss/home.rss.php"];
 
 }


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [listOfItems count];
}


/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
 static NSString *MyIdentifier = @"MyIdentifier";
 
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
 if (cell == nil) {
 cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
 cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
 }
 
 // Set up the cell
 
 int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
 [cell setText:[[stories objectAtIndex: storyIndex] objectForKey: @"title"]];
 
 return cell;
 }*/

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
	
	newsViewController *myController = [[newsViewController alloc] initWithNibName:@"newsMain" bundle:nil];
	myController.path = link; // @"http://www.wfu.edu/news/rss/topstories/";
	[self.navigationController pushViewController:myController animated:YES];
	[myController release];
	
	
	// Navigation logic
	/*int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	NSString *storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"];
	NSString *storyTitle = [[stories objectAtIndex: storyIndex] objectForKey: @"title"];
	NSString *storyDate = [[stories objectAtIndex: storyIndex] objectForKey: @"date"];
	NSString *storySummary = [[stories objectAtIndex: storyIndex] objectForKey: @"summary"];
	
	
	
	// clean up the link - get rid of spaces, returns, and tabs...
	//storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
	//storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
	//storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
	//NSLog(@"link: %@", storyLink);
	
	FullArticleViewController *viewController = [[FullArticleViewController alloc] initWithNibName:@"fullArticle" bundle:nil];
	viewController.url = storyLink;
	viewController.title = storyTitle;
	viewController.date = storyDate;
	viewController.summary = storySummary;
	[self.navigationController pushViewController:viewController animated:YES];
	[viewController release];*/
	
	// open in Safari
	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:storyLink]];
}

/*
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	//NSLog(sportsType);
	//sportsType = @"Baseball";
	if ([stories count] == 0) {
		//NSString * path = @"http://feeds.feedburner.com/TheAppleBlog";
		//NSString * path = @"feed://wakeforestsports.cstv.com/sports/m-footbl/headline-rss.xml";
		//if ([SportsViewController.menuList objectForKey:baseballController]){ 
		//NSString *path = @"feed://www.wfu.edu/news/rss/topstories/"; 
		//[self parseXMLFileAtURL:path];
		
		
		NSString * path = @"http://www.wfu.edu/news/rss/topstories/"; 
		[self parseXMLFileAtURL:path];
		else if ( sportsTypeMens == @"Football" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/m-footbl/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeMens == @"Golf" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/m-golf/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeMens == @"Soccer" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/m-soccer/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeMens == @"Tennis" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/m-tennis/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeMens == @"Track" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/m-track/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeMens == @"Cross Country" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/m-xc/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeWomens == @"Basketball" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/w-baskbl/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeWomens == @"Field Hockey" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/w-fieldh/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeWomens == @"Golf" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/w-golf/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeWomens == @"Soccer" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/w-soccer/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeWomens == @"Tennis" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/w-tennis/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeWomens == @"Track" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/w-track/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeWomens == @"Volleyball" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/w-volley/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 else if ( sportsTypeWomens == @"Cross Country" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/w-xc/headline-rss.xml"; [self parseXMLFileAtURL:path];}
		 
		// else ( NSLog(@"Error, could not find the parsing file!!!"));
		
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
	
    //you must then convert the path to a proper NSURL or it won't work
    NSURL *xmlURL = [NSURL URLWithString:URL];
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
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

 */

- (void)dealloc {
	
	
	[super dealloc];
}


@end

