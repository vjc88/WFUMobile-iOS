//
//  newsViewController.m
//  mainScreen
//
//  Created by VJ Cerniglia on 12/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "newsViewController.h"
#import "FullArticleViewController.h"
#import "ReadFullArticleViewController.h"
#import "mainNewsViewController.h"


@implementation newsViewController

@synthesize sportsTypeMens;
@synthesize sportsTypeWomens;
@synthesize tvCell;
@synthesize path;
@synthesize loginIndicator;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.frame = CGRectMake(0.0, 0.0, 20.0, 20.0);
    activityIndicator.center = self.view.center;
    [self.view addSubview:activityIndicator];
    
    
   // loginIndicator.hidden = FALSE;
//	[loginIndicator startAnimating];
	
}

/*-(void)webViewDidFinishLoad:(UIWebView *)webView {
	loginIndicator.hidden = TRUE;
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    loginIndicator.hidden = TRUE;
}*/


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [stories count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellOne";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"customNewsCell" owner:self options:nil];
		
        cell = tvCell;
		
		//cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		
        self.tvCell = nil;
		
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		//cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
	
	
	//NSDictionary *mDict = [self.mensList objectAtIndex:indexPath.row];
	UILabel *label;
	UILabel *labelTwo;
	UILabel *labelThree;
	UIImageView *picture;
	
	UIImageView *pictureLabel;
	
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	
	label = (UILabel *)[cell viewWithTag:1];
	label.text = [[stories objectAtIndex: storyIndex] objectForKey: @"title"];
	
	labelTwo = (UILabel *)[cell viewWithTag:2];
	labelTwo.text = [[stories objectAtIndex: storyIndex] objectForKey: @"date"];
	
	NSString *theURL = [[stories objectAtIndex: storyIndex] objectForKey:@"currentPicture"];
	NSData *picData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:theURL]];
	UIImage *thePic = [[UIImage alloc] initWithData:picData];
	
	pictureLabel = (UIImageView *)[cell viewWithTag:4];
	pictureLabel.contentMode = UIViewContentModeScaleAspectFill;
	pictureLabel.image = thePic;
	
	//labelThree = (UILabel *)[cell viewWithTag:3];
	//labelThree.text = [[stories objectAtIndex: storyIndex] objectForKey: @"summary"];
	
	
	//picture code - waiting for implementation
	/*picture = (UIImageView *)[cell viewWithTag:4];
	 NSString *imagePath = [mDict objectForKey:kImageKey];
	 UIImage *theImage = [UIImage imageNamed:imagePath]; 
	 picture.image = theImage;*/
	
	
    
	/* //old  // Configure the cell.
	 int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	 cell.textLabel.text = [[stories objectAtIndex: storyIndex] objectForKey: @"title"];
	 cell.detailTextLabel.text = [[stories objectAtIndex: storyIndex] objectForKey: @"date"];
	 UIImage *theImage = [UIImage imageNamed:@"soccer.jpg"];
	 cell.imageView.image = theImage; */
	
	
	/*int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	 [cell setText:[[stories objectAtIndex: storyIndex] objectForKey: @"summary"]];
	 
	 NSDictionary *mDict = [self.mensList objectAtIndex:indexPath.row];
	 cell.textLabel.text = [mDict objectForKey:kTitleKey];
	 cell.detailTextLabel.text = [mDict objectForKey:kTitleKey];
	 
	 UIImage *theImage = [UIImage imageNamed:@"soccer.jpg"];
	 cell.imageView.image = theImage;*/
	
	
	return cell;
	
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	return 85.0f;
	
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    


	
	
	// Navigation logic
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	NSString *storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"];
	NSString *storyTitle = [[stories objectAtIndex: storyIndex] objectForKey: @"title"];
	NSString *storyDate = [[stories objectAtIndex: storyIndex] objectForKey: @"date"];
	NSString *storySummary = [[stories objectAtIndex: storyIndex] objectForKey: @"summary"];
	NSString *picName = [[stories objectAtIndex: storyIndex] objectForKey: @"currentPicture"];
	NSLog(@"pic name: %@\n", picName);
	
	
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
	viewController.pictureURL = picName;
	[self.navigationController pushViewController:viewController animated:YES];
	[viewController release];
	
	// open in Safari
	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:storyLink]];
}


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    [activityIndicator startAnimating];
    
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
		
		
		//NSString * path = @"http://www.wfu.edu/news/rss/topstories/"; 
		[self parseXMLFileAtURL:path];
		/*else if ( sportsTypeMens == @"Football" ){ NSString * path = @"http://wakeforestsports.cstv.com/sports/m-footbl/headline-rss.xml"; [self parseXMLFileAtURL:path];}
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
		*/
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
		currentPicture = [[NSMutableString alloc] init];
	}
	if ([elementName isEqualToString:@"media:content"]){
		//pictureLength = [[attributeDict objectForKey:@"length"] floatValue];
		currentPicture = [attributeDict objectForKey:@"url"];
		pictureType = [attributeDict objectForKey:@"type"];
		
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
		[item setObject:currentPicture forKey:@"currentPicture"];
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
	} else if ([currentElement isEqualToString:@"media:text"]) {
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

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	//loginIndicator.hidden = TRUE;
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

