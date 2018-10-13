//
//  CDDigests.h
//  CommonCryptoDigests
//
//  Created by Abraham Quezada on 10/6/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

#ifndef CDDigests_h
#define CDDigests_h
#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>

@interface DDigests: NSObject
+(NSString *) sha1String: (String *)input;
@end

#endif /* CDDigests_h */
