//
//  RatingViewController.h
//  MovieRating
//
//  Created by Esteban on 28/3/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface RatingViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (nonatomic,strong) Movie *movieObject;

@property (weak, nonatomic) IBOutlet UIPickerView *ratingPicker;

@end
