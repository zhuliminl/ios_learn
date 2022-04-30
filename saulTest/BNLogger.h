//
//  BNLogger.h
//  saulTest
//
//  Created by 朱黎明 on 2022/4/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNLogger : NSObject
<NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSMutableData *_incommingData;
}


@property (nonatomic) NSDate *lastTime;

- (NSString *) lastTimeString;
- (void ) updateLastTime:(NSTimer *) t;
- (void) zoomChange:(NSNotification *)note;

@end

NS_ASSUME_NONNULL_END
