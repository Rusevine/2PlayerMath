//
//  Player.h
//  2PlayerMath
//
//  Created by Wiljay Flores on 2018-08-06.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic) NSInteger score;
@property (nonatomic) NSInteger hearts;

-(instancetype)initWithName:(NSString*)name;
-(void)updatePlayer:(BOOL)update;

@end
