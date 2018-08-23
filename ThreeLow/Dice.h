//
//  Dice.h
//  ThreeLow
//
//  Created by Francisco on 2018-08-21.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Dice : NSObject

@property int value;


- (instancetype) init;

- (NSString *) visibleValue;

- (void) roll;


@end
