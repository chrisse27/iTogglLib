//
//  TGLProject+Json.h
//  iTogglLib
//
//  Created by Christoph Krautz on 15/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLProject.h"

@interface TGLProject (Json)

+ (TGLProject *)projectFromDictionary:(NSDictionary *)dictionary;

@end
