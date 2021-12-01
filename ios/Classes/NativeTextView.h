//
//  NativeTextView.h
//  flutter_native_text_view
//
//  Created by Henry Leung on 30/11/2021.
//

#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativeTextView : NSObject <FlutterPlatformView>

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
              binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

- (UIView*)view;
@end

NS_ASSUME_NONNULL_END
