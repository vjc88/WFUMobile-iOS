    //
//  winViewController.m
//  WFUMobile
//
//  Created by V.J. Cerniglia on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "winViewController.h"


@implementation winViewController

@synthesize articleURL;
@synthesize loginIndicator;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	webView.delegate = self;
	loginIndicator.hidden = FALSE;
	[loginIndicator startAnimating];
	
	articleURL = @"http://win.wfu.edu/";
	//articleURL = [articleURL stringByReplacingOccurrencesOfString:@" " withString:@""];
	//articleURL = [articleURL stringByReplacingOccurrencesOfString:@"\n" withString:@""];
	//articleURL = [articleURL stringByReplacingOccurrencesOfString:@"	" withString:@""];
	
	NSURL *url = [NSURL URLWithString:articleURL];
	
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//Load the request in the UIWebView.
	[webView loadRequest:requestObj];
	
	NSLog(@"viewdidload");
	
	//loginIndicator.hidden = TRUE;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
	//NSLog(@"begining load");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
	loginIndicator.hidden = TRUE;
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	loginIndicator.hidden = TRUE;
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];	
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	loginIndicator.hidden = TRUE;
}


- (void)dealloc {
    [super dealloc];
}


@end
