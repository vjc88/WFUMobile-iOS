//
//  CampusMapViewController.h
//  mainScreen
//
//  Created by VJ Cerniglia on 6/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class MyAnnotation;

@interface CampusMapViewController : UIViewController <MKMapViewDelegate> {
	IBOutlet MKMapView *mapView;
	MyAnnotation *building;
	float lat;
	float lng;
	NSString *latitude;
	NSString *longitude;
	NSString *buildingName;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *longitude;
@property (nonatomic, retain) NSString *buildingName;

@end
