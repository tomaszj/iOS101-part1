//
// Created by tomaszj on 17.03.2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


@protocol TwitterServiceProtocol <NSObject>

- (void)recentTweetsForHashTag:(NSString *)hashTag withSuccessBlock:(void(^)(NSArray *tweets))successBlock errorBlock:(void(^)(void))errorBlock;


@end