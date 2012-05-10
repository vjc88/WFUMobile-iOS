//
//  mainCampusMapViewController.h
//  mainScreen
//
//  Created by VJ Cerniglia on 12/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class OverlayViewController;

@interface mainCampusMapViewController : UIViewController <MKMapViewDelegate> {
	
	NSMutableArray *listOfItems;
	NSMutableArray *copyListOfItems;
	IBOutlet UISearchBar *searchBar;
	BOOL searching;
	BOOL letUserSelectRow;
	OverlayViewController *ovController;
	IBOutlet MKMapView *mapView;

}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;


- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;

@end
