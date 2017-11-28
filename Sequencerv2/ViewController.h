//
//  ViewController.h
//  Sequencerv2
//
//  Created by Reuben Frankel [el16rf] on 21/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface ViewController : UIViewController

////////////////
// PROPERTIES //
////////////////

// Track buttons
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackOneButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackTwoButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackThreeButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackFourButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackFiveButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *trackSixButtons;

@property DataModel *data;

/////////////
// METHODS //
/////////////

// Track buttons
- (IBAction)didPressTrackOne:(UIButton *)sender;
- (IBAction)didPressTrackTwo:(UIButton *)sender;
- (IBAction)didPressTrackThree:(UIButton *)sender;
- (IBAction)didPressTrackFour:(UIButton *)sender;
- (IBAction)didPressTrackFive:(UIButton *)sender;
- (IBAction)didPressTrackSix:(UIButton *)sender;

// Track faders
- (IBAction)trackOneVolumeSlider:(UISlider *)sender;
- (IBAction)trackTwoVolumeSlider:(UISlider *)sender;
- (IBAction)trackThreeVolumeSlider:(UISlider *)sender;
- (IBAction)trackFourVolumeSlider:(UISlider *)sender;
- (IBAction)trackFiveVolumeSlider:(UISlider *)sender;
- (IBAction)trackSixVolumeSlider:(UISlider *)sender;

@end

