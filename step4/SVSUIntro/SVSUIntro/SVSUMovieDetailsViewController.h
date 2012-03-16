//
//  SVSUMovieDetailsViewControllerViewController.h
//  SVSUIntro
//
//  Created by Brian Munzenberger on 3/16/12.
//  Copyright (c) 2012 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SVSUMovie;

@interface SVSUMovieDetailsViewController : UIViewController <UITableViewDataSource>

@property (strong) SVSUMovie *movie;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet UILabel *genreLabel;
@property (strong, nonatomic) IBOutlet UILabel *runtimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *directorLabel;

@end
