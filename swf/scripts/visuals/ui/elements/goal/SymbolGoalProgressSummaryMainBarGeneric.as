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
   
   public class SymbolGoalProgressSummaryMainBarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalProgressSummaryMainBar = null;
      
      public var progressBar:SymbolProgressBarBigGeneric = null;
      
      public var txtProgress:ILabel = null;
      
      public var txtName:ILabel = null;
      
      public var btnSwitch:SymbolButtonArrowRightGeneric = null;
      
      public function SymbolGoalProgressSummaryMainBarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalProgressSummaryMainBar;
         }
         else
         {
            _nativeObject = new SymbolGoalProgressSummaryMainBar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         progressBar = new SymbolProgressBarBigGeneric(_nativeObject.progressBar);
         txtProgress = FlashLabel.fromNative(_nativeObject.txtProgress);
         txtName = FlashLabel.fromNative(_nativeObject.txtName);
         btnSwitch = new SymbolButtonArrowRightGeneric(_nativeObject.btnSwitch);
      }
      
      public function setNativeInstance(param1:SymbolGoalProgressSummaryMainBar) : void
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
         FlashLabel.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         FlashLabel.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.btnSwitch)
         {
            btnSwitch.setNativeInstance(_nativeObject.btnSwitch);
         }
      }
   }
}
