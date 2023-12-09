//
//  Number.h
//  MineSweeper
//
//  Created by 312 on 2023/12/6.
//  Copyright © 2023 312. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Number : NSObject
-(void)SetupNumber;
-(BOOL)OnBounds:(NSInteger)x :(NSInteger)y;
@end

NS_ASSUME_NONNULL_END
