//
// Created by tomaszj on 17.03.2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "OnlineTwitterService.h"
#import "AFNetworking.h"


@implementation OnlineTwitterService {

}

- (void)recentTweetsForHashTag:(NSString *)hashTag withSuccessBlock:(void (^)(NSArray *))successBlock errorBlock:(void (^)())errorBlock {

    if ([hashTag length] == 0) {
        [NSException raise:@"WrongArgumentException" format:nil];
    }

    NSString *escapedHashTag = [hashTag stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *urlString = [NSString stringWithFormat:@"http://search.twitter.com/search.json?q=%@&rpp=5&result_type=mixed", escapedHashTag];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];

    [[AFJSONRequestOperation JSONRequestOperationWithRequest:urlRequest success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        successBlock(JSON[@"results"]);
    }                                                failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        errorBlock();
    }] start];
}


@end