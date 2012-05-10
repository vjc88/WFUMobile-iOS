
#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>


@interface MyAnnotation : NSObject <MKAnnotation> 
{
	
	//creates the 2D coordinate (longitude and latitude)
	CLLocationCoordinate2D coordinate;
	//name of bus
	NSString *title;
	//bus' next stop
	NSString *subtitle;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
