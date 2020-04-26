package visuals.ui.elements.user_story
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolUserStoryVotingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUserStoryVoting = null;
      
      public var votingStar1:SymbolUserStoryVotingStarGeneric = null;
      
      public var votingStar2:SymbolUserStoryVotingStarGeneric = null;
      
      public var votingStar3:SymbolUserStoryVotingStarGeneric = null;
      
      public var votingStar4:SymbolUserStoryVotingStarGeneric = null;
      
      public var votingStar5:SymbolUserStoryVotingStarGeneric = null;
      
      public function SymbolUserStoryVotingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUserStoryVoting;
         }
         else
         {
            _nativeObject = new SymbolUserStoryVoting();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         votingStar1 = new SymbolUserStoryVotingStarGeneric(_nativeObject.votingStar1);
         votingStar2 = new SymbolUserStoryVotingStarGeneric(_nativeObject.votingStar2);
         votingStar3 = new SymbolUserStoryVotingStarGeneric(_nativeObject.votingStar3);
         votingStar4 = new SymbolUserStoryVotingStarGeneric(_nativeObject.votingStar4);
         votingStar5 = new SymbolUserStoryVotingStarGeneric(_nativeObject.votingStar5);
      }
      
      public function setNativeInstance(param1:SymbolUserStoryVoting) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.votingStar1)
         {
            votingStar1.setNativeInstance(_nativeObject.votingStar1);
         }
         if(_nativeObject.votingStar2)
         {
            votingStar2.setNativeInstance(_nativeObject.votingStar2);
         }
         if(_nativeObject.votingStar3)
         {
            votingStar3.setNativeInstance(_nativeObject.votingStar3);
         }
         if(_nativeObject.votingStar4)
         {
            votingStar4.setNativeInstance(_nativeObject.votingStar4);
         }
         if(_nativeObject.votingStar5)
         {
            votingStar5.setNativeInstance(_nativeObject.votingStar5);
         }
      }
   }
}
