package visuals.ui.elements.guild_booster
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolGuildBoosterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildBooster = null;
      
      public var type2Strength1:SymbolGuildBoosterType2Strength1Generic = null;
      
      public var type1Strength1:SymbolGuildBoosterType1Strength1Generic = null;
      
      public function SymbolGuildBoosterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildBooster;
         }
         else
         {
            _nativeObject = new SymbolGuildBooster();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         type2Strength1 = new SymbolGuildBoosterType2Strength1Generic(_nativeObject.type2Strength1);
         type1Strength1 = new SymbolGuildBoosterType1Strength1Generic(_nativeObject.type1Strength1);
      }
      
      public function setNativeInstance(param1:SymbolGuildBooster) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.type2Strength1)
         {
            type2Strength1.setNativeInstance(_nativeObject.type2Strength1);
         }
         if(_nativeObject.type1Strength1)
         {
            type1Strength1.setNativeInstance(_nativeObject.type1Strength1);
         }
      }
   }
}
