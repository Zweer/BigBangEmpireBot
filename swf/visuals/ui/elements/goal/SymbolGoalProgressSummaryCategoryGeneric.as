package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.generic.SymbolProgressBarBigGeneric;
   
   public class SymbolGoalProgressSummaryCategoryGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalProgressSummaryCategory = null;
      
      public var progressBar:SymbolProgressBarBigGeneric = null;
      
      public var txtCategoryName:ILabel = null;
      
      public var txtProgress:ILabel = null;
      
      public var btnSwitch:SymbolButtonArrowRightGeneric = null;
      
      public function SymbolGoalProgressSummaryCategoryGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalProgressSummaryCategory;
         }
         else
         {
            _nativeObject = new SymbolGoalProgressSummaryCategory();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         progressBar = new SymbolProgressBarBigGeneric(_nativeObject.progressBar);
         txtCategoryName = FlashLabel.fromNative(_nativeObject.txtCategoryName);
         txtProgress = FlashLabel.fromNative(_nativeObject.txtProgress);
         btnSwitch = new SymbolButtonArrowRightGeneric(_nativeObject.btnSwitch);
      }
      
      public function setNativeInstance(param1:SymbolGoalProgressSummaryCategory) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.progressBar)
         {
            progressBar.setNativeInstance(_nativeObject.progressBar);
         }
         FlashLabel.setNativeInstance(txtCategoryName,_nativeObject.txtCategoryName);
         FlashLabel.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         if(_nativeObject.btnSwitch)
         {
            btnSwitch.setNativeInstance(_nativeObject.btnSwitch);
         }
      }
   }
}
