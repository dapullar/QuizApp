//
//  Controller.h
//  Quizzer
//
//  Created by xcode on 2014-03-02.
//  Copyright (c) 2014 xcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Controller : NSObject {
    IBOutlet UIImageView *imageView;
    
    IBOutlet UIButton *answer1;
    IBOutlet UIButton *answer2;
    IBOutlet UIButton *answer3;
    IBOutlet UIButton *answer4;
    IBOutlet UIButton *answer5;
    IBOutlet UIButton *answer6;
    IBOutlet UIButton *answer7;
    IBOutlet UIButton *answer8;
    IBOutlet UIButton *answer9;
    
    IBOutlet UILabel *feedback;
    IBOutlet UILabel *questions;
}

-(IBAction)answerSelected:(UIButton*)sender;
-(NSMutableArray*)makeQuiz;
- (void)shuffle:(NSMutableArray*)answers;
-(int)populateQuiz:(NSMutableArray*)questionsArray;
-(BOOL)checkAnswer:(NSMutableArray*)questionsArray curr_index:(int)index answer:(NSString*)user_answer;

@end
