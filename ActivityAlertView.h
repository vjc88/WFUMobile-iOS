//
//  ActivityAlertView.h
//  WakeMobile
//
//  Created by V.J. Cerniglia on 9/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ActivityAlertView : UIAlertView
{
	UIActivityIndicatorView *activityView;
}

@property (nonatomic, retain) UIActivityIndicatorView *activityView;

- (void) close;

@end
