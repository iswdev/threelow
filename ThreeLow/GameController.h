//
//  GameController.h
//  ThreeLow
//
//  Created by Francisco on 2018-08-21.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property NSMutableArray *dices;
@property NSMutableArray *holdedDices;


- (void) testDice ;

- (void) createDices ;

- (void) printDices;


- (void) rollDices;

@end
