//
// Created by tomaszj on 17.03.2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "OfflineTwitterService.h"


@implementation OfflineTwitterService {

}

- (void)recentTweetsForHashTag:(NSString *)hashTag withSuccessBlock:(void (^)(NSArray *))successBlock errorBlock:(void (^)())errorBlock {

    NSDictionary *resultDict = nil;

    NSString *tweetsJsonFilePath = [[NSBundle mainBundle] pathForResource:@"tweets" ofType:@"json"];
    if (tweetsJsonFilePath) {
        NSData *tweetsData = [NSData dataWithContentsOfFile:tweetsJsonFilePath];

        NSError *parseError = nil;
        resultDict = [NSJSONSerialization JSONObjectWithData:tweetsData options:(NSJSONReadingOptions)0 error:&parseError];
    }

    if (resultDict) {
        if (successBlock) {
            successBlock(resultDict[@"results"]);
        }
    } else {
        if (errorBlock) {
            errorBlock();
        }
    }
}


@end