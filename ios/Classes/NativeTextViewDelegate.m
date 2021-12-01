//
//  NativeTextViewDelegate.m
//  flutter_native_text_view
//
//  Created by Henry Leung on 30/11/2021.
//

#import "NativeTextViewDelegate.h"

@implementation NativeTextViewDelegate {
    FlutterMethodChannel* _channel;
    id _Nullable _args;
    
    float _width;
    float _fontSize;
    UIFontWeight _fontWeight;
    UIColor* _fontColor;
    
    CGRect _previousRect;
    int _currentLineIndex;
}

- (instancetype)initWithChannel:(FlutterMethodChannel*)channel arguments:(id _Nullable)args {
    self = [super init];
    
    _fontSize = 16.0;
    _fontWeight = UIFontWeightRegular;
    _fontColor = UIColor.blackColor;
    
    if (args[@"fontSize"] && ![args[@"fontSize"] isKindOfClass:[NSNull class]]) {
        NSNumber* fontSize = args[@"fontSize"];
        _fontSize = [fontSize floatValue];
    }
    if (args[@"fontWeight"] && ![args[@"fontWeight"] isKindOfClass:[NSNull class]]) {
        _fontWeight = [self fontWeightFromString:args[@"fontWeight"]];
    }
    if (args[@"fontColor"] && ![args[@"fontColor"] isKindOfClass:[NSNull class]]) {
        NSDictionary* fontColor = args[@"fontColor"];
        _fontColor = [UIColor colorWithRed:[fontColor[@"red"] floatValue]/255.0 green:[fontColor[@"green"] floatValue]/255.0 blue:[fontColor[@"blue"] floatValue]/255.0 alpha:[fontColor[@"alpha"] floatValue]/255.0];
    }
    
    if (self) {
        _channel = channel;
        _args = args;
        _previousRect = CGRectZero;
        _currentLineIndex = 1;
    }
    return self;
}

- (UIColor *)fontColor {
    return _fontColor;
}

- (UIFont *)font {
    return [UIFont systemFontOfSize:_fontSize weight:_fontWeight];
}

- (UIFontWeight)fontWeightFromString:(NSString*)fontWeight {
    if (!fontWeight || [fontWeight isKindOfClass:[NSNull class]]) {
        return UIFontWeightRegular;
    }
    if ([fontWeight isEqualToString:@"FontWeight.w100"]) {
        return UIFontWeightUltraLight;
    } else if ([fontWeight isEqualToString:@"FontWeight.w200"]) {
        return UIFontWeightThin;
    } else if ([fontWeight isEqualToString:@"FontWeight.w300"]) {
        return UIFontWeightLight;
    } else if ([fontWeight isEqualToString:@"FontWeight.w400"]) {
        return UIFontWeightRegular;
    } else if ([fontWeight isEqualToString:@"FontWeight.w500"]) {
        return UIFontWeightMedium;
    } else if ([fontWeight isEqualToString:@"FontWeight.w600"]) {
        return UIFontWeightSemibold;
    } else if ([fontWeight isEqualToString:@"FontWeight.w700"]) {
        return UIFontWeightBold;
    } else if ([fontWeight isEqualToString:@"FontWeight.w800"]) {
        return UIFontWeightHeavy;
    } else if ([fontWeight isEqualToString:@"FontWeight.w900"]) {
        return UIFontWeightBlack;
    }

    return UIFontWeightRegular;
}

@end
