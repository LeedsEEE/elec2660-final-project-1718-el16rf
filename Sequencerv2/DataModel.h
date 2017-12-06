//
//  DataModel.h
//  Sequencerv2
//
//  Created by Reuben Frankel [el16rf] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "SampleStyle.h"

@interface DataModel : NSObject

////////////////
// PROPERTIES //
////////////////

// Global
@property int BPM;
@property (strong, nonatomic) NSTimer *timer;
@property NSInteger sampleNumber;
@property BOOL playing;
@property (nonatomic, strong) NSMutableArray *samples;

// Track audio players
@property (strong, nonatomic) AVAudioPlayer *trackOne;
@property (strong, nonatomic) AVAudioPlayer *trackTwo;
@property (strong, nonatomic) AVAudioPlayer *trackThree;
@property (strong, nonatomic) AVAudioPlayer *trackFour;
@property (strong, nonatomic) AVAudioPlayer *trackFive;
@property (strong, nonatomic) AVAudioPlayer *trackSix;

/////////////
// METHODS //
/////////////

-(void) initElectroSamples;
-(void) initDubstepSamples;
-(void) initAcousticSamples;
-(void) initHipHopSamples;

@end
