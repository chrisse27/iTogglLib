//
//  TGLProjectService.m
//  iTogglLib
//
//  Created by Christoph Krautz on 14/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLProjectService.h"

@interface TGLProjectService ()
@property (strong) TGLTogglClient *client;
@end

@implementation TGLProjectService

- (instancetype)initWithClient:(TGLTogglClient *)client
{
    self = [super init];
    
    if (self) {
        _client = client;
    }
    
    return self;
}

@end
