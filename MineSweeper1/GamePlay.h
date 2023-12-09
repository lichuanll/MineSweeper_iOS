//
//  GamePlay.h
//  MineSweeper
//
//  Created by 312 on 2023/12/6.
//  Copyright © 2023 312. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grid.h"
NS_ASSUME_NONNULL_BEGIN

@interface GamePlay : NSObject

-(void)InitGame;
-(void)InitMines;
-(void)InirNumber;
-(BOOL)OnBounds:(NSInteger)x :(NSInteger)y;
-(void)OpenSpace: (Grid*) grid;
-(void)RePlay;
-(BOOL)IsLose:(Grid*) grid;
-(BOOL)IsWin;
-(void)DisableAllButton;
@end

NS_ASSUME_NONNULL_END
