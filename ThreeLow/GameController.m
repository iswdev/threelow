//
//  GameController.m
//  ThreeLow
//
//  Created by Francisco on 2018-08-21.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

#define NUMDICES 6

@implementation GameController

- (instancetype) init{
    [self createDices];
    return self;
}

- (void) testDice {
    Dice *dice = [Dice new];
    NSLog(@"Dice initial value %@",[dice visibleValue]);
    [dice roll];
    NSLog(@"Dice value after roll %@",[dice visibleValue]);
}

- (void) createDices {
    int i;
    self.dices = [NSMutableArray new];
    self.holdedDices = [NSMutableArray new];
    for(i=0; i< NUMDICES; i++){
        [self.dices addObject:[Dice new]];
    }
}

- (void) printDices{
    NSString *row = @"";
    NSString *mark;
    int i;
    for(i=0; i< NUMDICES; i++){
        mark = @"*";
        row = [row stringByAppendingString:[NSString stringWithFormat:@"%d %@%@  ", i+1, mark,  [[self.dices objectAtIndex: i] visibleValue]]];
    }
    NSLog(@"%@",row);
}


- (void) rollDices{
    int i;
    for(i=0; i< NUMDICES; i++){
        [self.dices[i] roll];
    }
}

- (void) clearHold{
    [self.holdedDices removeAllObjects];
}

- (void) holdDice: (int) position{
    Dice *selected = [self.dices objectAtIndex:position];
    NSInteger foundItem = ([self.holdedDices indexOfObject:selected] );
    if(foundItem == NSNotFound) {
        [self.holdedDices addObject:selected];
    }
}

@end
