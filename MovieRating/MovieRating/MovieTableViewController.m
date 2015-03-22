//
//  MovieTableViewController.m
//  MovieRating
//
//  Created by Cesar Brenes on 3/21/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import "MovieTableViewController.h"
#import "Movie.h"
#import "MovieViewController.h"


static int NUMBER_OF_SECTION = 1;
static NSString *CELL_IDENTIFIER = @"CELL";



@interface MovieTableViewController ()

@end

@implementation MovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
}


-(void)initialize{
//    initializo el array
    self.moviesArray = [NSMutableArray new];
//    creo un objeto Movie y lo lleno
    Movie *movieObject = [Movie new];
    movieObject.name = @"Toy Story";
    movieObject.categoryName = @"Animation Movie";
    movieObject.year = 1995;
    movieObject.rating = 0;
    movieObject.count = 0;
//    agrego dicho objecto al array
    [self.moviesArray addObject:movieObject];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return NUMBER_OF_SECTION;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.moviesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_IDENTIFIER];
    }
    
    // Configure the cell...
    
    Movie *movieObject = [self.moviesArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = movieObject.name;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addMovieAction:(id)sender {
    MovieViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"MovieViewController"];
    [self.navigationController pushViewController:newView animated:YES];
}
@end
