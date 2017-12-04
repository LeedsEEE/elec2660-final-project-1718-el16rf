//
//  DataModel.m
//  Sequencerv2
//
//  Created by Reuben Frankel [el16rf] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

-(void) initAudioPlayers {
    NSLog(@"initialising audio players...");
    
    // Track one
    NSString *trackOneFilePath = [[NSBundle mainBundle] pathForResource:@"electro_kick" ofType:@"wav"];
    NSURL *trackOneFileURL = [[NSURL alloc] initFileURLWithPath:trackOneFilePath];
    self.trackOne = [[AVAudioPlayer alloc] initWithContentsOfURL:trackOneFileURL error:nil];
    [self.trackOne prepareToPlay];
    
    // Track two
    NSString *trackTwoFilePath = [[NSBundle mainBundle] pathForResource:@"electro_snare" ofType:@"wav"];
    NSURL *trackTwoFileURL = [[NSURL alloc] initFileURLWithPath:trackTwoFilePath];
    self.trackTwo = [[AVAudioPlayer alloc] initWithContentsOfURL:trackTwoFileURL error:nil];
    [self.trackTwo prepareToPlay];
    
    // Track three
    NSString *trackThreeFilePath = [[NSBundle mainBundle] pathForResource:@"electro_clap" ofType:@"wav"];
    NSURL *trackThreeFileURL = [[NSURL alloc] initFileURLWithPath:trackThreeFilePath];
    self.trackThree = [[AVAudioPlayer alloc] initWithContentsOfURL:trackThreeFileURL error:nil];
    [self.trackThree prepareToPlay];
    
    // Track four
    NSString *trackFourFilePath = [[NSBundle mainBundle] pathForResource:@"electro_closedhat" ofType:@"wav"];
    NSURL *trackFourFileURL = [[NSURL alloc] initFileURLWithPath:trackFourFilePath];
    self.trackFour = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFourFileURL error:nil];
    [self.trackFour prepareToPlay];
    
    // Track five
    NSString *trackFiveFilePath = [[NSBundle mainBundle] pathForResource:@"electro_openhat" ofType:@"wav"];
    NSURL *trackFiveFileURL = [[NSURL alloc] initFileURLWithPath:trackFiveFilePath];
    self.trackFive = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFiveFileURL error:nil];
    [self.trackFive prepareToPlay];
    
    // Track six
    NSString *trackSixFilePath = [[NSBundle mainBundle] pathForResource:@"electro_crash" ofType:@"wav"];
    NSURL *trackSixFileURL = [[NSURL alloc] initFileURLWithPath:trackSixFilePath];
    self.trackSix = [[AVAudioPlayer alloc] initWithContentsOfURL:trackSixFileURL error:nil];
    [self.trackSix prepareToPlay];
}

@end
