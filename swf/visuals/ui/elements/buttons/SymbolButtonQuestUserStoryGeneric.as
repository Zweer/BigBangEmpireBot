package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.quest.SymbolQuestUserStoryGraphicGeneric;
   
   public class SymbolButtonQuestUserStoryGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonQuestUserStory = null;
      
      public var graphic:SymbolQuestUserStoryGraphicGeneric = null;
      
      public function SymbolButtonQuestUserStoryGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonQuestUserStory;
         }
         else
         {
            _nativeObject = new SymbolButtonQuestUserStory();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolQuestUserStoryGraphicGeneric(_nativeObject.graphic);
      }
      
      public function setNativeInstance(param1:SymbolButtonQuestUserStory) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.graphic)
         {
            graphic.setNativeInstance(_nativeObject.graphic);
         }
      }
   }
}
