package visuals.ui.elements.user_story
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolUserStoryVotingStarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUserStoryVotingStar = null;
      
      public var background:SymbolIconUserStoryVotingStarEmptryGeneric = null;
      
      public var fill:SymbolIconUserStoryVotingStarFillGeneric = null;
      
      public function SymbolUserStoryVotingStarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUserStoryVotingStar;
         }
         else
         {
            _nativeObject = new SymbolUserStoryVotingStar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolIconUserStoryVotingStarEmptryGeneric(_nativeObject.background);
         fill = new SymbolIconUserStoryVotingStarFillGeneric(_nativeObject.fill);
      }
      
      public function setNativeInstance(param1:SymbolUserStoryVotingStar) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.fill)
         {
            fill.setNativeInstance(_nativeObject.fill);
         }
      }
   }
}
