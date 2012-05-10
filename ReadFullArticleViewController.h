//
//  ReadFullArticleViewController.h
//  mainScreen
//
//  Created by VJ Cerniglia on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ReadFullArticleViewController : UIViewController {

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
