//
//  SVSUMovie.h
//  SVSUIntro
//
//  Created by Brian Munzenberger on 3/16/12.
//  Copyright (c) 2012 Detroit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SVSUMovie : NSObject

@property (strong) NSString *title;
@property (strong) NSString *genre;
@property NSInteger year;
@property NSInteger runtime;
@property (strong) NSString *director;
@property (strong) NSArray *stars;

@end
