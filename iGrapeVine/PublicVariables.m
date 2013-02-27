//  Copyright (c) 2013 William Cox. All rights reserved.

#include "PublicVariables.h"
#include "GameClass.h"

static PublicVariables *sharedInstance;

@implementation PublicVariables

+ (instancetype)shared {
    if (!sharedInstance) {
        sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}
@end