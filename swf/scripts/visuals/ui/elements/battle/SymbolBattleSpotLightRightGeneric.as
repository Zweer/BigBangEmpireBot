package visuals.ui.elements.battle
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   
   public class SymbolBattleSpotLightRightGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleSpotLightRight = null;
      
      public var emblemGuildB:SymbolGuildEmblemGeneric = null;
      
      public function SymbolBattleSpotLightRightGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleSpotLightRight;
         }
         else
         {
            _nativeObject = new SymbolBattleSpotLightRight();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         emblemGuildB = new SymbolGuildEmblemGeneric(_nativeObject.emblemGuildB);
      }
      
      public function setNativeInstance(param1:SymbolBattleSpotLightRight) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.emblemGuildB)
         {
            emblemGuildB.setNativeInstance(_nativeObject.emblemGuildB);
         }
      }
   }
}
