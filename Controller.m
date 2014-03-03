//
//  Controller.m
//  Quizzer
//
//  Created by xcode on 2014-03-02.
//  Copyright (c) 2014 xcode. All rights reserved.
//

#import "Controller.h"

@implementation Controller
static NSMutableArray *quizArray = nil;


-(IBAction)answerSelected:(UIButton*)sender {
    
    //Grab selected value
    NSString* answer = [sender currentTitle];
    //Compare to correct answer
    if (quizArray) {
        quizArray = [self makeQuiz];
    }
    
    int index = [self populateQuiz:quizArray];
    NSLog(@"%d", [self checkAnswer:quizArray curr_index:index answer:answer]);
    
    //Decide
    
}

-(NSMutableArray*)makeQuiz {
    NSMutableArray *innerArray = [[NSMutableArray alloc] initWithCapacity:2];
    NSMutableArray *outerArray = [[NSMutableArray alloc] initWithCapacity:12];
    
    [innerArray addObject:[UIImage imageNamed:@"blue_bomb.png"]];
    [innerArray addObject:@"Blue Bomb"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"fire_chomp.png"]];
    [innerArray addObject:@"Fire Chomp"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"goomba.png"]];
    [innerArray addObject:@"Goomba"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"lady_bow.png"]];
    [innerArray addObject:@"Lady Bow"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"nibbles.png"]];
    [innerArray addObject:@"Nibbles"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"sombrero_guy.png"]];
    [innerArray addObject:@"Shy Guy"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"starlow.png"]];
    [innerArray addObject:@"Starlow"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"sylvia.png"]];
    [innerArray addObject:@"Sylvia"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"toadette.png"]];
    [innerArray addObject:@"Toadette"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"vivian.png"]];
    [innerArray addObject:@"Vivian"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"watt.png"]];
    [innerArray addObject:@"Watt"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    return outerArray;
}

-(int)populateQuiz:(NSMutableArray*)questionsArray {
    int index = arc4random() % [questionsArray count];
    [imageView setImage:[[questionsArray objectAtIndex:index] objectAtIndex:0]];
    
    NSMutableArray* answers = [[NSMutableArray alloc] initWithObjects:[[questionsArray objectAtIndex:index] objectAtIndex:1], nil];
    
    for (NSMutableArray* question in questionsArray) {
        if (![[question objectAtIndex:1] isEqual:[answers objectAtIndex:0]]) {
            [answers addObject:[question objectAtIndex:1]];
        }
    }
    
    [self shuffle:answers];
    [answer1 setTitle:[answers objectAtIndex:0] forState: UIControlStateNormal];
    [answer2 setTitle:[answers objectAtIndex:1] forState: UIControlStateNormal];
    [answer3 setTitle:[answers objectAtIndex:2] forState: UIControlStateNormal];
    [answer4 setTitle:[answers objectAtIndex:3] forState: UIControlStateNormal];
    [answer5 setTitle:[answers objectAtIndex:4] forState: UIControlStateNormal];
    [answer6 setTitle:[answers objectAtIndex:5] forState: UIControlStateNormal];
    [answer7 setTitle:[answers objectAtIndex:6] forState: UIControlStateNormal];
    [answer8 setTitle:[answers objectAtIndex:7] forState: UIControlStateNormal];
    [answer9 setTitle:[answers objectAtIndex:8] forState: UIControlStateNormal];
    
    return index;
}

-(BOOL)checkAnswer:(NSMutableArray*)questionsArray curr_index:(int)index answer:(NSString*)user_answer {
    if ([[[questionsArray objectAtIndex:index] objectAtIndex:1] isEqual:user_answer]) {
        return true;
    }
    
    return false;
}

- (void)shuffle:(NSMutableArray*)questionsArray {
    NSUInteger count = [questionsArray count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger nElements = count - i;
        NSInteger n = arc4random_uniform(nElements) + i;
        [questionsArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end
