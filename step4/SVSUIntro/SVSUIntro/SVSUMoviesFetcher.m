//
//  SVSUMoviesFetcher.m
//  SVSUIntro
//
//  Created by Brian Munzenberger on 3/16/12.
//  Copyright (c) 2012 Detroit Labs. All rights reserved.
//

#import "SVSUMoviesFetcher.h"
#import "SVSUMovie.h"

@implementation SVSUMoviesFetcher

+ (NSArray *)movies
{
	NSMutableArray *movies = [[NSMutableArray alloc] init];
	
	NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:@"movies" ofType:@"json"];
	
	NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath];
	
	NSError *parseError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData 
													options:NSJSONReadingAllowFragments 
													  error:&parseError];
	
	if ([jsonObject isKindOfClass:[NSArray class]]) {
		for (id jsonMovie in jsonObject) {
			if ([jsonMovie respondsToSelector:@selector(objectForKey:)]) {
				
				SVSUMovie *movie = [[SVSUMovie alloc] init];
				movie.title = [jsonMovie objectForKey:@"title"];
				movie.year = [[jsonMovie objectForKey:@"year"] intValue];
				movie.genre = [jsonMovie objectForKey:@"genre"];
				movie.runtime = [[jsonMovie objectForKey:@"runtime"] intValue];
				movie.director = [jsonMovie objectForKey:@"director"];
				movie.stars = [jsonMovie objectForKey:@"stars"];
				
				[movies addObject:movie];
			}
		}
	}
	
	return [NSArray arrayWithArray:movies];
}

@end
