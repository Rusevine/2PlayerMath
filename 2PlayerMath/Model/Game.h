//
//  Game.h
//  2PlayerMath
//
//  Created by Wiljay Flores on 2018-08-06.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Game : NSObject

@property (nonatomic,strong) NSArray<Player*> *players;
@property (nonatomic) NSInteger x;
@property (nonatomic) NSInteger y;


-(void) generateQuestion;
-(BOOL)evaluateAnswer:(NSInteger *)answer;

@end
