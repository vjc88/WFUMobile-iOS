//
//  CampusMapViewController.h
//  mainScreen
//
//  Created by VJ Cerniglia on 6/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import "TapDetectingImageView.h"


@interface CampusMapViewController : UIViewController <UIScrollViewDelegate, TapDetectingImageViewDelegate> {
    UIScrollView *imageScrollView;
}

@end
