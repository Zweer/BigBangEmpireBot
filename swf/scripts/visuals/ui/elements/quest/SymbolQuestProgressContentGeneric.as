package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolIconButtonReportGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.generic.SymbolTimeBarGeneric;
   
   public class SymbolQuestProgressContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolQuestProgressContent = null;
      
      public var bg:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var timeBar:SymbolTimeBarGeneric = null;
      
      public var txtTimeLeft:ILabelArea = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var btnCancel:SymbolUiButtonDefaultGeneric = null;
      
      public var btnInstantFinish:SymbolButtonPremiumGeneric = null;
      
      public var txtUserStoryInfo:ILabelArea = null;
      
      public var btnReportUserStory:SymbolIconButtonReportGeneric = null;
      
      public function SymbolQuestProgressContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolQuestProgressContent;
         }
         else
         {
            _nativeObject = new SymbolQuestProgressContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.bg);
         timeBar = new SymbolTimeBarGeneric(_nativeObject.timeBar);
         txtTimeLeft = FlashLabelArea.fromNative(_nativeObject.txtTimeLeft);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         btnCancel = new SymbolUiButtonDefaultGeneric(_nativeObject.btnCancel);
         btnInstantFinish = new SymbolButtonPremiumGeneric(_nativeObject.btnInstantFinish);
         txtUserStoryInfo = FlashLabelArea.fromNative(_nativeObject.txtUserStoryInfo);
         btnReportUserStory = new SymbolIconButtonReportGeneric(_nativeObject.btnReportUserStory);
      }
      
      public function setNativeInstance(param1:SymbolQuestProgressContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.timeBar)
         {
            timeBar.setNativeInstance(_nativeObject.timeBar);
         }
         FlashLabelArea.setNativeInstance(txtTimeLeft,_nativeObject.txtTimeLeft);
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         if(_nativeObject.btnCancel)
         {
            btnCancel.setNativeInstance(_nativeObject.btnCancel);
         }
         if(_nativeObject.btnInstantFinish)
         {
            btnInstantFinish.setNativeInstance(_nativeObject.btnInstantFinish);
         }
         FlashLabelArea.setNativeInstance(txtUserStoryInfo,_nativeObject.txtUserStoryInfo);
         if(_nativeObject.btnReportUserStory)
         {
            btnReportUserStory.setNativeInstance(_nativeObject.btnReportUserStory);
         }
      }
   }
}
