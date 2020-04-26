package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconTitleGeneric;
   
   public class SymbolGoalInfoTtileRewardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalInfoTtileReward = null;
      
      public var txtRewardTitle:ILabel = null;
      
      public var iconTitle:SymbolIconTitleGeneric = null;
      
      public function SymbolGoalInfoTtileRewardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalInfoTtileReward;
         }
         else
         {
            _nativeObject = new SymbolGoalInfoTtileReward();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtRewardTitle = FlashLabel.fromNative(_nativeObject.txtRewardTitle);
         iconTitle = new SymbolIconTitleGeneric(_nativeObject.iconTitle);
      }
      
      public function setNativeInstance(param1:SymbolGoalInfoTtileReward) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtRewardTitle,_nativeObject.txtRewardTitle);
         if(_nativeObject.iconTitle)
         {
            iconTitle.setNativeInstance(_nativeObject.iconTitle);
         }
      }
   }
}
