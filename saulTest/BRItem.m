//
//  BRItem.m
//  saulTest
//
//  Created by 朱黎明 on 2022/5/13.
//

#import "BRItem.h"
#import <MBFaker/MBFaker.h>

@implementation BRItem

+ (id) randomItem
{
    NSArray *nameList = @[@"saul", @"jemo", @"qingle", @"tang"];
    
    NSString *randomName = [MBFakerName name];
    NSString *randomName2 = [MBFakerName name];
    
    BRItem *newItem = [[self alloc] initWithItemName:randomName userAge:2 userNickname:[NSString stringWithFormat:@"nickname_%@", randomName2]];
    return newItem;
}

-(id ) initWithItemName:(NSString *)name
                userAge:(int )age
           userNickname:(NSString *)nickname
{
    self = [super init];
    if(self) {
        self.itemName = name;
        self.userAge = age;
        self.nickname = nickname;
    }
    return self;
}

-(id)init
{
    return [self initWithItemName:@"小石头" userAge:12 userNickname:@"saul"];
}


@end
