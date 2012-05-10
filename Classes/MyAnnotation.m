
#import "MyAnnotation.h"


@implementation MyAnnotation

@synthesize coordinate, title, subtitle;

-(void)dealloc 
{
	[title release];
	[subtitle release];
	[super dealloc];
}

@end
