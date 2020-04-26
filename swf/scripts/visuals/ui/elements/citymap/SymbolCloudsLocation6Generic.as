package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolCloudsLocation6Generic extends Sprite
   {
       
      
      private var _nativeObject:SymbolCloudsLocation6 = null;
      
      public var symbolCloud4_1:SymbolCloud4_1Generic = null;
      
      public var symbolCloud4_2:SymbolCloud4_2Generic = null;
      
      public var symbolCloud4_3:SymbolCloud4_3Generic = null;
      
      public var iconLockWorldmap:SymbolIconLockGeneric = null;
      
      public function SymbolCloudsLocation6Generic(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCloudsLocation6;
         }
         else
         {
            _nativeObject = new SymbolCloudsLocation6();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolCloud4_1 = new SymbolCloud4_1Generic(_nativeObject.symbolCloud4_1);
         symbolCloud4_2 = new SymbolCloud4_2Generic(_nativeObject.symbolCloud4_2);
         symbolCloud4_3 = new SymbolCloud4_3Generic(_nativeObject.symbolCloud4_3);
         iconLockWorldmap = new SymbolIconLockGeneric(_nativeObject.iconLockWorldmap);
      }
      
      public function setNativeInstance(param1:SymbolCloudsLocation6) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolCloud4_1)
         {
            symbolCloud4_1.setNativeInstance(_nativeObject.symbolCloud4_1);
         }
         if(_nativeObject.symbolCloud4_2)
         {
            symbolCloud4_2.setNativeInstance(_nativeObject.symbolCloud4_2);
         }
         if(_nativeObject.symbolCloud4_3)
         {
            symbolCloud4_3.setNativeInstance(_nativeObject.symbolCloud4_3);
         }
         if(_nativeObject.iconLockWorldmap)
         {
            iconLockWorldmap.setNativeInstance(_nativeObject.iconLockWorldmap);
         }
      }
   }
}
