//
//  CampusMapViewController.m
//  mainScreen
//
//  Created by VJ Cerniglia on 6/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CampusMapViewController.h"
#import "MyAnnotation.h"


@implementation CampusMapViewController

@synthesize mapView;
@synthesize latitude;
@synthesize longitude;
@synthesize buildingName;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/




// Implement loadView to create a view hierarchy programmatically, without using a nib.
//- (void)loadView {
	// Set the map view up how we want to see it

		/*// Get a reference to the Map View, just to simplify the code here
		MKMapView *theMapView = (MKMapView *)self.view;
		
		// Create the initial region
		CLLocationCoordinate2D coord; coord.latitude = -27.469623; coord.longitude = 153.020824;
		MKCoordinateSpan span = MKCoordinateSpanMake(kSpanLevel, kSpanLevel);
		MKCoordinateRegion region = MKCoordinateRegionMake(coord, span);
		[theMapView setRegion:[theMapView regionThatFits:region] animated:YES];
		
		// Set up the view
		theMapView.zoomEnabled = YES;
		theMapView.scrollEnabled = YES;
		theMapView.delegate = self;
		theMapView.showsUserLocation = YES;
		theMapView.mapType = [[Preferences sharedPreferences] mapType];
		
		// Add annotations
		[theMapView addAnnotations:[Preferences sharedPreferences].cameraList];
	*/
//}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	[super viewDidLoad];
	
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
	
	lat = [latitude floatValue];
	lng = [longitude floatValue];
	
	NSLog(@"Longitude is: %f", lng);
	NSLog(@"Latitude is: %f", lat);
	
	MKCoordinateRegion buildingGPS = { {0.0, 0.0 }, { 0.0, 0.0 } };
	buildingGPS.center.latitude = lat;
	buildingGPS.center.longitude = lng;
	building = [[MyAnnotation alloc] init];
	building.title = buildingName;
	//building.subtitle = @"Next Stop: ... ";
	building.coordinate = buildingGPS.center;
	[mapView addAnnotation:building];

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
		//pinView.image = @"bus.png";
		pinView.image = [UIImage imageNamed: @"bus.png"];
		
		UIImage *image = [UIImage imageNamed:@"./bus.png"];
		UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
		pinView.leftCalloutAccessoryView = imgView;
		//pinView.image = image;
	}
	else
	{
		[mapView.userLocation setTitle:@"You Are Here"];
	}
	
	annotation = pinView;
	
    return annotation;
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
	[mapView release];
    [super dealloc];
}


@end
