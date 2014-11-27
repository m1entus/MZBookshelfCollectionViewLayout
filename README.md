# MZBookshelfCollectionViewLayout

`MZBookshelfCollectionViewLayout` is a collection view layout similar to iBooks for UICollectionView.

[![](https://raw.github.com/m1entus/MZBookshelfCollectionViewLayout/master/Screens/1.png)](https://raw.github.com/m1entus/MZBookshelfCollectionViewLayout/master/Screens/1.png)

## Interface

```objective-c
extern NSString *const MZBookshelfCollectionViewLayoutDecorationViewKind;

@class MZBookshelfCollectionViewLayout;

@protocol MZBookshelfCollectionViewLayoutDelegate <UICollectionViewDelegateFlowLayout>
@required
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(MZBookshelfCollectionViewLayout *)collectionViewLayout referenceSizeForDecorationViewForRow:(NSInteger)row inSection:(NSInteger)section;

@optional
- (UIOffset)collectionView:(UICollectionView *)collectionView layout:(MZBookshelfCollectionViewLayout *)collectionViewLayout decorationViewAdjustmentForRow:(NSInteger)row inSection:(NSInteger)section;
@end

@interface MZBookshelfCollectionViewLayout : UICollectionViewFlowLayout
@end
```

## Example Usage

```objective-c

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    MZBookshelfCollectionViewLayout *layout = (id)self.collectionView.collectionViewLayout;
    [layout registerNib:[UINib nibWithNibName:@"MZBookShelfDecorationView" bundle:nil] forDecorationViewOfKind:MZBookshelfCollectionViewLayoutDecorationViewKind];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(MZBookshelfCollectionViewLayout *)collectionViewLayout referenceSizeForDecorationViewForRow:(NSInteger)row inSection:(NSInteger)section
{
    return CGSizeMake(collectionViewLayout.collectionViewContentSize.width, 30);
}

- (UIOffset)collectionView:(UICollectionView *)collectionView layout:(MZBookshelfCollectionViewLayout *)collectionViewLayout decorationViewAdjustmentForRow:(NSInteger)row inSection:(NSInteger)section
{
    return UIOffsetMake(0, 0);
}

```

## Contact

Michał Zaborowski

- http://github.com/m1entus
- http://twitter.com/iMientus
- http://twitter.com/inspace_io

## License

MZBookshelfCollectionViewLayoutDelegate is available under the MIT license. See the LICENSE file for more info.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/m1entus/mzbookshelfcollectionviewlayout/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

