package visuals.ui.elements.battle
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   
   public class SymbolBattleSpotLightLeftGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleSpotLightLeft = null;
      
      public var emblemGuildA:SymbolGuildEmblemGeneric = null;
      
      public function SymbolBattleSpotLightLeftGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleSpotLightLeft;
         }
         else
         {
            _nativeObject = new SymbolBattleSpotLightLeft();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         emblemGuildA = new SymbolGuildEmblemGeneric(_nativeObject.emblemGuildA);
      }
      
      public function setNativeInstance(param1:SymbolBattleSpotLightLeft) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.emblemGuildA)
         {
            emblemGuildA.setNativeInstance(_nativeObject.emblemGuildA);
         }
      }
   }
}
