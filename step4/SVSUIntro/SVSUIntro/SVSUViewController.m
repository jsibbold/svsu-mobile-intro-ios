//
//  SVSUViewController.m
//  SVSUIntro
//
//  Created by Brian Munzenberger on 3/16/12.
//  Copyright (c) 2012 Detroit Labs. All rights reserved.
//

#import "SVSUViewController.h"
#import "SVSUMoviesFetcher.h"
#import "SVSUMovie.h"
#import "SVSUMovieDetailsViewController.h"

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
	}
	
	SVSUMovie *movie = [movies objectAtIndex:indexPath.row];
	
	cell.textLabel.text = movie.title;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%i, Dir: %@", movie.year, movie.director];
	
	return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	NSLog(@"segue:%@, sender:%@", segue, sender);
	
	if ([segue.identifier isEqualToString:@"ViewMovieDetails"]) {
		
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		SVSUMovie *movie = [movies objectAtIndex:indexPath.row];
		
		if ([segue.destinationViewController isKindOfClass:[SVSUMovieDetailsViewController class]]) {
			[segue.destinationViewController setMovie:movie];
		}
	}
}

@end
