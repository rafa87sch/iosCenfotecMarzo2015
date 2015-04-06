//
//  Movie.h
//  MovieRating
//
//  Created by Cesar Brenes on 3/21/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *categoryName;
@property(nonatomic) int year;
@property(nonatomic) float rating;
@property(nonatomic) int count;
@property(nonatomic) int totalRating;

@end
