//
//  TGLWorkspace+Json.h
//  iTogglLib
//
//  Created by Christoph Krautz on 25/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLWorkspace.h"

@interface TGLWorkspace (Json)

+ (TGLWorkspace *)workspaceFromDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionary;

@end
