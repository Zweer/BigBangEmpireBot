package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.user_story.SymbolUserStoryTagIconGeneric;
   
   public class SymbolQuestUserStoryGraphicGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolQuestUserStoryGraphic = null;
      
      public var iconTag:SymbolUserStoryTagIconGeneric = null;
      
      public var swish:SymbolRewardSwishGeneric = null;
      
      public var effect:SymbolPlaceholderGeneric = null;
      
      public function SymbolQuestUserStoryGraphicGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolQuestUserStoryGraphic;
         }
         else
         {
            _nativeObject = new SymbolQuestUserStoryGraphic();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconTag = new SymbolUserStoryTagIconGeneric(_nativeObject.iconTag);
         swish = new SymbolRewardSwishGeneric(_nativeObject.swish);
         effect = new SymbolPlaceholderGeneric(_nativeObject.effect);
      }
      
      public function setNativeInstance(param1:SymbolQuestUserStoryGraphic) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconTag)
         {
            iconTag.setNativeInstance(_nativeObject.iconTag);
         }
         if(_nativeObject.swish)
         {
            swish.setNativeInstance(_nativeObject.swish);
         }
         if(_nativeObject.effect)
         {
            effect.setNativeInstance(_nativeObject.effect);
         }
      }
   }
}
