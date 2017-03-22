//
//  LHCellHeightCalculator.m
//  AutoCalculateHeight
//
//  Created by 腾实信 on 2017/2/20.
//  Copyright © 2017年 ida. All rights reserved.
//

#import "LHCellHeightCalculator.h"
#import <CommonCrypto/CommonDigest.h>


@interface LHCellHeightCalculator ()
@property(strong,nonatomic,readonly)NSCache *cache;
@end

@implementation LHCellHeightCalculator

#pragma mark - Init
-(instancetype)init{
    self = [super init];
    if (self) {
        [self defaultConfigure];
    }
    return self;
}

-(void)defaultConfigure{

    NSCache *cache = [NSCache new];
    cache.name = @"LHCellHeightCaculator.cache";
    cache.countLimit = 200;
    _cache = cache;
}

#pragma mark - NSObject
-(NSString *)description{
    return [NSString stringWithFormat:@"<%@: cache = %@",[self class],self.cache];
}

#pragma mark - Public Methods
-(void)clearCaches{

    [self.cache removeAllObjects];
    
}

-(void)setHeight:(CGFloat)height withCalculateheightModel:(cellViewModel *)model{

    NSAssert(model != nil, @"cell Model can't nil");
    NSAssert(height >= 0, @"cell height must greater than or equal to 0");
    NSString *descriptionString = model.description;
    NSString *keyStr = [self md5:descriptionString];
    [self.cache setObject:[NSNumber numberWithFloat:height] forKey:keyStr];
}

-(NSString *)md5:(NSString *)descripStr{
    const char *cStr = [descripStr UTF8String];
    unsigned char digest[16];
    //CC_LONG (uint32_t)
    CC_MD5(cStr, (uint32_t)strlen(cStr), digest);
    NSMutableString  *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x",digest[i]];
    }
    return output;

}

-(CGFloat)heightForCalculateheightModel:(cellViewModel *)model{

    NSString *descriptionString = model.description;
    NSString *keyStr = [self md5:descriptionString];
    NSNumber *cellHeightNumber = [self.cache objectForKey:keyStr];
    if (cellHeightNumber) {
        return [cellHeightNumber floatValue];
    }
    return -1;
}
@end
