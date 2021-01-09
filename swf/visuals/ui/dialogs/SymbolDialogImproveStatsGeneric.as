package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonFastSkillGeneric;
   import visuals.ui.elements.stats.SymbolImproveStatGeneric;
   
   public class SymbolDialogImproveStatsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogImproveStats = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtAvailablePoints:ILabelArea = null;
      
      public var strength:SymbolImproveStatGeneric = null;
      
      public var stamina:SymbolImproveStatGeneric = null;
      
      public var criticalRating:SymbolImproveStatGeneric = null;
      
      public var dodgeRating:SymbolImproveStatGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var btnFastSkill:SymbolButtonFastSkillGeneric = null;
      
      public function SymbolDialogImproveStatsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogImproveStats;
         }
         else
         {
            _nativeObject = new SymbolDialogImproveStats();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtAvailablePoints = FlashLabelArea.fromNative(_nativeObject.txtAvailablePoints);
         strength = new SymbolImproveStatGeneric(_nativeObject.strength);
         stamina = new SymbolImproveStatGeneric(_nativeObject.stamina);
         criticalRating = new SymbolImproveStatGeneric(_nativeObject.criticalRating);
         dodgeRating = new SymbolImproveStatGeneric(_nativeObject.dodgeRating);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         btnFastSkill = new SymbolButtonFastSkillGeneric(_nativeObject.btnFastSkill);
      }
      
      public function setNativeInstance(param1:SymbolDialogImproveStats) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtAvailablePoints,_nativeObject.txtAvailablePoints);
         if(_nativeObject.strength)
         {
            strength.setNativeInstance(_nativeObject.strength);
         }
         if(_nativeObject.stamina)
         {
            stamina.setNativeInstance(_nativeObject.stamina);
         }
         if(_nativeObject.criticalRating)
         {
            criticalRating.setNativeInstance(_nativeObject.criticalRating);
         }
         if(_nativeObject.dodgeRating)
         {
            dodgeRating.setNativeInstance(_nativeObject.dodgeRating);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnFastSkill)
         {
            btnFastSkill.setNativeInstance(_nativeObject.btnFastSkill);
         }
      }
   }
}
