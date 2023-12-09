//
//  Grid.h
//  MineSweeper
//
//  Created by 312 on 2023/12/5.
//  Copyright © 2023 312. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,ImageID)
{
    None,Num1,Num2,Num3,
    Num4,Num5,Num6,Num7,
    Num8,Flag,Nullptr,Mine,
    Win,
};
@interface Grid : NSObject
@property(nonatomic,strong) UIButton* uibutton;
@property(nonatomic,assign) NSInteger Row;
@property(nonatomic,assign) NSInteger Col;
@property(nonatomic,assign) NSInteger AroundMineCount;
@property(nonatomic,assign) BOOL IsMine;
@property(nonatomic,assign) BOOL IsFlag;
@property(nonatomic,assign) BOOL IsOpen;
@property(nonatomic,assign) ImageID SelfId;

-(void)SetImageID:(ImageID)imageId;
-(void)ChangeImage;
-(void)SetGrid;
-(instancetype)initGrid;
@end

NS_ASSUME_NONNULL_END
