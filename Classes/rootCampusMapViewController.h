//
//  rootCampusMapViewController.h
//  mainScreen
//
//  Created by VJ Cerniglia on 7/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class OverlayViewController;
@class MyAnnotation;

@interface rootCampusMapViewController : UITableViewController <MKMapViewDelegate> {

	NSMutableArray *listOfItems;
	NSMutableArray *copyListOfItems;
	NSMutableArray *latArray;
	NSMutableArray *lngArray;
	IBOutlet UISearchBar *searchBar;
	BOOL searching;
	BOOL letUserSelectRow;
	OverlayViewController *ovController;
	IBOutlet MKMapView *mapView;
	float lat;
	float lng;
	MyAnnotation *building;
	
	NSArray *countriesToLiveInArray;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;


@end
