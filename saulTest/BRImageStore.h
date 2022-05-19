//
//  BRImageStore.h
//  saulTest
//
//  Created by 朱黎明 on 2022/5/19.
//

#import <Foundation/Foundation.h>
#import <UIkit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BRImageStore : NSObject

+(instancetype) sharedStore;

-(void)setImage:(UIImage *)image forKey:(NSString *)key;
-(UIImage *)imageForKey:(NSString *)key;
-(void)deleteImageForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
