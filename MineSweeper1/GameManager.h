//
//  GameManager.h
//  MineSweeper
//
//  Created by 312 on 2023/12/5.
//  Copyright © 2023 312. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grid.h"
NS_ASSUME_NONNULL_BEGIN

@interface GameManager : NSObject

extern NSInteger MaxWidth;
extern NSInteger MaxHeight;
extern NSMutableArray<NSMutableArray<Grid*>*>* Grids;
extern NSInteger MineCount;
extern NSInteger Row_Count;
extern NSInteger Col_Count;
extern NSInteger Grid_Width;
extern NSInteger Grid_Height;
extern NSInteger Top_offset;
extern NSInteger Left_offset;
extern BOOL IsFlag;
//   @property(nonatomic,strong) NSMutableArray<NSMutableArray<Grid*>*>* Grids;
//   @property(nonatomic,assign) NSInteger Map_h;
//   @property(nonatomic,assign) NSInteger Map_w;
//   @property(nonatomic,assign) NSInteger GridCount;

-(void) InitGrids;
-(instancetype)initGameManager;
@end

NS_ASSUME_NONNULL_END
