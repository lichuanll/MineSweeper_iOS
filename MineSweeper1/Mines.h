//
//  Mines.h
//  MineSweeper
//
//  Created by 312 on 2023/12/6.
//  Copyright © 2023 312. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vector2.h"
NS_ASSUME_NONNULL_BEGIN

@interface Mines : NSObject
extern NSMutableArray<Vector2*>* MinePos;

-(void)SetupMines;
@end

NS_ASSUME_NONNULL_END
