package visuals.ui.elements.booster
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolBoosterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBooster = null;
      
      public var type3Silhouette:SymbolBoosterType3SilhouetteGeneric = null;
      
      public var type2Silhouette:SymbolBoosterType2SilhouetteGeneric = null;
      
      public var type1Silhouette:SymbolBoosterType1SilhouetteGeneric = null;
      
      public var type1Strength1:SymbolBoosterType1Strength1Generic = null;
      
      public var type1Strength2:SymbolBoosterType1Strength2Generic = null;
      
      public var type1Strength3:SymbolBoosterType1Strength3Generic = null;
      
      public var type2Strength1:SymbolBoosterType2Strength1Generic = null;
      
      public var type2Strength2:SymbolBoosterType2Strength2Generic = null;
      
      public var type2Strength3:SymbolBoosterType2Strength3Generic = null;
      
      public var type3Strength1:SymbolBoosterType3Strength1Generic = null;
      
      public var type3Strength2:SymbolBoosterType3Strength2Generic = null;
      
      public var type3Strength3:SymbolBoosterType3Strength3Generic = null;
      
      public function SymbolBoosterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBooster;
         }
         else
         {
            _nativeObject = new SymbolBooster();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         type3Silhouette = new SymbolBoosterType3SilhouetteGeneric(_nativeObject.type3Silhouette);
         type2Silhouette = new SymbolBoosterType2SilhouetteGeneric(_nativeObject.type2Silhouette);
         type1Silhouette = new SymbolBoosterType1SilhouetteGeneric(_nativeObject.type1Silhouette);
         type1Strength1 = new SymbolBoosterType1Strength1Generic(_nativeObject.type1Strength1);
         type1Strength2 = new SymbolBoosterType1Strength2Generic(_nativeObject.type1Strength2);
         type1Strength3 = new SymbolBoosterType1Strength3Generic(_nativeObject.type1Strength3);
         type2Strength1 = new SymbolBoosterType2Strength1Generic(_nativeObject.type2Strength1);
         type2Strength2 = new SymbolBoosterType2Strength2Generic(_nativeObject.type2Strength2);
         type2Strength3 = new SymbolBoosterType2Strength3Generic(_nativeObject.type2Strength3);
         type3Strength1 = new SymbolBoosterType3Strength1Generic(_nativeObject.type3Strength1);
         type3Strength2 = new SymbolBoosterType3Strength2Generic(_nativeObject.type3Strength2);
         type3Strength3 = new SymbolBoosterType3Strength3Generic(_nativeObject.type3Strength3);
      }
      
      public function setNativeInstance(param1:SymbolBooster) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.type3Silhouette)
         {
            type3Silhouette.setNativeInstance(_nativeObject.type3Silhouette);
         }
         if(_nativeObject.type2Silhouette)
         {
            type2Silhouette.setNativeInstance(_nativeObject.type2Silhouette);
         }
         if(_nativeObject.type1Silhouette)
         {
            type1Silhouette.setNativeInstance(_nativeObject.type1Silhouette);
         }
         if(_nativeObject.type1Strength1)
         {
            type1Strength1.setNativeInstance(_nativeObject.type1Strength1);
         }
         if(_nativeObject.type1Strength2)
         {
            type1Strength2.setNativeInstance(_nativeObject.type1Strength2);
         }
         if(_nativeObject.type1Strength3)
         {
            type1Strength3.setNativeInstance(_nativeObject.type1Strength3);
         }
         if(_nativeObject.type2Strength1)
         {
            type2Strength1.setNativeInstance(_nativeObject.type2Strength1);
         }
         if(_nativeObject.type2Strength2)
         {
            type2Strength2.setNativeInstance(_nativeObject.type2Strength2);
         }
         if(_nativeObject.type2Strength3)
         {
            type2Strength3.setNativeInstance(_nativeObject.type2Strength3);
         }
         if(_nativeObject.type3Strength1)
         {
            type3Strength1.setNativeInstance(_nativeObject.type3Strength1);
         }
         if(_nativeObject.type3Strength2)
         {
            type3Strength2.setNativeInstance(_nativeObject.type3Strength2);
         }
         if(_nativeObject.type3Strength3)
         {
            type3Strength3.setNativeInstance(_nativeObject.type3Strength3);
         }
      }
   }
}
