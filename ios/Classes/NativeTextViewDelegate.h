//
//  NativeTextViewDelegate.h
//  flutter_native_text_view
//
//  Created by Henry Leung on 30/11/2021.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativeTextViewDelegate : NSObject <UITextViewDelegate>

- (instancetype)initWithChannel:(FlutterMethodChannel*)channel arguments:(id _Nullable)args;
- (UIColor *)fontColor;
- (UIFont *)font;

@end

NS_ASSUME_NONNULL_END
