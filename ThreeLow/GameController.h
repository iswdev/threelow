//
//  GameController.h
//  ThreeLow
//
//  Created by Francisco on 2018-08-21.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property NSMutableArray *gameDice;
@property NSMutableArray *holdedDice;

- (instancetype) init;

- (void) testDice ;

- (void) createDice ;

- (void) printDice;

- (void) printScore;

- (void) rollDice;

- (void) resetDice;

- (void) holdDie: (int) position;

@end
