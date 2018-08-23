//
//  Dice.m
//  ThreeLow
//
//  Created by Francisco on 2018-08-21.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

#import <time.h>
#import <stdlib.h>
#import "Dice.h"

@implementation Dice

// Initialization with roll
- (instancetype) init{
    [self roll];
    return self;
}

// Shows a special character instead of number (UTF-8 symbol)
- (NSString *) visibleValue{
    NSArray *values = [[NSArray alloc] initWithObjects:@"1️⃣",@"2️⃣",@"3️⃣",@"4️⃣",@"5️⃣",@"6️⃣", nil];
    return (NSString *)[values objectAtIndex:self.value - 1];
}

// Gets a nuew value using a random number
- (void) roll{
    self.value = ( arc4random_uniform(6) ) + 1;
}

@end
