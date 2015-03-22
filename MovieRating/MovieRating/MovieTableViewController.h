//
//  MovieTableViewController.h
//  MovieRating
//
//  Created by Cesar Brenes on 3/21/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewController : UITableViewController

@property(nonatomic,strong) NSMutableArray *moviesArray;

- (IBAction)addMovieAction:(id)sender;

@end
