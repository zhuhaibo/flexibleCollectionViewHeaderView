#import "CollectionReusableView.h"

#define SCREEN [UIScreen mainScreen].bounds.size
static float KHEIGHT = 217;

@interface CollectionReusableView ()
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIView *alphaView;
@end

@implementation CollectionReusableView

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imgView = [[UIImageView alloc] initWithFrame:frame];
        CGRect rect = self.imgView.bounds;
        rect.size.height = KHEIGHT;
        self.imgView.image = [UIImage imageNamed:@"1.jpg"];
        [self addSubview:self.imgView];
        
        self.alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.alphaView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f];
        [self.imgView addSubview:self.alphaView];
    }
    return self;
}

- (void)setScrollView:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;
    CGRect rect = self.imgView.frame;
    if (point.y < 0) {
        rect.origin.y = point.y;
        rect.size.height = -point.y * 1.9f + KHEIGHT;
        rect.size.width = -point.y * 1.3f + SCREEN.width;
        rect.origin.x = (-rect.size.width + SCREEN.width) / 2;
    }
    self.imgView.frame = rect;
    [self layoutSubviews];
}

- (void)layoutSubviews {
    self.alphaView.bounds = self.imgView.bounds;
    self.alphaView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:(-self.alphaView.bounds.size.height + KHEIGHT + 0.3f * KHEIGHT) / KHEIGHT];
}

@end
