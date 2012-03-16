//
//  SVSUMovieDetailsViewControllerViewController.m
//  SVSUIntro
//
//  Created by Brian Munzenberger on 3/16/12.
//  Copyright (c) 2012 Detroit Labs. All rights reserved.
//

#import "SVSUMovieDetailsViewController.h"
#import "SVSUMovie.h"

@interface SVSUMovieDetailsViewController ()

@end

@implementation SVSUMovieDetailsViewController

@synthesize movie;

@synthesize titleLabel;
@synthesize yearLabel;
@synthesize genreLabel;
@synthesize runtimeLabel;
@synthesize directorLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	self.titleLabel.text = self.movie.title;
	self.yearLabel.text = [NSString stringWithFormat:@"Released: %i", self.movie.year];
	self.genreLabel.text = [NSString stringWithFormat:@"Genre: %@", self.movie.genre];
	self.runtimeLabel.text = [NSString stringWithFormat:@"Runtime: %i mins", self.movie.runtime];
	self.directorLabel.text = [NSString stringWithFormat:@"Dir: %@", self.movie.director];
}

- (void)viewDidUnload
{
	[self setTitleLabel:nil];
	[self setYearLabel:nil];
	[self setGenreLabel:nil];
	[self setRuntimeLabel:nil];
	[self setDirectorLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource protocol methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.movie.stars count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"ActorCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
	NSString *actor = [self.movie.stars objectAtIndex:indexPath.row];
	cell.textLabel.text = actor;
	
	return cell;
}

@end
