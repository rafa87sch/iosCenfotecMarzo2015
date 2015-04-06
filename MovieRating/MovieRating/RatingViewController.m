//
//  RatingViewController.m
//  MovieRating
//
//  Created by Esteban on 28/3/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import "RatingViewController.h"

const static int NUMBER_OF_COMPONENTS = 1;
const static int ZERO = 0;

@interface RatingViewController ()

@end

@implementation RatingViewController{
    NSArray *ratingArray;
    int rowSelected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ratingArray = @[@"1",@"2",@"3",@"4",@"5"];
    self.ratingPicker.delegate = self;
    rowSelected = ZERO;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(doRating)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.movieName.text = self.movieObject.name;
}

-(void)doRating{
    //OBTENGO EL VALOR DEL PICKER SELECCIONADO
    int valueOfRating = [[ratingArray objectAtIndex:rowSelected] intValue];
    //OBTENGO EL VALOR TOTAL DEL RATING
    int totalRating = valueOfRating + self.movieObject.totalRating;
    //ACTUALIZO EL OBJETO CON LOS VALORES NUEVOS
    self.movieObject.count++;
    self.movieObject.totalRating = totalRating;
    self.movieObject.rating = totalRating*1.0/self.movieObject.count*1.0;
    //RETORNO A LA VISTA ANTERIOR
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return NUMBER_OF_COMPONENTS;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return ratingArray.count;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [ratingArray objectAtIndex:row];
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    rowSelected = (int)row;
}







@end
