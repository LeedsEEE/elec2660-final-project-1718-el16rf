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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    
    if (indexPath.section == 0) {
        SampleStyle *tempSampleStyle = [self.data.samples objectAtIndex:indexPath.row];
        
        cell.textLabel.text = tempSampleStyle.name;
        cell.detailTextLabel.text = tempSampleStyle.style;
    }
    return cell;
}

#pragma mark - Navigation

- (IBAction)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // https://stackoverflow.com/questions/12509422/how-to-perform-unwind-segue-programmatically
    // https://stackoverflow.com/questions/27392203/unwind-push-segue-from-uitableviewcell-tap
    // https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/UsingSegues.html
    // https://stackoverflow.com/questions/23450111/unwind-segue-with-uitableviewcell-in-xamarin-ios
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
