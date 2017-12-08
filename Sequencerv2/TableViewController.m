//
//  TableViewController.m
//  Sequencerv2
//
//  Created by Reuben Frankel [el16rf] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    self.data = [[DataModel alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows;
    
    if (section == 0) {
        numberOfRows = self.data.samples.count;
    }
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SampleStyleCell" forIndexPath:indexPath];
    
    cell.tag = indexPath.row;
    
    // Configure the cell...
    if (indexPath.section == 0) {
        SampleStyle *tempSampleStyle = [self.data.samples objectAtIndex:indexPath.row];
        
        cell.textLabel.text = tempSampleStyle.name;
        cell.detailTextLabel.text = tempSampleStyle.style;
    }
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (IBAction)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // https://stackoverflow.com/questions/12509422/how-to-perform-unwind-segue-programmatically
    // https://stackoverflow.com/questions/27392203/unwind-push-segue-from-uitableviewcell-tap
    // https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/UsingSegues.html
    if ([[segue identifier] isEqualToString:@"ReturnMainView"]) {
        
        ViewController *destinationViewController = [segue destinationViewController];
        UITableViewCell *cell = (UITableViewCell *)sender;
        
        if (cell.tag == 0) {
            NSLog(@"cell %ld pressed", cell.tag);
            [destinationViewController.data initElectroSamples];
        }
        
        else if (cell.tag == 1) {
            NSLog(@"cell %ld pressed", cell.tag);
            [destinationViewController.data initDubstepSamples];
        }
        
        else if (cell.tag == 2) {
            NSLog(@"cell %ld pressed", cell.tag);
            [destinationViewController.data initDrumAndBassSamples];
        }
        
        else if (cell.tag == 3) {
            NSLog(@"cell %ld pressed", cell.tag);
            [destinationViewController.data initHipHopSamples];
        }
        
        else if (cell.tag == 4) {
            NSLog(@"cell %ld pressed", cell.tag);
            [destinationViewController.data initFutureBassSamples];
        }
        
        //[destinationViewController.navigationController popViewControllerAnimated:YES];
        [destinationViewController.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

// https://stackoverflow.com/questions/1214965/setting-action-for-back-button-in-navigation-controller
-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    [super viewWillDisappear:animated];
}

@end
