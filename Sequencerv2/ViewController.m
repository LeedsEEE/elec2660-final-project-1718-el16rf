//
//  ViewController.m
//  Sequencerv2
//
//  Created by Reuben Frankel [el16rf] on 21/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initTrackArrays];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)didPressTrackOne:(UIButton *)sender {
    NSLog(@"track 1; button %ld", sender.tag);
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        trackOneButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        trackOneButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", trackFourButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackTwo:(UIButton *)sender {
    NSLog(@"track 2; button %ld", sender.tag);
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        trackTwoButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        trackTwoButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", trackFourButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackThree:(UIButton *)sender {
    NSLog(@"track 3; button %ld pressed", sender.tag);
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        trackThreeButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        trackThreeButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", trackFourButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackFour:(UIButton *)sender {
    NSLog(@"track 4; button %ld", sender.tag);
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        trackFourButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        trackFourButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", trackFourButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackFive:(UIButton *)sender {
    NSLog(@"track 5; button %ld", sender.tag);
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        trackFiveButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        trackFiveButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", trackFourButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackSix:(UIButton *)sender {
    NSLog(@"track 6; button %ld", sender.tag);
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        trackSixButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        trackSixButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", trackFourButtonStateArray[sender.tag]);
}

- (void) initTrackArrays {
    for (int i = 0; i < 16; i++) {
        trackOneButtonStateArray[i] = 0;
        trackTwoButtonStateArray[i] = 0;
        trackThreeButtonStateArray[i] = 0;
        trackFourButtonStateArray[i] = 0;
        trackFiveButtonStateArray[i] = 0;
        trackSixButtonStateArray[i] = 0;
    }
}


@end
