//
//  donateMoney.h
//  WFUMobile
//
//  Created by V.J. Cerniglia on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface donateMoney : UIViewController {
	IBOutlet UIWebView *webView;
	IBOutlet UIActivityIndicatorView *loginIndicator;
	NSString *articleURL;
	UIActivityIndicatorView *spinner;
}

@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) NSString *articleURL;
@property (nonatomic, retain) UIActivityIndicatorView *loginIndicator;

-(void)webViewDidFinishLoad:(UIWebView *)webView;
-(void)webViewDidStartLoad:(UIWebView *)webView;

@end