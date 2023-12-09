//
//  Grid.m
//  MineSweeper
//
//  Created by 312 on 2023/12/5.
//  Copyright © 2023 312. All rights reserved.
//

#import "Grid.h"
#import "GameManager.h"
@implementation Grid
//@synthesize   uibutton;
//@synthesize   width ;
//@synthesize   Height ;
//@synthesize   Row ;
//@synthesize   Col ;
//@synthesize   num ;
//@synthesize   Debug ;
-(void)SetGrid
{
    //_uibutton.backgroundColor=[UIColor blueColor];
    NSInteger Pos_x=Left_offset + _Col * Grid_Width;
    NSInteger Pos_y=Top_offset + _Row * Grid_Height;
    _uibutton.frame=CGRectMake(Pos_x,Pos_y,Grid_Width,Grid_Height);
    UIImage* ButtonImage=[UIImage imageNamed:@"top.JPEG"];
    [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
}
-(void)SetImageID:(ImageID)imageId
{
    self->_SelfId=imageId;
}
-(void)ChangeImage
{
    UIImage* ButtonImage;
    switch (_SelfId) {
        case Num1:
            ButtonImage=[UIImage imageNamed:@"num1"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
        case Num2:
            ButtonImage=[UIImage imageNamed:@"num2"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
        case Num3:
            ButtonImage=[UIImage imageNamed:@"num3"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
        case Num4:
            ButtonImage=[UIImage imageNamed:@"num4"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
        case Num5:
            ButtonImage=[UIImage imageNamed:@"num5"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
        case Num6:
            ButtonImage=[UIImage imageNamed:@"num6"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
        case Num7:
            ButtonImage=[UIImage imageNamed:@"num7"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
        case Num8:
            ButtonImage=[UIImage imageNamed:@"num8"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
        case None:
            ButtonImage=[UIImage imageNamed:@"top"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
        case Nullptr:
            ButtonImage=[UIImage imageNamed:@"nullptr"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
        case Flag:
            ButtonImage=[UIImage imageNamed:@"flag"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
        case Mine:
            ButtonImage=[UIImage imageNamed:@"lei"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
        case Win:
            ButtonImage=[UIImage imageNamed:@"leiflag"];
            [_uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            break;
    }
}
-(instancetype)initGrid
{
    self=[super init];
    if(self)
    {
        _IsMine=false;
        _IsOpen=false;
        _IsFlag=false;
        self->_SelfId=Nullptr;
        _AroundMineCount=0;
        //_Debug=@"DeBug";
        //NSLog(@"GridInit");
    }
    return self;
}
@end
