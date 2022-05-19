//
//  BRItem.h
//  saulTest
//
//  Created by 朱黎明 on 2022/5/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BRItem : NSObject

+ (instancetype) randomItem:(int) index;

-(instancetype ) initWithItemName:(NSString *)name
                          userAge:(int )age
                     userNickname:(NSString *)nickname;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic) int userAge;
@property (nonatomic, strong) NSDate *dateCreated;

@end

NS_ASSUME_NONNULL_END
