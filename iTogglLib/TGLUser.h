//
//  TGLUser.h
//  iTogglLib
//
//  Created by Christoph Krautz on 11/05/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGLUser : NSObject

@property (nonatomic, readonly) NSString *apiToken;

- (id)initWithApiToken:(NSString *) apiToken;

@end
