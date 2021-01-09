package visuals.ui.elements.user_story
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolIconUserStoryVotingStarEmptryGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconUserStoryVotingStarEmptry = null;
      
      public function SymbolIconUserStoryVotingStarEmptryGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconUserStoryVotingStarEmptry;
         }
         else
         {
            _nativeObject = new SymbolIconUserStoryVotingStarEmptry();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolIconUserStoryVotingStarEmptry) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
      }
   }
}
