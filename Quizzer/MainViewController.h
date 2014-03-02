//
//  MainViewController.h
//  Quizzer
//
//  Created by xcode on 2014-03-02.
//  Copyright (c) 2014 xcode. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
