//
//  SVSUMovie.m
//  SVSUIntro
//
//  Created by Brian Munzenberger on 3/16/12.
//  Copyright (c) 2012 Detroit Labs. All rights reserved.
//

#import "SVSUMovie.h"

@implementation SVSUMovie

@synthesize title;
@synthesize year;
@synthesize genre;
@synthesize runtime;
@synthesize director;
@synthesize stars;

- (NSString *)description
{
	return [NSString stringWithFormat:@"{title=%@, year=%i}", self.title, self.year];
}

@end
