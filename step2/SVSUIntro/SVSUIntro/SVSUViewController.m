//
//  SVSUViewController.m
//  SVSUIntro
//
//  Created by Brian Munzenberger on 3/16/12.
//  Copyright (c) 2012 Detroit Labs. All rights reserved.
//

#import "SVSUViewController.h"
#import "SVSUMoviesFetcher.h"

@interface SVSUViewController ()

@end

@implementation SVSUViewController {
	NSArray *movies;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	movies = [SVSUMoviesFetcher movies];
	NSLog(@"%@", movies);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
