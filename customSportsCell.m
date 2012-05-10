//
//  customSportsCell.m
//  mainScreen
//
//  Created by VJ Cerniglia on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "customSportsCell.h"
#import "SportsRootViewController.h"


@implementation customSportsCell

@synthesize primaryLabel; //,secondaryLabel,
@synthesize myImageView;
@synthesize title;
@synthesize image;


/*- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		// Initialization code
		primaryLabel = [[UILabel alloc]init];
		primaryLabel.textAlignment = UITextAlignmentLeft;
		primaryLabel.font = [UIFont systemFontOfSize:14];
		//secondaryLabel = [[UILabel alloc]init];
		//secondaryLabel.textAlignment = UITextAlignmentLeft;
		//secondaryLabel.font = [UIFont systemFontOfSize:8];
		myImageView = [[UIImageView alloc]init];
	
		[self.contentView addSubview:primaryLabel];
		//[self.contentView addSubview:secondaryLabel];
		[self.contentView addSubview:myImageView];
		
	}
	
	return self;
	
}*/

- (void)viewWillAppear:(BOOL)animated
{
	primaryLabel.text = title;
	//myImageView.text = date;
}

/*- (void)layoutSubviews {
	
	[super layoutSubviews];
	
	CGRect contentRect = self.contentView.bounds;
	CGFloat boundsX = contentRect.origin.x;
	CGRect frame;
	
	frame= CGRectMake(boundsX+10 ,0, 50, 50);
	myImageView.frame = frame;
	frame= CGRectMake(boundsX+70 ,5, 300, 25);
	primaryLabel.frame = frame;
	//frame= CGRectMake(boundsX+70 ,30, 100, 15);
	//secondaryLabel.frame = frame;
	
}*/

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
	
}



/*- (void)drawRect:(CGRect)rect {
    // Drawing code
}*/

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	title = nil;
	image = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
