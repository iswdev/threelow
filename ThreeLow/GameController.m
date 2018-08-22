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
    NSString *row = [NSString
                     stringWithFormat:@"1 %@  2 %@  3 %@  4 %@  5 %@  6 %@"
                     ,[[self.dices objectAtIndex: 0] visibleValue]
                     ,[[self.dices objectAtIndex: 1] visibleValue]
                     ,[[self.dices objectAtIndex: 2] visibleValue]
                     ,[[self.dices objectAtIndex: 3] visibleValue]
                     ,[[self.dices objectAtIndex: 4] visibleValue]
                     ,[[self.dices objectAtIndex: 5] visibleValue]
                     ];
    NSLog(@"%@",row);
}


- (void) rollDices{
    int i;
    for(i=0; i< NUMDICES; i++){
        [self.dices[i] roll];
    }
}

@end
